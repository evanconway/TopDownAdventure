/// @description Stayin

// Inherit the parent event
event_inherited();

var _stayin = true;

with (actor.ai.controller) {
	if anydown() _stayin = false;
}

stayin = _stayin;
