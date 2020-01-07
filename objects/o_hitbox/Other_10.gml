/// @description Hitbox Logic

// Delete If Attack Undefined
if (target_ins == undefined && target_obj == undefined) {
	instance_destroy(id);
	show_debug_message("Deleting Hitbox ID: " + string(id) + " with no target");
	exit
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

// marked_for_deletion is set by various other game elements
if (marked_for_deletion) {
	instance_destroy(id);
	exit;
}

switch (type) {
	case HITBOX.POSITION:

	break;
	case HITBOX.PROJECTILE:
		// we use separate x/y to account for game makers issues with non-integers
		hitbox_x += xvel;
		hitbox_y += yvel;
		x = round_int(hitbox_x);
		y = round_int(hitbox_y);
	break;
}

