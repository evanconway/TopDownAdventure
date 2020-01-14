/// @description Change

/*
We're going to setup the pressed ds list here instead of at object creation. That way
all we need to do is add the buttons we want logged, and this bit of code will take
care of the rest. We're putting it in this event specifically because it is not called
as often as the other events, but is the first event called related to this state.
*/

if (ds_list_size(dodge_buffer_buttons) != ds_list_size(dodge_buffer_pressed)) {
	for (var i = 0; i < ds_list_size(dodge_buffer_buttons); i++) ds_list_add(dodge_buffer_pressed, false);
}

if (dodge_cooldown > 0) exit;

if (ds_grid_get(actor.ai.controller.buttons, INPUT.BACK, 1)) {
	change = true;
	stage = DODGE.ACTIVE;
	dodge_time = 0;
	actor.act_alpha = 0;
	scr_state_spritechange();
	if (dodge_fx_vanish != undefined) instance_create_depth(actor.x, actor.y, LAYER_PLAYER, dodge_fx_vanish);
	if (dodge_snd != undefined) {
		audio_stop_sound(dodge_snd);
		scr_play_sfx(dodge_snd);
	}
}
