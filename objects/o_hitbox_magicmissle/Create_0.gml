/// @description 

// Inherit the parent event
event_inherited();
vel_x = 0;
vel_y = 1.7; // velocities are for pointing down. Other states change this.  
miss_snd_id = scr_play_sfx(snd_firecast3);

fx_trail = o_fx_magicpoof_delayed;
fx_trail_time_max = 10;
fx_trail_time = fx_trail_time_max;

freeze_targetonly = true;
