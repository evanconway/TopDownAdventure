/// @description 

// Inherit the parent event
event_inherited();
scr_play_sfx_rndm(miss_snd);
target_obj = o_enemy;
knockback = 1.7;
delete_on_hit = true;
hitbox_fx = o_fx_smack;
freeze_frames = 12;
active = 1;
ds_list_add(hitbox_frames, 6);
ds_list_add(hitbox_frames, 4);
