/// @description Change

change = true;

with (actor.ai.controller) if (anypressed()) {
	other.change = false;
}

if (change) scr_state_spritechange();
