/// @description Logic

actor.image_speed = 0;

switch (stage) {
	case ATTACK.STARTUP:
		actor.image_index = 0;
		if (time <= 0) {
			stage++;
			time = active;
			with (instance_create_depth(actor.x, actor.y, actor.depth-1, hitbox)) {
				other.hitboxID = id;
				actor = other.actor;
				switch (other.actor.actdirection) {
					case DIR.UP:
						depth += 2;
						image_angle = 90;
						x += other.hitbox_x_offsetU;
						y += other.hitbox_y_offsetU;
					break;
					case DIR.DOWN:
						image_angle = 270;
						x += other.hitbox_x_offsetD;
						y += other.hitbox_y_offsetD;
					break;
					case DIR.LEFT:
						image_angle = 180;
						x += other.hitbox_x_offsetL; // note they're switched
						y += other.hitbox_y_offsetL;
					break;
					case DIR.RIGHT:
						image_angle = 0;
						x += other.hitbox_x_offsetR; // note they're switched
						y += other.hitbox_y_offsetR;
					break;
				}
			}
			if (attackfx != undefined) with (instance_create_depth(other.x, other.y, LAYER_ATTACKS, attackfx)) {
				switch (other.actor.actdirection) {
					case DIR.UP:
						image_angle = 90;
						x += other.attackfx_x_offsetU;
						y += other.attackfx_y_offsetU;
					break;
					case DIR.DOWN:
						image_angle = 270;
						x += other.attackfx_x_offsetD;
						y += other.attackfx_y_offsetD;
					break;
					case DIR.LEFT:
						image_angle = 180;
						x += other.attackfx_x_offsetL;
						y += other.attackfx_y_offsetL;
					break;
					case DIR.RIGHT:
						image_angle = 0;
						x += other.attackfx_x_offsetR;
						y += other.attackfx_y_offsetR;
					break;
				}
			}
			actor.image_index = 1;
		}
	break;
	case ATTACK.ACTIVE:
		actor.image_index = 1;
		if (time <= 0) {
			actor.image_index = 2;
			stage++;
			time = endlag;
			instance_destroy(hitboxID);
		}
	break;
	case ATTACK.ENDLAG:
		actor.image_index = 2;
	break;
}

time--;
