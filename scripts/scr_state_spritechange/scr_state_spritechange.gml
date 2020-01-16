/// @function scr_state_spritechange()
/// @description changes sprite of the actor to the state sprites

with (actor) {
	switch (actdirection) {
		case DIR.UP:
		actor_setsprite(other.sprite_back);
		break;
		case DIR.DOWN:
		actor_setsprite(other.sprite_front);
		break;
		case DIR.LEFT:
		actor_setsprite(other.sprite_left);
		break;
		case DIR.RIGHT:
		actor_setsprite(other.sprite_right);
		break;
	}
}
