/// @description Hitbox Logic

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
