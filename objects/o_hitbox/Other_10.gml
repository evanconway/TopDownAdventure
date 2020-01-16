/// @description Hitbox Logic

// Delete If Attack Undefined
if (target_ins == undefined && target_obj == undefined) {
	instance_destroy(id);
	show_debug_message("Deleting Hitbox ID: " + string(id) + " with no target");
	exit
}

// Delete if out of room bounds
var outOfBounds = false;
if (bbox_bottom < 0) outOfBounds = true;
if (bbox_right < 0) outOfBounds = true;
if (bbox_top > room_height) outOfBounds = true;
if (bbox_left > room_width) outOfBounds = true;
if (outOfBounds) {
	instance_destroy(id);
	exit;
}

// we use separate x/y to account for game makers issues with non-integers
hitbox_x += hitbox_vel_x;
hitbox_y += hitbox_vel_y;
x = round_int(hitbox_x);
y = round_int(hitbox_y);

// hitbox trail effects
if (++hitbox_fx_trail_time >= hitbox_fx_trail_time_max) {
	hitbox_fx_trail_time = 0;
	ds_list_add(hitbox_fx_created, scr_fx_create(x, y, hitbox_fx_trail, LAYER_ATTACKS + 1));
}

// hitbox animation is done manually, see create event for details
if (permenant) image_speed = 1;
else {
	image_speed = 0;
	frame_count++;
	if (frame_count > ds_list_find_value(hitbox_frames, image_index)) {
		frame_count = 0;
		image_index++;
		if (image_index >= ds_list_size(hitbox_frames)) {
			//image_index;
			marked_for_deletion = true;
		}
	}
}
