/// @description 

enum PLRDEAD {
	SETUP,
	SHOCK,
	DYING,
	FADEOUT,
	FADEIN, // respawn
}

state = PLRDEAD.SETUP;
counter = 90; // first use is shock
fade_time_max = 7;
fade_time = 0;
fade_change = 0.1;
fade_alpha = 0;
