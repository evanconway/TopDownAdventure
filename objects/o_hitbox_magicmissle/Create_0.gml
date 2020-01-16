/// @description 

// Inherit the parent event
event_inherited();
//invisible = true;
hit_snd = snd_explosion2;
miss_snd = snd_laser1;
scr_play_sfx(miss_snd);
permenant = true;
hitbox_vel_y = 1.7;
hitbox_fx = o_fx_magicexplode;
delete_on_hit = true;
delete_on_solid = true;
delete_fx = o_fx_magicpop;
delete_snd = snd_firecast1;
freeze_targetonly = true;

hitbox_fx_trail = o_fx_magicpoof_delayed;
hitbox_fx_trail_time_max = 10;

hitbox_actor_offset = -7;
