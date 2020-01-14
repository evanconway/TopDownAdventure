/// @description 

// Inherit the parent event
event_inherited();
miss_snd = snd_swing;
scr_play_sfx(miss_snd);
knockback = 1.7;
//delete_on_hit = true;
freeze_frames *= 1;
active = 1;
ds_list_add(hitbox_frames, 5);
ds_list_add(hitbox_frames, 2);
