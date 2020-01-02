/// @description Hitbox Logic

if (!scr_actors_frozen() && global.actors_freeze_time <= 0) {
	
	if (marked_for_deletion) {
		instance_destroy(id);
		exit;
	}
	
	image_speed = 0;

	if (ds_list_find_value(sprite_frames, image_index) != undefined && 
		image_index < image_number - 1 &&
		frame >= ds_list_find_value(sprite_frames, image_index) + frames_counted &&
		ds_list_find_value(sprite_frames, image_index + 1) != undefined) {
		frames_counted = frame;
		image_index++;
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

	//frame++; this is updated in the draw event
} else image_speed = 0;