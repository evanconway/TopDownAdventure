/// @description Change

if (dodge_cooldown > 0) exit;

if (ds_grid_get(actor.ai.controller.buttons, INPUT.BACK, 1)) {
	change = true;
	stage = DODGE.ACTIVE;
	dodge_time = 0;
	scr_state_spritechange();
	if (dodge_fx_vanish != undefined) instance_create_depth(actor.x, actor.y, LAYER_PLAYER, dodge_fx_vanish);
	if (dodge_snd != undefined) {
		audio_stop_sound(dodge_snd);
		scr_play_sfx(dodge_snd);
	}
}
