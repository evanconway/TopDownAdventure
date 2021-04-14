/// @description READ ME

// focus object that takes game to main menu

/*
There's an uexpected quirk with this object and how it makes the game unpausable once
it's active. Now, we WANT the game to be unpausable once this object is active, but
we accidentally created the correct behavior, so we should explain. Once this object
is created by selecting "Main Menu" from the pause menu, the pause menu no longer
has focus. That means that pressing pause or cancel doesn't actually close the
menu because the menu needs to have focus and run its logic to act on those inputs.
*/

enum TOMAINMENU {
	FADEOUT,
	FADEIN
}

state = TOMAINMENU.FADEOUT;
cur_alpha = 0;
cur_time = 0;
time_max = 5;
alpha_max = 1; // we're using this to lengthen time of black screen
alpha_change = 0.1;
