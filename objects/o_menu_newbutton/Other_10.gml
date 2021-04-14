/// @description 

// Inherit the parent event
//event_inherited();

newassignment = undefined;
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
with (choices[|0]) event_user(0);
newassignment = choices[|0].newbutton;
if (newassignment != undefined) {
	active = false;
	focus_pop();
}