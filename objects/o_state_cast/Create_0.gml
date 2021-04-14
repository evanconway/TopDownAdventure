/// @description 

// Inherit the parent event
event_inherited();

name = "Cast";
unlocked = false;

hitbox = o_hitbox;

cast_button = INPUT.ATTACK;

enum CAST {
	STARTUP,
	ACTIVE,
	ENDLAG
}

stage = CAST.STARTUP;
startup = 20;
active = 20;
endlag = 20;
time = 0;

cooldown = 0;
cooldown_max = 40;
