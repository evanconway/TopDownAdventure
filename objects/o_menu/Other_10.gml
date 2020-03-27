/// @description Logic

var _dirpressed = false;
var _indexprev = index;

if (input_pressed(INPUT.UI_UP) && !input_pressed(INPUT.UI_DOWN)) {
	index--;
	index = clamp(index, 0, ds_list_size(choices) - 1);
	if (index != _indexprev) _dirpressed = true;
}

if (input_pressed(INPUT.UI_DOWN) && !input_pressed(INPUT.UI_UP)) {
	index++;
	index = clamp(index, 0, ds_list_size(choices) - 1);
	if (index != _indexprev) _dirpressed = true;
}
	
// set alpha values for current choice
if (_dirpressed) {
	scr_play_sfx(global.sfx_ui_nav);
	cur_alpha = 1;
	alpha_change_amnt = abs(alpha_change_amnt);
} else {
	cur_alpha_time++;
	if (cur_alpha_time >= alpha_change_rate) {
		cur_alpha_time = 0;
		cur_alpha -= alpha_change_amnt;
		if (cur_alpha <= alpha_min) {
			cur_alpha = alpha_min;
			alpha_change_amnt *= -1;
		}
		if (cur_alpha >= 1) {
			cur_alpha = 1;
			alpha_change_amnt *= -1;
		}
	}
}
	
// execute choice logic
/*
Note that since many choices require different inputs, input checking is
handled by choice logic, not the menu. That's why you don't see something 
like: "if select pressed execute choice logic"
*/
cur_choice = ds_list_find_value(choices, index);
if (cur_choice != undefined && !_dirpressed) {
	with (cur_choice) event_user(0);
}

// return to previous focus on start press
// (but only if this menu is still the current focus)
/*
I'm revisting this code later... I'm pretty sure the reason we check to make sure the menu is 
still the current focus object is because there is choice logic that changes the current focus
on start or cancel press. However, we'll still get to this line of code after running the choice
code... so we don't want the menu popping focus when it's not actually the focus object anymore. 
*/
if  (id == focus_cur() && closeable && (input_pressed(INPUT.START) || input_pressed(INPUT.UI_CANCEL))) {
	with (instance_create_depth(0, 0, LAYER_MASTER, o_event_menu_close)) menu = other;
	scr_play_sfx(global.sfx_ui_back);
}
