/// @description Draw BBoxes

if (global.debug_active && global.bboxes) {
	image_alpha = global.bboxes_sprite_alpha;
	if (!invisible) draw_self();
	image_alpha = 1;
	if (frame < active) { 
		draw_set_alpha(1);
		draw_set_color(c_red);
		draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
		draw_point(x, y);
	}
} else if (!invisible) draw_self();

if (!permenant) frame++;
