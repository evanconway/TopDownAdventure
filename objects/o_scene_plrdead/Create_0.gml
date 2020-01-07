/// @description 

enum PLRDEAD {
	DPAUSE,
	SHOCK,
	DYING,
	FADEOUT,
	FADEIN,
	DONE
}

state = PLRDEAD.DPAUSE;
counter = 0;
fade_time_max = 6;
fade_time = 0;
fade_rate = 0.1;
