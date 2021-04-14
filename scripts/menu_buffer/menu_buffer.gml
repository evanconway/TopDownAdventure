/// @param menu
function menu_buffer() {
	/*
	Generates spacer distance from border for a menu. It is assumed
	this script is called from a menu or menu script, but a menu 
	object can be passed in.
	*/

	if (argument_count > 0) draw_set_font(argument[0].menu_font);
	else draw_set_font(menu_font);
	return string_height(ATOZ);



}
