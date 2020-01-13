/// @description 

// Inherit the parent event
event_inherited();

name = "Dodge";
invulnerable = true;

/* Defined in dodge rigid
enum DODGE {
	ACTIVE,
	DONE,
}
*/

stage = DODGE.ACTIVE;

dodge_speed = 2;
velx_prev = 0;
vely_prev = 0;
dodge_time = 0;
dodge_time_max = 35;
dodge_cooldown = 0;
dodge_cooldown_max = 20;

dodge_fx_vanish = undefined;
dodge_snd = undefined;

effect_time = 0;
effect_time_max = 7;
dodge_effect = o_fx_magicpoof;
