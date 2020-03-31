/// @description Logic

/*
As noted in our comments about hitboxes, the default direction for hitboxes is
down. By design choice, all hitboxes will be created at the edge of the actor
collision mask facing the correct direction. Originally we were going to get
fancy with our hitbox options, but there's just no need. 
*/

actor.image_speed = 0; // we control actor animation manually

switch (stage) {
	case CAST.STARTUP:
		actor.image_index = 0;
		if (time <= 0) {
			stage++;
			time = active;
			with (instance_create_depth(actor.x, actor.y, actor.depth-1, hitbox)) {
				var _act = other.actor;
				var _act_w = _act.bbox_right - _act.bbox_left;
				var _act_h = _act.bbox_bottom - _act.bbox_top;
				with (instance_create_depth(0, 0, 0, o_event_hitbox_setdir)) {
					id_hitbox = other;
					dir = _act.actdirection;
				}
				switch (_act.actdirection) {
					case DIR.UP:
						depth += 1; // puts hitbox below actor sprite
						image_angle = 180;
						y -= _act_h/2 + sprite_height/2 - 1;
					break;
					case DIR.DOWN: // default hitbox direction
						y += _act_h/2 + sprite_height/2 - 2;
					break;
					case DIR.LEFT:
						image_angle = -90;
						x -= _act_w/2 + sprite_height/2 - 1;
					break;
					case DIR.RIGHT:
						/*
						Some notes about the right swing. Our player actor is right handed, and when
						they cast, they swing their hand from up to down, right to left. For all other
						angles, simply rotating the sprite works fine, but for the right face, the actor
						is bringing their hand up to down, but a normal rotation makes the animation 
						appear down to up. So we have to flip the image in addition to rotating it.
						*/
						image_xscale = -1;
						image_angle = 90;
						x += _act_w/2 + sprite_height/2 - 2;
					break;
				}
			}
			actor.image_index = 1;
		}
	break;
	case CAST.ACTIVE:
		actor.image_index = 1;
		if (time <= 0) {
			actor.image_index = 2;
			stage++;
			time = endlag;
		}
	break;
	case CAST.ENDLAG:
		actor.image_index = 2;
	break;
}

time--;
