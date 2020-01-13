/// @description 

// Inherit the parent event
event_inherited();
hit_snd = snd_firehit1;
miss_snd = snd_firecast3;
scr_play_sfx(miss_snd);
permenant = true;
hitbox_vel_y = 3;
hitbox_fx = o_fx_fireexplode;
delete_on_hit = true;
delete_on_solid = true;
delete_fx = o_fx_fireexplode;
delete_snd = snd_firecast1;
freeze_targetonly = true;
