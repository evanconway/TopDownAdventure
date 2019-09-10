/// @description Logic

switch (stage) {
	case ATTACK.STARTUP:
		if (time <= 0) {
			stage++;
			time = active;
			with (instance_create_layer(other.x, other.y, LAYER_ATTACKS, hitbox)) {
				other.hitboxID = id;
				actor = other.actor;
				switch (other.actor.actdirection) {
					case DIR.UP:
						x += other.hitbox_x_offsetU;
						y += other.hitbox_y_offsetU;
					break;
					case DIR.DOWN:
						x += other.hitbox_x_offsetD;
						y += other.hitbox_y_offsetD;
					break;
					case DIR.LEFT:
						x += other.hitbox_x_offsetL; // note they're switched
						y += other.hitbox_y_offsetL;
					break;
					case DIR.RIGHT:
						x += other.hitbox_x_offsetR; // note they're switched
						y += other.hitbox_y_offsetR;
					break;
				}
			}
		}
	break;
	case ATTACK.ACTIVE:
		if (time <= 0) {
			stage++;
			time = endlag;
			instance_destroy(hitboxID);
		}
	break;
	case ATTACK.ENDLAG:
	break;
}

time--;
