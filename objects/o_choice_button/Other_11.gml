/// @description 

draw_set_font(menu.menu_font);
width = string_width(name + " ");
if (o_input.using_gamepad) {
	// we're adding "10" because that is the width of the icon sprites. 
	width += ICON_WIDTH + string_width(DIVIDER);
	if (ds_grid_get(o_input.gamepad_assignment, button, 1) != NOASSIGNMENT) width += ICON_WIDTH;
} else width += string_width(choice_button_string(button));
