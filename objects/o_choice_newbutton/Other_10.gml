/// @description 

/*
Here we check to see if any key or button has been pressed. If
it has then focus is popped and the menus below re-assign the
new button/key to the input. 
*/

if (input_pressed(INPUT.START)) {
	menu.active = false;
	focus_pop();
} else {
	if (o_input.using_gamepad) {
		for (var i = 0; i < GAMEPAD.SIZE; i++) {
			if (scr_gamepad_pressed(i, button)) {
				newbutton = i;
				i = GAMEPAD.SIZE;
			}
		}
	} else {
		if (keyboard_key != 0) newbutton = keyboard_key;
	}
}
