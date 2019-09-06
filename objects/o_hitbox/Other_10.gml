/// @description Hitbox Logic

switch (type) {
	case HITBOX.POSITION:
		if (attack != undefined) {
			x = attack.x;
			y = attack.y;
		}

		if (time_position < ds_grid_width(positions) - 1) {
			x += ds_grid_get(positions, time_position, 0);
			y += ds_grid_get(positions, time_position, 1);
			time_position++;
		}
	break;
	case HITBOX.PROJECTILE:
		// we use separate x/y to account for game makers issues with non-integers
		hitbox_x += xvel;
		hitbox_y += yvel;
		x = round_int(hitbox_x);
		y = round_int(hitbox_y);
	break;
}

if (time_delay > 0) time_delay--;
else if (time_active > 0) time_active--;
else {
	instance_destroy(id);
	exit;
}

// check for hitbox collision
if (target != undefined && place_meeting(x, y, target)) {
	var _already = false;
	for (var i = 0; i < instance_number(o_event); i++) {
		with (instance_find(o_event, i)) {
			if (type == EVENT.HITBOX && maker == other.id && target == other.target) {
				_already = true;
				i = instance_number(o_event);
			}
		}
	}
	
	if (!_already) with (instance_create_layer(0, 0, LAYER_ACTORS, o_event)) {
		type = EVENT.HITBOX;
		maker = other.id; 
		target = other.target;
	}
}
	