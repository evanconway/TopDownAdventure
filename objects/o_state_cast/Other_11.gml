/// @description Change

if (cooldown > 0) exit;

if (ds_grid_get(actor.ai.controller.buttons, cast_button, 1)) {
	change = true;
	stage = CAST.STARTUP;
	time = startup;
	cooldown = cooldown_max;
	scr_state_spritechange();
}
