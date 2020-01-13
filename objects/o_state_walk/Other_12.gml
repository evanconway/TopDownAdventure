/// @description Remain

remain = true;

with (actor.ai.controller) {
	if (!down(INPUT.UP) &&
		!down(INPUT.DOWN) &&
		!down(INPUT.LEFT) &&
		!down(INPUT.RIGHT)) other.remain = false;
	if (down(INPUT.UP) &&
		down(INPUT.DOWN) &&
		down(INPUT.LEFT) &&
		down(INPUT.RIGHT)) other.remain = false;
	if (down(INPUT.UP) && down(INPUT.DOWN) &&
		!down(INPUT.LEFT) && down(INPUT.RIGHT)) other.remain = false;
	if (down(INPUT.LEFT) && down(INPUT.RIGHT) &&
		!down(INPUT.UP) && !down(INPUT.DOWN)) other.remain = false;
	if (pressed(INPUT.ATTACK)) other.remain = false;
	if (pressed(INPUT.BACK)) other.remain = false;
	if (pressed(INPUT.MAP)) other.remain = false;
}

if (velx_prev == 0 && vely_prev == 0) {
	remain = false;
}
