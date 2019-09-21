/// @description 

if (active) {
	draw_set_alpha(1);
	draw_set_font(menu_font);

	var _menu_height = string_height(ATOZ) * ds_list_size(choices);
	if (_menu_height < height_min) _menu_height = height_min;

	draw_set_color(menu_color);
	draw_rectangle(VIEW_W/2 - width_min/2 - border_width, VIEW_H/2 - _menu_height/2 - border_width, 
		VIEW_W/2 + width_min/2 + border_width, VIEW_H/2 + _menu_height/2 + border_width, false);
	
	draw_set_color(c_black);
	draw_rectangle(VIEW_W/2 - width_min/2, VIEW_H/2 - _menu_height/2, 
		VIEW_W/2 + width_min/2, VIEW_H/2 + _menu_height/2, false);

	var _topy = VIEW_H/2 - _menu_height/2;
	var _leftx = VIEW_W/2 - width_min/2 + 3; // 3 is a magic number... pad the text
	//var _cursory = _topy;
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);

	for (var i = 0; i < ds_list_size(choices); i++) {
		var _choice = choices[|i];
		draw_text(_leftx, _topy + string_height(ATOZ) * i, _choice.name);
		switch (_choice.type) {
			case MENU_CHOICE_TYPE.TOGGLE:
			break;
			case MENU_CHOICE_TYPE.DIAL:
			break;
			case MENU_CHOICE_TYPE.INPUT_SETTING:
			break;
		}
	}
}
