/// @description 

// Inherit the parent event
event_inherited();
ds_list_clear(hit_snd);
ds_list_set(hit_snd, 0, snd_bonk);

knockback = 2;
freeze_frames = 5;
target_obj = o_player;
permenant = true;
invisible = true;
