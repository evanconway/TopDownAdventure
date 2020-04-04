/// @description Change

if (down(block_button, actor.ai.controller)) {
	change = true;
	time_stun = 0;
	scr_play_sfx(activate_snd);
	scr_state_spritechange();
	shield_fx_id = scr_fx_create(actor.x, actor.y, shield_fx, LAYER_PLAYER - 1);
}
