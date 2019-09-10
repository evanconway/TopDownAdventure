/// @description 

// Inherit the parent event
event_inherited();

name = "Attack";

hitbox = o_hitbox_player_swing;
hitboxID = undefined;

/*
We'll use these offsets to make sure the hitbox is in the right spot depending
on direction.
*/
hitbox_x_offsetU = 0;
hitbox_y_offsetU = -10;
hitbox_x_offsetD = 0;
hitbox_y_offsetD = 10;
hitbox_x_offsetL = -10;
hitbox_y_offsetL = 0;
hitbox_x_offsetR = 10;
hitbox_y_offsetR = 0;

enum ATTACK {
	STARTUP,
	ACTIVE,
	ENDLAG
}

stage = ATTACK.STARTUP;
startup = 1;
active = 30;
endlag = 1;
time = 0;
