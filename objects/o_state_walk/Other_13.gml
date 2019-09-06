/// @description stayin

// Inherit the parent event
event_inherited();

var _stayin = true;

with (actor.ai.controller) {
	if (!down(INPUT.UP) &&
		!down(INPUT.DOWN) &&
		!down(INPUT.LEFT) &&
		!down(INPUT.RIGHT)) _stayin = false;
	if (down(INPUT.UP) &&
		down(INPUT.DOWN) &&
		down(INPUT.LEFT) &&
		down(INPUT.RIGHT)) _stayin = false;
	if (down(INPUT.UP) && down(INPUT.DOWN) &&
		!down(INPUT.LEFT) && down(INPUT.RIGHT)) _stayin = false;
	if (down(INPUT.LEFT) && down(INPUT.RIGHT) &&
		!down(INPUT.UP) && !down(INPUT.DOWN)) _stayin = false;
	if (pressed(INPUT.ATTACK)) _stayin = false;
	if (pressed(INPUT.ATTACK)) _stayin = false;
}

if (velx_prev == 0 && vely_prev == 0) _stayin = false;

stayin = _stayin;
