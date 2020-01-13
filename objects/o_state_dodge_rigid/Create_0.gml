/// @description 

// Inherit the parent event
event_inherited();

name = "Dodge";
invulnerable = true;

enum DODGE {
	ACTIVE,
	DONE,
}
stage = DODGE.ACTIVE;

dodge_speed = 2;
dodge_vel_x = 0; // set during change
dodge_vel_y = 0; // set during change
dodge_time = 0;
dodge_time_max = 30;
dodge_cooldown = 0;
dodge_cooldown_max = 20;

effect_time = 0;
effect_time_max = 3;
dodge_effect = o_fx_smokepoof;
