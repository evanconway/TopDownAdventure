/// @description 
if (global.debug_active && global.bboxes) {
	image_alpha = global.bboxes_sprite_alpha;
	if (global.wallsvisible) draw_self();
	image_alpha = 1;
	draw_set_color(static_bbox_color);
	draw_set_alpha(1);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
} else if (global.wallsvisible) draw_self();
