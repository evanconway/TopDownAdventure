/// @description Hitbox Logic

hitbox_center_x = x + sprite_width/2;
hitbox_center_y = y + sprite_height/2;

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

if (!permenant) {
	if (time_delay > 0) time_delay--;
	else if (time_active > 0) time_active--;
	else {
		instance_destroy(id);
		exit;
	}
}
