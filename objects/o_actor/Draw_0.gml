/// @description 

/*
For the sake of stability, we're going to make sure our state code
leaves actors with integer x/y values.
*/

if (global.debug_active) {
	if (global.bboxes) {
		image_alpha = global.bboxes_sprite_alpha;
		draw_self();
		image_alpha = 1;
		draw_set_alpha(1);
		draw_set_color(bbox_color);
		draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
		draw_set_color(origin_color);
		draw_point(x, y);
	} else draw_self();
	if (global.playerdata && id == global.player) {
		draw_set_color(bbox_color);
		draw_set_halign(fa_center);
		draw_set_valign(fa_bottom);
		draw_text_bo(x, bbox_top - 4, "State: " + state.name);
		draw_set_valign(fa_top);
		draw_text_bo(x, bbox_bottom + 4, "X: " + string(x) + "  Y: " + string(y));
	}
} else draw_self();


