/// @description 

// Inherit the parent event
event_inherited();

target_obj = o_enemy;
knockback = 1.7;
delete_on_hit = true;
hitbox_fx = o_fx_smack;
freeze_frames = 12;
active = 1;
ds_list_set(sprite_frames, 0, 3);
ds_list_set(sprite_frames, 1, 1);
