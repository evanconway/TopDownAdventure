/// @description 

// focus object that takes game to main menu

enum NEWGAME {
	FADEOUT,
	FADEIN
}

state = NEWGAME.FADEOUT;
cur_alpha = 0;
cur_time = 0;
time_max = 5;
alpha_max = 1; // we're using this to lengthen time of black screen
alpha_change = 0.1;
