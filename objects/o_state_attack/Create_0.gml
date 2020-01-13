/// @description 

// Inherit the parent event
event_inherited();

name = "Attack";

hitbox = o_hitbox; //o_hitbox_player_swing;
hitboxID = undefined;

attack_button = INPUT.ATTACK;

enum ATTACK {
	STARTUP,
	ACTIVE,
	ENDLAG
}

target_ins = undefined;
target_obj = undefined;

stage = ATTACK.STARTUP;
startup = 20;
active = 20;
endlag = 20;
time = 0;

// these variables may not be needed
attackfx = undefined;
attackfx_x_offsetU = 0;
attackfx_y_offsetU = -10;
attackfx_x_offsetD = 0;
attackfx_y_offsetD = 10;
attackfx_x_offsetL = -10;
attackfx_y_offsetL = 0;
attackfx_x_offsetR = 10;
attackfx_y_offsetR = 0;

hitbox_x_offsetU = 0;
hitbox_y_offsetU = -10;
hitbox_x_offsetD = 0;
hitbox_y_offsetD = 10;
hitbox_x_offsetL = -10;
hitbox_y_offsetL = 0;
hitbox_x_offsetR = 10;
hitbox_y_offsetR = 0;