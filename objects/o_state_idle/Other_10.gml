/// @description Logic

var _dir = actor.actdirection;

with (actor) {
	image_speed = 0;
	image_index = 0;
	with (ai.controller) {
		if (pressed(INPUT.UP) && !down(INPUT.DOWN)) _dir = DIR.UP;
		if (pressed(INPUT.DOWN) && !down(INPUT.UP)) _dir = DIR.DOWN;
		if (pressed(INPUT.LEFT) && !down(INPUT.RIGHT)) _dir = DIR.LEFT;
		if (pressed(INPUT.RIGHT) && !down(INPUT.LEFT)) _dir = DIR.RIGHT;
	}
}

if (_dir != actor.actdirection) {
	actor.actdirection = _dir;
	scr_state_spritechange();
}
