/// @description Connect

// Inherit the parent event
event_inherited();

var _connect = true;

with (actor.ai.controller) {
	if (anypressed()) _connect = false;
}

connect = _connect;