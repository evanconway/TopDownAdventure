/// @description Logic While Active

/*
We're setting the dialogue text here instead of in the creation code, so that
way we only need to set the message in the room editor. 
*/
if (!message_set) {
	with (dialogue) dialogue_settext(other.message);
	message_set = true;
}

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
