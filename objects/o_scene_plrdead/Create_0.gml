/// @description 

enum PLRDEAD {
	SHOCK,
	DYING,
	FADEOUT,
	FADEIN, // respawn
}

state = PLRDEAD.SHOCK;
counter = 90; // first use is shock
fade_time_max = 7;
fade_time = 0;
fade_change = 0.1;
fade_alpha = 0;

global.player.draw_black_box = true;
global.player.sprite_index = s_plr_idle_front;
