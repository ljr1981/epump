note
	description: "Demonstration of {EV_GRID_EXT}"
	testing: "type/manual"

class
	EV_GRID_EXT_TEST_SET

inherit
	TEST_SET_SUPPORT_VISION2

feature -- Test routines

	ev_grid_ext_demo
			-- Demonstration of a basic JV_GRID
		note
			testing:  "covers/{EV_GRID}.make_with_text", "execution/isolated", "execution/serial"
			usage: "Set `show_me' to True, recompile, and run this test to interact with `l_item'."
			explanation: "[
				This is an empty grid with nothing in it.
				No columns. No rows. No cells (as a result).
				]"
		local
			l_item: EV_GRID_EXT
		do
				-- Standard Creation
			create l_item

				-- Setup and Demo
			show_me := False
			demonstrate_widget (l_item)
		end

	ev_grid_ext_populated_sidexside_demo
			-- Demonstration of a basic EV_GRID with rows and columns.
		note
			testing:  "covers/{EV_GRID_EXT}.default_create", "execution/isolated", "execution/serial"
			usage: "Set `show_me' to True, recompile, and run this test to interact with `l_item'."
			explanation: "[
				This grid adds a couple columns and rows.
				It also adds some grid common grid items.
				]"
		local
			l_grid_ext: EV_GRID_EXT
			l_grid: EV_GRID
			l_container: EV_HORIZONTAL_SPLIT_AREA
		do
				-- Standard Creation
			create l_grid_ext
			create l_grid

				-- Custom Enhancements
			l_grid_ext.enable_row_colorizing
			l_grid_ext.enable_enter_key_tabbing

				-- Build
			build_complex_grid (l_grid_ext)
			build_complex_grid (l_grid)

				-- Setup and Demo
			create l_container
			l_container.extend (l_grid_ext)
			l_container.extend (l_grid)

			show_me := False
			demonstrate_widget (l_container)
		end

	on_editable_select (a_popup: EV_POPUP_WINDOW; a_field: detachable EV_TEXT_FIELD)
			-- One way to support {EV_GRID_EDITABLE_ITEM} activation
			--	for doing a "select_all" on the resulting text field.
		do
			if attached a_field as al_field then
				al_field.select_all
			end
		end

feature {NONE} -- Implementation: Grid Setup

	build_complex_grid (a_item: EV_GRID)
			--
		local
			l_checkable: EV_GRID_CHECKABLE_LABEL_ITEM
			l_choice: EV_GRID_CHOICE_ITEM
			l_combo: EV_GRID_COMBO_ITEM
			l_drawable: EV_GRID_DRAWABLE_ITEM
			l_editable: EV_GRID_EDITABLE_ITEM
			l_label: EV_GRID_LABEL_ITEM
			l_pix_right: EV_GRID_PIXMAPS_ON_RIGHT_LABEL_ITEM
		do
				-- Enhancements
			a_item.set_minimum_size (300, 400) -- Let's see it ...

				-- Adding "cells" as {EV_GRID_LABEL_ITEM}s
			a_item.set_item (1, 1, create {EV_GRID_LABEL_ITEM}.make_with_text ("c1,r1"))
			a_item.set_item (1, 2, create {EV_GRID_LABEL_ITEM}.make_with_text ("c1,r2"))
			a_item.set_item (2, 1, create {EV_GRID_LABEL_ITEM}.make_with_text ("c2,r1"))
			a_item.set_item (2, 2, create {EV_GRID_LABEL_ITEM}.make_with_text ("c2,r2"))
				-- Alt method ...
			create l_label.make_with_text ("c3,r1")
			a_item.set_item (3, 2, l_label)

			a_item.column (1).set_width (150)

				-- CHECKABLE item
			create l_checkable.make_with_text ("I am checkable?")
			a_item.set_item (1, 3, l_checkable)

				-- CHOICE item (dropdown list)
			create l_choice.make_with_text ("I have a choice!")
			l_choice.set_item_strings (<<"Choice 1", "Choice 2", "Choice 3">>)
			a_item.set_item (1, 4, l_choice)
			l_choice.enable_full_select -- `l_choice' need a "parent" before this
			l_choice.select_actions.force (agent l_choice.activate) -- We are responsible for `activate'

				-- COMBO 1 (editable combo)
				-- We can edit whatever is selected or in the edit box.
			create l_combo.make_with_text ("Edit combo")
			a_item.set_item (1, 5, l_combo)
			l_combo.set_item_strings (<<"Item 1", "Item 2", "Item 3", "Item 4">>) -- set items
			l_combo.select_actions.extend (agent l_combo.activate) -- handle activation

				-- COMBO 2 (non-editable combo)
				-- We can only select items from the dropdown list.
			create l_combo.make_with_text ("Non-edit combo")
			a_item.set_item (1, 6, l_combo)
			l_combo.set_item_strings (<<"Item 1", "Item 2", "Item 3", "Item 4">>) -- set items
			l_combo.select_actions.extend (agent l_combo.activate) -- handle activation

				-- DRAWABLE
				-- See also: EV_DRAWING_AREA (a similar thing)
			create l_drawable
			a_item.set_item (1, 7, l_drawable)

				-- EDITABLE
			create l_editable.make_with_text ("You can edit me")
			a_item.set_item (1, 8, l_editable)
			l_editable.activate_actions.extend (agent on_editable_select (?, l_editable.text_field))
			l_editable.select_actions.extend (agent l_editable.activate) -- handle activation

				-- PIX RIGHT
				-- similar to EV_GRID_LABEL_ITEM, except it has extra pixmaps on the right
			create l_pix_right.make_with_text ("Pix right")
			a_item.set_item (1, 9, l_pix_right)
			l_pix_right.set_pixmap ((create {EV_STOCK_PIXMAPS_IMP}).information_pixmap)
			l_pix_right.set_pixmaps_on_right_count (1) -- prep-step to putting pix on right
			l_pix_right.put_pixmap_on_right ((create {EV_STOCK_PIXMAPS_IMP}).information_pixmap, 1) -- in posn we just created

				-- Once we have columns, we can populate the {EV_GRID_HEADER_ITEM} over each.
				-- Note that as each column is created, it automatically gets
				--	an empty header item. We then get to enhance it however we want.
				--	In this case, we are adding header text.
			a_item.column (1).header_item.set_text ("Col 1")
			a_item.column (2).header_item.set_text ("Col 2")
				-- An alternative way ...
			a_item.header [1].set_text ("Alt Col 1")
			a_item.header [2].set_text ("Alt Col 2")
			a_item.header [3].set_text ("Alt Col 3")
		end

end
