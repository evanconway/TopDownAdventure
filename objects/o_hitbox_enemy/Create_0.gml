/// @description 

// Inherit the parent event
event_inherited();
ds_list_clear(hit_snd);
ds_list_set(hit_snd, 0, snd_hurt4);

knockback = 2;
freeze_frames = 20;
target_obj = o_player;
permenant = true;
invisible = true;
