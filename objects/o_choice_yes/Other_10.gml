/// @description 

event_inherited();

if (input_pressed(INPUT.SELECT) || input_pressed(INPUT.INTERACT)) {
	yes_pressed = true;
	scr_play_sfx(global.sfx_ui_confirm);
}
