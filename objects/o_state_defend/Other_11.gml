/// @description Change

// the logic for this state is a lot like the hurt state

if (ds_grid_get(actor.ai.controller.buttons, block_button, 0)) {
	change = true;
	block_stuntime = 0;
	scr_play_sfx(block_snd_activate);
	with (actor) actor_setsprite(other.block_sprite);
	block_barrier_fx_id = scr_fx_create(actor.x, actor.y, block_barrier_fx, LAYER_PLAYER - 1);
	//scr_state_spritechange();
}
