note
	description: "Access to stock colors."

class
	EV_STOCK_COLORS_EXT

feature -- Theme

	valid_color: EV_COLOR
			-- Foreground color to indicate validity.
		once
			Result := black
		end

	invalid_color: EV_COLOR
			-- Foreground color to indicate invalidity.
		once
			Result := red
		end

	warning_color: EV_COLOR
			-- Foreground color to indicate validity.
		once
			Result := brown
		end

	invalid_background_color: EV_COLOR
			-- Background color to indicate invalidity.
		once
			Result := peach_puff
		end

	loaded_invalid_color: EV_COLOR
			-- Background color to indicate data was invalid coming from the database
		once
			Result := orange
		end

	default_background_color: EV_COLOR
			-- Preferred background color for GUI elements.
		once
			Result := white
		end

	default_focus_background_color: EV_COLOR
			-- Preferred background color for focused GUI elements.
		once
			Result := mint_cream
		end

	default_suggestion_field_focus_color: EV_COLOR
			-- Preferred background color for focused suggestion elements.
		once
			Result := alice_blue
		end

	default_slider_color: EV_COLOR
			-- Preferred color for sliders.
		once
			Result := windows_default_background_color
		end

	default_section_header_color: EV_COLOR
			-- Preferred color for the section headers.
		once
			Result := light_blue
		end

	default_list_odd_row_background_color: EV_COLOR
			-- Preferred background color for every other row in a list.
		once
			Result := white
		end

	default_list_even_row_background_color: EV_COLOR
			-- Preferred background color for every other row in a list.
		once
			Result := gainsboro
		end

	default_selected_list_item_background_color: EV_COLOR
			-- Preferred background color for a selected list item.
		once
			Result := light_blue
		end

	default_selected_list_item_foreground_color: EV_COLOR
			-- Preferred foreground color for a selected list item.
		once
			Result := black
		end

	default_non_focused_selected_list_item_background_color: EV_COLOR
			-- Preferred background color for a selected list item when the control does not have the focus.
		local
			l_scale: REAL
		once
			l_scale := 1.1
			Result := default_selected_list_item_background_color.twin
			Result.set_blue (Result.blue * l_scale)
			Result.set_red (Result.red * l_scale)
			Result.set_green (Result.green * l_scale)
		end

	default_non_focused_selected_list_item_foreground_color: EV_COLOR
			-- Preferred foreground color for a selected list item when the control does not have the focus.
		once
			Result := black
		end

	default_deleted_foreground_color: EV_COLOR
			-- Preferred foreground color for an GUI object representing a deleted item.
		do
			Result := silver
		end

	default_login_background_color: EV_COLOR
			-- Preferred background color for every other row in a list.
		once
			Result := white
		end

	default_grayed_out_text_color, default_greyed_out_text_color: EV_COLOR
			-- Preferred shade of gray for grayed out text.
		once
			Result := dim_gray
		end

	default_helper_text_color: EV_COLOR
			-- Preferred color of helper text in text entry controls.
		once
			Result := dim_gray
		end

	active_for_edit_background_color: EV_COLOR
			-- Default color for an item that is active for editting.
		once
			Result := white
		end

feature -- Access: Reds

	chestnut: EV_COLOR
			-- (149, 69, 53)
			-- Chestnut, also known as Indian red, is a color, a medium brownish shade of red.
		once
			create Result.make_with_8_bit_rgb (149, 69, 53)
		end

	indian_red: EV_COLOR
			-- (205, 92, 92)
			-- Indian red is a brighter version of `chestnut'.
		once
			create Result.make_with_8_bit_rgb (205, 92, 92)
		end

	light_coral: EV_COLOR
			-- (240, 128, 128)
			-- A pastel shade of red.
		once
			create Result.make_with_8_bit_rgb (240, 128, 128)
		end

	salmon: EV_COLOR
			-- (250, 128, 114)
			-- Pale pinkish-orange.
		once
			create Result.make_with_8_bit_rgb (250, 128, 114)
		end

	dark_salmon: EV_COLOR
			-- (233, 150, 122)
			-- A darker shade of `salmon'.
		once
			create Result.make_with_8_bit_rgb (233, 150, 122)
		end

	light_salmon: EV_COLOR
			-- (250, 160, 122)
			-- A brighter shade of `salmon'
		once
			create Result.make_with_8_bit_rgb (250, 160, 122)
		end

	crimson: EV_COLOR
			-- (220, 20, 60)
			-- A strong, bright, deep red color
		once
			create Result.make_with_8_bit_rgb (220, 20, 60)
		end

	red: EV_COLOR
			-- (255, 0, 0)
			-- A wavelength of light roughly 630-740 nm.
			-- Associated with aggression, love, negativity, passion, socialism, communism, Valentine's Day, heat,
			-- fire, beauty, leadership, injury, danger, blood, Christmas, volcanoes, American conservatism, and error.
		once
			create Result.make_with_8_bit_rgb (255, 0, 0)
		end

	fire_brick: EV_COLOR
			-- (178, 34, 34)
			-- A medium shade of scarlet/red.
		once
			create Result.make_with_8_bit_rgb (178, 34, 34)
		end

	dark_red: EV_COLOR
			-- (139, 0, 0)
			-- A brighter shade of `maroon'.
		once
			create Result.make_with_8_bit_rgb (139, 0, 0)
		end

feature -- Access: Pinks

	pink: EV_COLOR
			-- (255, 192, 203)
			-- A mixture of red and white.
			-- Associated with girls, love, health, breast cancer awareness, fairies,
			-- Valentine's Day, spring, Easter, beauty, cuteness, and glamor.
		once
			create Result.make_with_8_bit_rgb (255, 192, 203)
		end

	light_pink: EV_COLOR
			-- (255, 182, 193)
			-- Actually a deeper shade of pink. Otherwise known as medium pink.
		once
			create Result.make_with_8_bit_rgb (255, 182, 193)
		end

	hot_pink: EV_COLOR
			-- (255, 105, 180)
			-- A deeper tone than `light_pink' and brighter tone than `deep_pink'.
		once
			create Result.make_with_8_bit_rgb (255, 105, 180)
		end

	deep_pink: EV_COLOR
			-- (255, 20, 147)
			-- Darkest pink tone.
		once
			create Result.make_with_8_bit_rgb (255, 20, 147)
		end

	medium_violet_red: EV_COLOR
			-- (199, 21, 133)
			-- A red-violet color.
		once
			create Result.make_with_8_bit_rgb (199, 21, 133)
		end

	pale_violet_red: EV_COLOR
			-- (219, 112, 147)
			-- A brighter shade of red-violet.
		once
			create Result.make_with_8_bit_rgb (219, 112, 147)
		end

feature -- Colors: Oranges

	coral: EV_COLOR
			-- (255, 127, 80)
			-- A light pinkish-orange.
		once
			create Result.make_with_8_bit_rgb (255, 127, 80)
		end

	tomato: EV_COLOR
			-- (255, 99, 71)
			-- A medium red.
		once
			create Result.make_with_8_bit_rgb (255, 99, 71)
		end

	orange_red: EV_COLOR
			-- (255, 69, 0)
			-- See feature name.
		once
			create Result.make_with_8_bit_rgb (255, 69, 0)
		end

	dark_orange: EV_COLOR
			-- (255, 140, 0)
			-- A darker shade of orange.
		once
			create Result.make_with_8_bit_rgb (255, 140, 0)
		end

	orange: EV_COLOR
			-- (255, 165, 0)
			-- Associated with warning, autumn, desire, fire, Halloween, Thanksgiving, prisoners, Orangism (Netherlands),
			-- Unionism in Ireland, Indian religions, engineering, determination, compassion, endurance, and optimism
		once
			create Result.make_with_8_bit_rgb (255, 165, 0)
		end

feature -- Colors: Yellows

	gold: EV_COLOR
			-- (255, 215, 0)
			-- One of a variety of orange-yellow color blends used to give the impression of the color of the element gold.
		once
			create Result.make_with_8_bit_rgb (255, 215, 0)
		end

	yellow: EV_COLOR
			-- (255, 255, 0)
			-- Yellow is the color evoked by light that stimulates both the L and M (long and medium wavelength) cone cells of the retina about equally.
			-- Associated with sunshine, warmth, fun, happiness, warning, friendship, caution, slow, intelligence, cowardice, love, Mardi Gras, summer,
			-- lemons, Easter, autumn, electricity, liberalism/libertarianism, hope, optimism, imagination, curiosity, surprise and thrill.
		once
			create Result.make_with_8_bit_rgb (255, 255, 0)
		end

	light_yellow: EV_COLOR
			-- (255, 255, 224)
			-- A pastel shade of yellow.
		once
			create Result.make_with_8_bit_rgb (255, 255, 224)
		end

	lemon_chiffon: EV_COLOR
			-- (255, 250, 205)
			-- Reminiscent of the color of lemon chiffon cake.
		once
			create Result.make_with_8_bit_rgb (255, 250, 205)
		end

	light_goldenrod_yellow: EV_COLOR
			-- (250, 250, 205)
			-- An off-white with a yellow tint.
		once
			create Result.make_with_8_bit_rgb (250, 250, 210)
		end

	papaya_whip: EV_COLOR
			-- (255, 239, 213)
			-- A pale tint of orange.
		once
			create Result.make_with_8_bit_rgb (255, 239, 213)
		end

	moccasin: EV_COLOR
			-- (255, 228, 181)
			-- A light beige color.
		once
			create Result.make_with_8_bit_rgb (255, 228, 181)
		end

	peach_puff: EV_COLOR
			-- (255, 218, 185)
			-- A pinkish-orange color that is a darker shade of peach.
		once
			create Result.make_with_8_bit_rgb (255, 218, 185)
		end

	pale_goldenrod: EV_COLOR
			-- (238, 232, 170)
			-- A bright shade of yellow.
		once
			create Result.make_with_8_bit_rgb (238, 232, 170)
		end

	khaki: EV_COLOR
			-- (240, 230, 140)
			-- Hindustani word meaning "dusty, dust covered or earth covered."
		once
			create Result.make_with_8_bit_rgb (240, 230, 140)
		end

	dark_khaki: EV_COLOR
			-- (189, 183, 107)
			-- A darker shade of `khaki'.
		once
			create Result.make_with_8_bit_rgb (189, 183, 107)
		end

feature -- Colors: Purples

	lavender: EV_COLOR
			-- (230, 230, 250)
			-- A pale tint of violet.
		once
			create Result.make_with_8_bit_rgb (230, 230, 250)
		end

	thistle: EV_COLOR
			-- (216, 191, 216)
			-- A pale purple-ish color resembling the thistle plant.
		once
			create Result.make_with_8_bit_rgb (216, 191, 216)
		end

	plum: EV_COLOR
			-- (221, 160, 221)
			-- This shade of plum is a representation of the color that would result if mashed plums were blended with vanilla ice cream, whipped cream, or yogurt.
		once
			create Result.make_with_8_bit_rgb (221, 160, 221)
		end

	violet: EV_COLOR
			-- (238, 130, 238)
			-- A bluish purple, around approximately 380-450 nm wavelength on the visible spectrum.
		once
			create Result.make_with_8_bit_rgb (238, 130, 238)
		end

	orchid: EV_COLOR
			-- (218, 112, 214)
			-- A light purple color.
		once
			create Result.make_with_8_bit_rgb (218, 112, 214)
		end

	fuchsia: EV_COLOR
			-- Alias of magenta.
			-- A vivid reddish or pinkish purple color.
		once
			Result := magenta
		end

	magenta: EV_COLOR
			-- (255, 0, 255)
			-- A vivid reddish or pinkish purple color.
		once
			create Result.make_with_8_bit_rgb (255, 0, 255)
		end

	medium_orchid: EV_COLOR
			-- (186, 85, 211)
			-- A darker shade of `orchid'.
		once
			create Result.make_with_8_bit_rgb (186, 85, 211)
		end

	medium_purple: EV_COLOR
			-- (147, 112, 219)
			-- A medium shade of `purple'.
		once
			create Result.make_with_8_bit_rgb (147, 112, 219)
		end

	amethyst: EV_COLOR
			-- (153, 102, 204)
			-- A moderate shade of `purple'.
		once
			create Result.make_with_8_bit_rgb (153, 102, 204)
		end

	deep_indigo: EV_COLOR
			-- Alias of `blue_violet'.
			-- A brighter shade of `violet' with some blue mixed in.
		once
			Result := blue_violet
		end

	blue_violet: EV_COLOR
			-- (138, 43, 226)
			-- A brighter shade of `violet' with some blue mixed in.
		once
			create Result.make_with_8_bit_rgb (138, 43, 226)
		end

	dark_violet: EV_COLOR
			-- (148, 0, 211)
			-- A shade of violet with more red-magenta mixed in.
		once
			create Result.make_with_8_bit_rgb (148, 0, 211)
		end

	dark_orchid: EV_COLOR
			-- (153, 50, 204)
			-- A darker shade of `orchid' than `medium_orchid'.
		once
			create Result.make_with_8_bit_rgb (153, 50, 204)
		end

	dark_magenta: EV_COLOR
			-- (139, 0, 139)
			-- A darker shade of `magenta'.
		once
			create Result.make_with_8_bit_rgb (139, 0, 139)
		end

	purple: EV_COLOR
			-- (128, 0, 128)
			-- A mix of red and blue.
			-- Associated with royalty, imperialism, nobility, Lent, Easter, Mardi Gras, episcopacy, upper class, poison,
			-- friendship, passion, sharing, wisdom, rage, contrition, sympathy, extreme and sophistication.
		once
			create Result.make_with_8_bit_rgb (128, 0, 128)
		end

	indigo: EV_COLOR
			-- (75, 0, 130)
			-- A color between blue and violet.
		once
			create Result.make_with_8_bit_rgb (75, 0, 130)
		end

	slate_blue: EV_COLOR
			-- (106, 90, 205)
			-- A bluish-grey color.
		once
			create Result.make_with_8_bit_rgb (106, 90, 205)
		end

	dark_slate_blue: EV_COLOR
			-- (72, 61, 139)
			-- A darker shade of `slate_blue'.
		once
			create Result.make_with_8_bit_rgb (72, 61, 139)
		end

feature -- Colors: Greens

	green_gold: EV_COLOR
			-- Alias of `green_yellow'
			-- A mixture of the colors `green' and `yellow'.
		once
			Result := green_yellow
		end

	green_yellow: EV_COLOR
			-- (173, 255, 47)
			-- A mixture of the colors `green' and `yellow'.
		once
			create Result.make_with_8_bit_rgb (173, 255, 47)
		end

	chartreuse: EV_COLOR
			-- (127, 255, 0)
			-- A color half-way between green and yellow.
		once
			create Result.make_with_8_bit_rgb (127, 255, 0)
		end

	lawn_green: EV_COLOR
			-- (124, 252, 0)
			-- A color just a tint darker than `chartreuse'
		once
			create Result.make_with_8_bit_rgb (124, 252, 0)
		end

	lime: EV_COLOR
			-- (0, 255, 0)
			-- Three-fourths of the way between yellow and green (closer than yellow than green).
			-- Also known as the green primary in RGB.
		once
			create Result.make_with_8_bit_rgb (0, 255, 0)
		end

	lime_green: EV_COLOR
			-- (50, 205, 50)
			-- A darker shade of `lime'.
		once
			create Result.make_with_8_bit_rgb (50, 205, 50)
		end

	pale_green: EV_COLOR
			-- (152, 251, 152)
			-- A pastel shade of `green'.
		once
			create Result.make_with_8_bit_rgb (152, 251, 152)
		end

	light_green: EV_COLOR
			-- (144, 238, 144)
			-- A darker shade of `pale_green'.
		once
			create Result.make_with_8_bit_rgb (144, 238, 144)
		end

	medium_spring_green: EV_COLOR
			-- Alias of `spring_green'.
			-- A cross between green and cyan.
		once
			Result := spring_green
		end

	spring_green: EV_COLOR
			-- (0, 255, 127)
			-- A cross between green and cyan.
		once
			create Result.make_with_8_bit_rgb (0, 255, 127)
		end

	medium_sea_green: EV_COLOR
			-- (60, 179, 113)
			-- A medium shade of `spring_green'.
		once
			create Result.make_with_8_bit_rgb (60, 179, 113)
		end

	sea_green: EV_COLOR
			-- (46, 139, 34)
			-- A medium dark shade of `spring_green'.
		once
			create Result.make_with_8_bit_rgb (46, 139, 34)
		end

	forest_green: EV_COLOR
			-- (34, 139, 34)
			-- Resembles the green of trees and other plants in a forest.
		once
			create Result.make_with_8_bit_rgb (34, 139, 34)
		end

	green: EV_COLOR
			-- (0, 128, 0)
			-- As seen on a color wheel based on the RYB color theory.
			-- Associated with nature, growth, hope, youth, sickness, health,
			-- Islam, spring, Saint Patrick's Day, money (US), and envy.
		once
			create Result.make_with_8_bit_rgb (0, 128, 0)
		end

	dark_green: EV_COLOR
			-- (0, 100, 0)
			-- A darker shade of `green'.
		once
			create Result.make_with_8_bit_rgb (0, 100, 0)
		end

	yellow_green: EV_COLOR
			-- (154, 205, 50)
			-- A dull medium shade of `chartreuse'.
		once
			create Result.make_with_8_bit_rgb (154, 205, 50)
		end

	olive_drab: EV_COLOR
			-- (107, 152, 35)
			-- `olive' shaded toward a greener color.
		once
			create Result.make_with_8_bit_rgb (107, 152, 35)
		end

	olive: EV_COLOR
			-- (128, 128, 0)
			-- A dark shade of yellow typically seen on green olives.
		once
			create Result.make_with_8_bit_rgb (128, 128, 0)
		end

	dark_olive_green: EV_COLOR
			-- (85, 107, 47)
			-- A darker shade of `olive_drab'.
		once
			create Result.make_with_8_bit_rgb (85, 107, 47)
		end

	medium_aquamarine: EV_COLOR
			-- (102, 205, 170)
			-- A medium tint of `spring_green' tinted toward `cyan'.
		once
			create Result.make_with_8_bit_rgb (102, 205, 170)
		end

	dark_sea_green: EV_COLOR
			-- (143, 188, 143)
			-- A bright shade of lime tinted toward gray.
		once
			create Result.make_with_8_bit_rgb (143, 188, 143)
		end

	light_sea_green: EV_COLOR
			-- (32, 178, 170)
			-- A darker shade of `cyan' tinted slightly twoard green.
		once
			create Result.make_with_8_bit_rgb (32, 178, 170)
		end

	dark_cyan: EV_COLOR
			-- (0, 139, 139)
			-- A darker shade of `cyan'.
		once
			create Result.make_with_8_bit_rgb (0, 139, 139)
		end

	teal: EV_COLOR
			-- (0, 128, 128)
			-- A medium blue-green color.
		once
			create Result.make_with_8_bit_rgb (0, 128, 128)
		end

feature -- Colors: Blues

	jloft_blue: EV_COLOR
			-- (75, 103, 195)
			-- JLOFT blue color.
		once
			create Result.make_with_8_bit_rgb (75, 103, 195)
		end

	aqua: EV_COLOR
			-- Alias of `cyan'.
		once
			Result := cyan
		end

	cyan: EV_COLOR
			-- (0, 255, 255)
			-- A primary color in the CYMK color model.
		once
			create Result.make_with_8_bit_rgb (0, 255, 255)
		end

	light_cyan: EV_COLOR
			-- (244, 255, 255)
			-- A very bright shade of `cyan'.
		once
			create Result.make_with_8_bit_rgb (244, 255, 255)
		end

	pale_turquoise: EV_COLOR
			-- (175, 238, 238)
			-- A bright slightly greenish tone of `cyan'.
		once
			create Result.make_with_8_bit_rgb (175, 238, 238)
		end

	aquamarine: EV_COLOR
			-- (127, 255, 212)
			-- A pale bright tint of `spring_green' toward `cyan'.
		once
			create Result.make_with_8_bit_rgb (127, 255, 212)
		end

	turquoise: EV_COLOR
			-- (64, 224, 208)
			-- A slightly greenish tone of `cyan'.
		once
			create Result.make_with_8_bit_rgb (64, 224, 208)
		end

	medium_turquoise: EV_COLOR
			-- (64, 224, 208)
			-- A medium slightly greenish tone of `cyan'.
		once
			create Result.make_with_8_bit_rgb (72, 209, 204)
		end

	dark_turquoise: EV_COLOR
			-- (64, 224, 208)
			-- A dark greenish tone of `cyan'.
		once
			create Result.make_with_8_bit_rgb (0, 206, 209)
		end

	cadet_blue: EV_COLOR
			-- (95, 158, 160)
			-- A bluish-grey color.
		once
			create Result.make_with_8_bit_rgb (95, 158, 160)
		end

	steel_blue: EV_COLOR
			-- (70, 130, 130)
			-- A shade of blue that resembles steel.
		once
			create Result.make_with_8_bit_rgb (70, 130, 130)
		end

	light_steel_blue: EV_COLOR
			-- (176, 196, 222)
			-- A lighter shade of `steel blue'.
		once
			create Result.make_with_8_bit_rgb (176, 196, 222)
		end

	powder_blue: EV_COLOR
			-- (176, 224, 230)
			-- Like a blue-tinted baby powder.
		once
			create Result.make_with_8_bit_rgb (176, 224, 230)
		end

	light_blue: EV_COLOR
			-- (173, 216, 230)
			-- A lighter shade of `blue'.
		once
			create Result.make_with_8_bit_rgb (173, 216, 230)
		end

	sky_blue: EV_COLOR
			-- (135, 206, 235)
			-- The shade of blue the sky is during a sunny day.
		once
			create Result.make_with_8_bit_rgb (135, 206, 235)
		end

	light_sky_blue: EV_COLOR
			-- (135, 206, 250)
			-- A slightly lighter shade of `sky_blue'.
		once
			create Result.make_with_8_bit_rgb (135, 206, 250)
		end

	deep_sky_blue: EV_COLOR
			-- (0, 191, 255)
			-- A dark shade of `sky_blue'.
		once
			create Result.make_with_8_bit_rgb (0, 191, 255)
		end

	dodger_blue: EV_COLOR
			-- (30, 144, 255)
			-- The shade of blue used in the uniform for the Los Angeles Dodgers.
		once
			create Result.make_with_8_bit_rgb (30, 144, 255)
		end

	cornflower_blue: EV_COLOR
			-- (100, 149, 237)
			-- A shade of azure, is a shade of light blue with relatively little green compared to blue.
		once
			create Result.make_with_8_bit_rgb (100, 149, 237)
		end

	medium_slate_blue: EV_COLOR
			-- (123, 104, 238)
			-- A pastel gray-bluish color.
		once
			create Result.make_with_8_bit_rgb (123, 104, 238)
		end

	royal_blue: EV_COLOR
			-- (65, 105, 225)
			-- A deep blue.
		once
			create Result.make_with_8_bit_rgb (65, 105, 225)
		end

	blue: EV_COLOR
			-- (0, 0, 255)
			-- The perception of which is evoked by light having a spectrum dominated by energy with a wavelength of roughly 440-490 nm.
			-- Associated with ice, water, sky, sadness, winter, royalty, boys, cold, calm, magic, trueness, conservatism (universally), liberalism (US), and capitalism.
		once
			create Result.make_with_8_bit_rgb (0, 0, 255)
		end

	medium_blue: EV_COLOR
			-- (0, 0, 205)
			-- A darker shade of `blue'.
		once
			create Result.make_with_8_bit_rgb (0, 0, 205)
		end

	dark_blue: EV_COLOR
			-- (0, 0, 139)
			-- A darker shade of `medium_blue'.
		once
			create Result.make_with_8_bit_rgb (0, 0, 139)
		end

	navy: EV_COLOR
			-- (0, 0, 128)
			-- A darker shade of `dark_blue'.
		once
			create Result.make_with_8_bit_rgb (0, 0, 128)
		end

	navy_blue: EV_COLOR
			-- (0, 0, 128)
			-- A darker shade of `dark_blue'.
		do
			Result := navy
		end

	midnight_blue: EV_COLOR
			-- (25, 25, 112)
			-- A dark shade of blue or indigo.
		once
			create Result.make_with_8_bit_rgb (25, 25, 112)
		end

feature -- Colors: Browns

	cornsilk: EV_COLOR
			-- (255, 248, 220)
			-- A very light yellow color.
		once
			create Result.make_with_8_bit_rgb (255, 248, 220)
		end

	blanched_almond: EV_COLOR
			-- (255, 235, 205)
			-- A subtle shade of yellow.
		once
			create Result.make_with_8_bit_rgb (255, 235, 205)
		end

	bisque: EV_COLOR
			-- (255, 228, 196)
			-- A pale pinkish brown color.
		once
			create Result.make_with_8_bit_rgb (255, 228, 196)
		end

	navajo_white: EV_COLOR
			-- (255, 222, 173)
			-- An orangish-white color.
		once
			create Result.make_with_8_bit_rgb (255, 222, 173)
		end

	wheat: EV_COLOR
			-- (245, 222, 179)
			-- A light brown color, like that of wheat.
		once
			create Result.make_with_8_bit_rgb (245, 222, 179)
		end

	burly_wood: EV_COLOR
			-- (222, 184, 135)
			-- A brown sandy color.
		once
			create Result.make_with_8_bit_rgb (222, 184, 135)
		end

	tan: EV_COLOR
			-- (210, 180, 140)
			-- A yellowish-brown color.
		once
			create Result.make_with_8_bit_rgb (210, 180, 140)
		end

	rosy_brown: EV_COLOR
			-- (188, 143, 143)
			-- A light brown shade of rose.
		once
			create Result.make_with_8_bit_rgb (188, 143, 143)
		end

	sandy_brown: EV_COLOR
			-- (244, 164, 96)
			-- A shade of brown reminiscent of sand.
		once
			create Result.make_with_8_bit_rgb (244, 164, 96)
		end

	goldenrod: EV_COLOR
			-- (218, 165, 32)
			-- A deep shade of `gold'.
		once
			create Result.make_with_8_bit_rgb (218, 165, 32)
		end

	dark_goldenrod: EV_COLOR
			-- (184, 134, 11)
			-- A darker shade of `goldenrod'.
		once
			create Result.make_with_8_bit_rgb (184, 134, 11)
		end

	peru: EV_COLOR
			-- (205, 133, 63)
			-- A brown-orange.
		once
			create Result.make_with_8_bit_rgb (205, 133, 63)
		end

	chocolate: EV_COLOR
			-- (210, 105, 30)
			-- A shade of brown that resembles chocolate.
		once
			create Result.make_with_8_bit_rgb (210, 105, 30)
		end

	saddle_brown: EV_COLOR
			-- (139, 69, 19)
			-- A medium brown color.
		once
			create Result.make_with_8_bit_rgb (139, 69, 19)
		end

	sienna: EV_COLOR
			-- (160, 82, 45)
			-- A reddish-brown color.
		once
			create Result.make_with_8_bit_rgb (160, 82, 45)
		end

	brown: EV_COLOR
			-- (165, 42, 42)
			-- A mix of the three subractive primary coors if the cyan content is low.
			-- Associated with soil, autumn, earth, skin, maple leaf, chocolate, coffee, caramel, stone, Africa, African culture, Indigenous, fascism, Thanksgiving.
		once
			create Result.make_with_8_bit_rgb (165, 42, 42)
		end

	maroon: EV_COLOR
			-- (128, 0, 0)
			-- A dark shade of red brown.
		once
			create Result.make_with_8_bit_rgb (128, 0, 0)
		end

feature -- Colors: Whites

	white: EV_COLOR
			-- (255, 255, 255)
			-- Opposite of black.
			-- Associated with bravery, purity, nobility, softness, emptiness, God,
			-- knowledge, lack, snow, ice, heaven, Caucasian, peace, life, clean, air,
			-- sunlight, surrender, clouds, frost, milk, cream, cotton, angels, weakness,
			-- bones, protagonist, winter, innocence.
		once
			create Result.make_with_8_bit_rgb (255, 255, 255)
		end

	snow: EV_COLOR
			-- (255, 250, 250)
			-- A shade of white with a hint of red.
		once
			create Result.make_with_8_bit_rgb (255, 250, 250)
		end

	honeydew: EV_COLOR
			-- (240, 255, 240)
			-- Like the interior flesh of a honeydew melon.
		once
			create Result.make_with_8_bit_rgb (240, 255, 240)
		end

	mint_cream: EV_COLOR
			-- (245, 255, 250)
			-- A pale pastel tint of spring green.
		once
			create Result.make_with_8_bit_rgb (245, 255, 250)
		end

	azure: EV_COLOR
			-- (240, 255, 255)
			-- A pale pastel tint of cyan.
		once
			create Result.make_with_8_bit_rgb (240, 255, 255)
		end

	alice_blue: EV_COLOR
			-- (240, 248, 255)
			-- A pale tine of azure, but slightly darker than `azure'.
		once
			create Result.make_with_8_bit_rgb (240, 248, 255)
		end

	ghost_white: EV_COLOR
			-- (248, 248, 255)
			-- The color of ghosts. Wait, you mean you've never seen one?!?!?????
		once
			create Result.make_with_8_bit_rgb (248, 248, 255)
		end

	white_smoke: EV_COLOR
			-- (245, 245, 245)
			-- A shade of gray slightly brighter than `windows_default_background_color'.
		once
			create Result.make_with_8_bit_rgb (245, 245, 245)
		end

	seashell: EV_COLOR
			-- (255, 245, 238)
			-- An off-white that resembles seashells.
		once
			create Result.make_with_8_bit_rgb (255, 245, 238)
		end

	old_lace: EV_COLOR
			-- (253, 245, 230)
			-- A very pale yellowish orange.
		once
			create Result.make_with_8_bit_rgb (253, 245, 230)
		end

	floral_white: EV_COLOR
			-- (255, 250, 240)
			-- A very pale shade of blue.
		once
			create Result.make_with_8_bit_rgb (255, 250, 240)
		end

	ivory: EV_COLOR
			-- (255, 255, 240)
			-- An off-white color that resembles ivory.
		once
			create Result.make_with_8_bit_rgb (255, 255, 240)
		end

	antique_white: EV_COLOR
			-- (250, 235, 215)
			-- A creamy white color.
		once
			create Result.make_with_8_bit_rgb (250, 235, 215)
		end

	linen: EV_COLOR
			-- (250, 240, 230)
			-- An off-white shade resembling linens.
		once
			create Result.make_with_8_bit_rgb (250, 240, 230)
		end

	lavender_blush: EV_COLOR
			-- (250, 240, 245)
			-- A pale pinkish shade of lavender.
		once
			create Result.make_with_8_bit_rgb (255, 240, 245)
		end

	misty_rose: EV_COLOR
			-- (255, 228, 225)
			-- A bright pastel shade of pink.
		once
			create Result.make_with_8_bit_rgb (255, 228, 225)
		end

feature -- Colors: Grays

	windows_default_background_color: EV_COLOR
			-- (240, 240, 240)
			-- The Windows (R) operating system default background color for a window in XP and earlier.
		once
			create Result.make_with_8_bit_rgb (240, 240, 240)
		end

	gainsboro: EV_COLOR
			-- (220, 220, 220)
			-- A light bluish gray color.
		once
			create Result.make_with_8_bit_rgb (220, 220, 220)
		end

	light_gray, light_grey: EV_COLOR
			-- (211, 211, 211)
			-- A shade of grey darker than `silver' and `dark_gray'.
		once
			create Result.make_with_8_bit_rgb (211, 211, 211)
		end

	silver: EV_COLOR
			-- (192, 192, 192)
			-- A shade of grey darker than `light_gray'.
		once
			create Result.make_with_8_bit_rgb (192, 192, 192)
		end

	dark_gray, dark_grey: EV_COLOR
			-- (169, 169, 169)
			-- Darker than `light_grey' and lighter than `grey'.
		once
			create Result.make_with_8_bit_rgb (169, 169, 169)
		end

	gray, grey: EV_COLOR
			-- (128, 128, 128)
			-- A shade of color between white and black.
			-- Associated with depression, boredom, neutrality, undefinedness, old age, contentment and speed.
		once
			create Result.make_with_8_bit_rgb (128, 128, 128)
		end

	dim_gray, dim_grey: EV_COLOR
			-- (105, 105, 105)
			-- A darker shade of `gray'.
		once
			create Result.make_with_8_bit_rgb (105, 105, 105)
		end

	light_slate_gray, light_slate_grey: EV_COLOR
			-- (119, 136, 153)
			-- A light shade of gray with a pinch of the shade from `azure'.
		once
			create Result.make_with_8_bit_rgb (119, 136, 153)
		end

	slate_gray, slate_grey: EV_COLOR
			-- (112, 128, 144)
			-- A shade of gray with a tinge of azure.
		once
			create Result.make_with_8_bit_rgb (112, 128, 144)
		end

	dark_slate_gray, dark_slate_grey: EV_COLOR
			-- (47, 79, 79)
			-- A darker shade of `slate_gray'.
		once
			create Result.make_with_8_bit_rgb (47, 79, 79)
		end

	black: EV_COLOR
			-- (0, 0, 0)
			-- The opposite of white.
			-- Associated with darkness, secrecy, power, nubian, mystery,
			-- silence and concealment; death (including execution) and bereavement,
			-- Fear, antagonist, strong, (with orange) Halloween; end, chaos, and lack,
			-- evil, bad luck, and crime; conversely, elegance, anarchy, Rebellion,
			-- Non-Conformity, Individuality, Solidarity
		once
			create Result.make_with_8_bit_rgb (0, 0, 0)
		end

end
