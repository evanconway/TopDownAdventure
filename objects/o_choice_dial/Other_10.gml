/// @description 

if (dial_increase_script != undefined && dial_decrease_script != undefined) {
	if (input_pressed(INPUT.UI_RIGHT) || input_pressed(INPUT.UI_SELECT)) script_execute(dial_increase_script);
	if (input_pressed(INPUT.UI_LEFT)) script_execute(dial_decrease_script);
}
