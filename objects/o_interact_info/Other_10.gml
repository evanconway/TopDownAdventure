/// @description 

with (dialogue) {
	dialogue_update();
	if (input_pressed(INPUT.INTERACT) || input_pressed(INPUT.BACK)) {
		switch (state) {
			case DIALOGUE.OPENING:
			case DIALOGUE.TYPING:
			state = DIALOGUE.STATIC;
			break;
			case DIALOGUE.STATIC:
			state = DIALOGUE.CLOSING;
			break;
		}
	}
	if (state == DIALOGUE.OFF) focus_pop();
}
