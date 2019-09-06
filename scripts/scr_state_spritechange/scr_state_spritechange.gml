/// @function scr_state_spritechange()
/// @description changes sprite of the actor to the state sprites

with (actor) {
	switch (actdirection) {
		case DIR.UP:
		if (other.sprite_back != undefined) sprite_index = other.sprite_back;
		break;
		case DIR.DOWN:
		if (other.sprite_front != undefined) sprite_index = other.sprite_front;
		break;
		case DIR.LEFT:
		if (other.sprite_left != undefined) sprite_index = other.sprite_left;
		break;
		case DIR.RIGHT:
		if (other.sprite_right != undefined) sprite_index = other.sprite_right;
		break;
	}
}
