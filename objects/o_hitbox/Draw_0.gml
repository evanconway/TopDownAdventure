/// @description Draw BBoxes

if (global.debug_active && global.bboxes) {
	draw_set_alpha(1);
	draw_set_color(c_red);
	if (time_delay > 0) draw_set_color(c_ltgray);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
}