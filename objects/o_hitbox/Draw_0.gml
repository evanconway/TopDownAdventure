/// @description Draw BBoxes

// bandaid solution to sprites animating when game is paused.
if (focus_cur() != global.gameworld) image_speed = 0;

if (global.debug_active && global.bboxes) {
	image_alpha = global.bboxes_sprite_alpha;
	if (!invisible) draw_self();
	image_alpha = 1;
	if (hitbox_frames_displayed() <= active) { // equal because 1 frame will have already been counted when this is called
		draw_set_alpha(1);
		draw_set_color(c_red);
		draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
		draw_point(x, y);
	}
} else if (!invisible) draw_self();
