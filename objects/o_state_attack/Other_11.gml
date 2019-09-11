/// @description Change

if (ds_grid_get(actor.ai.controller.buttons, INPUT.ATTACK, 1)) {
	change = true;
	stage = ATTACK.STARTUP;
	time = startup;
	scr_state_spritechange();
}
