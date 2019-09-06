/// @description Connect

// Inherit the parent event
event_inherited();

var _connect = false;

with (actor) {
	var _c = ai.controller;
	if (down(INPUT.UP, _c) && !down(INPUT.DOWN, _c) &&
		!place_meeting(x, y - 1, o_wall)) _connect = true;
	if (down(INPUT.DOWN, _c) && !down(INPUT.UP, _c) &&
		!place_meeting(x, y + 1, o_wall)) _connect = true;
	if (down(INPUT.LEFT, _c) && !down(INPUT.RIGHT, _c) &&
		!place_meeting(x - 1, y, o_wall)) _connect = true;
	if (down(INPUT.RIGHT, _c) && !down(INPUT.LEFT, _c) &&
		!place_meeting(x + 1, y, o_wall)) _connect = true;
}

connect = _connect;
