/// @description 

// Inherit the parent event
event_inherited();

target_obj = o_enemy;
knockback = 2;
hitbox_fx = o_fx_smack;
freeze_frames = 10;
active = 1;
ds_list_set(sprite_frames, 0, 3); // 2
ds_list_set(sprite_frames, 1, 3); // 9
//ds_list_set(sprite_frames, 2, 10);
//ds_list_set(sprite_frames, 0, 1);
