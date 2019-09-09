/// @description Change

with (actor) {
	var _c = ai.controller;
	if (down(INPUT.UP, _c) && !down(INPUT.DOWN, _c) &&
		!place_meeting(x, y - 1, o_wall)) other.change = true;
	if (down(INPUT.DOWN, _c) && !down(INPUT.UP, _c) &&
		!place_meeting(x, y + 1, o_wall)) other.change = true;
	if (down(INPUT.LEFT, _c) && !down(INPUT.RIGHT, _c) &&
		!place_meeting(x - 1, y, o_wall)) other.change = true;
	if (down(INPUT.RIGHT, _c) && !down(INPUT.LEFT, _c) &&
		!place_meeting(x + 1, y, o_wall)) other.change = true;
}

if (change) {
	scr_state_spritechange();
	actor.image_index = 0;
}
