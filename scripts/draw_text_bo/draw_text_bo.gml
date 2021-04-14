/// @function draw_text_bo(x, y, string)
/// @description same as draw_text but with simple, black outline
/// @param {real} x x position of drawn string
/// @param {real} y y position of drawn string
/// @param {string} string string to be drawn
function draw_text_bo() {

	var _x = argument[0];
	var _y = argument[1];
	var _color = draw_get_color();
	draw_set_color(c_black);
	draw_text_floor(_x - 1, _y, argument[2]);
	draw_text_floor(_x + 1, _y, argument[2]);
	draw_text_floor(_x, _y - 1, argument[2]);
	draw_text_floor(_x, _y + 1, argument[2]);
	draw_set_color(_color);
	draw_text_floor(_x, _y, argument[2]);



}
