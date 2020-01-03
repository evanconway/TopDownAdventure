/// @description 

if (input_pressed(INPUT.SELECT) || input_pressed(INPUT.INTERACT)) {
	focus_push(confirm);
	confirm.active = true;
}

if (confirm.yes_pressed) game_end();
