note
	description: "Notion of a Data Access Table."

deferred class
	DA_TABLE

feature -- Access

	name: STRING
			--
		deferred
		end

	fields: ARRAYED_LIST [DA_FIELD [detachable ANY, detachable ANY]]
			-- A list of `fields'.
		attribute
			create Result.make (10)
		end

	children: ARRAYED_LIST [DA_TABLE]
			-- A list of `children' tables.
		attribute
			create Result.make (10)
		end

feature -- Settings

	add_field (a_field: DA_FIELD [detachable ANY, detachable ANY])
			-- Add `a_field' to `fields'.
		do
			fields.force (a_field)
		end

	add_fields (a_fields: ARRAY [DA_FIELD [detachable ANY, detachable ANY]])
			--
		do
			across
				a_fields as ic
			loop
				add_field (ic.item)
			end
		end

	add_child_table (a_table: DA_TABLE)
			-- Add `a_table' to `children'
		do
			children.force (a_table)
		end

	add_children (a_tables: ARRAY [DA_TABLE])
			-- Add to `a_tables' to `children'
		do
			across
				a_tables as ic
			loop
				add_child_table (ic.item)
			end
		end

feature -- Output

	create_sql_statement: STRING
			--
		do
			create Result.make_empty
			Result.append_string_general (" CREATE ")
			Result.append_character (';')
		end

	select_sql_statement: STRING
			--
		do
			create Result.make_empty
			Result.append_string_general (" SELECT ")
			Result.append_string_general (fields_csv_list)
			Result.append_string_general (" FROM ")
			Result.append_string_general (name)
			if attached where_clause as al_where_clause and then not al_where_clause.is_empty then
				Result.append_string_general (" WHERE ")
				Result.append_string_general (al_where_clause)
			end
			Result.append_character (';')
		end

	insert_sql_statement: STRING
			--
		do
			create Result.make_empty
			Result.append_string_general (" INSERT ")
			Result.append_character (';')
		end

	delete_sql_statement: STRING
			--
		do
			create Result.make_empty
			Result.append_string_general (" DELETE ")
			Result.append_character (';')
		end

feature {NONE} -- Implementation

	where_clause: STRING
			-- Build a `where_clause' from `fields'.
		local
			l_clause: STRING
		do
			create Result.make_empty
			across
				fields as ic
			loop
				l_clause := ic.item.where_out
				if ic.cursor_index > 1 and not l_clause.is_empty then
					Result.append_string_general (" AND ")
				end
				Result.append_string_general (l_clause)
			end
		end

	fields_csv_list: STRING
			-- Build a CSV list of `fields'.
		do
			create Result.make_empty
			across
				fields as ic
			loop
				Result.append_string_general (ic.item.name)
				if ic.cursor_index < fields.count then
					Result.append_character (',')
					Result.append_character (' ')
				end
			end
		end

end
