/// @description 

/*
We're setting the dialogue text here instead of in the creation code, so that
way we only need to set the message in the room editor. 
*/
if (!convos_set) {
	with (dialogue) dialogue_settext(ds_list_find_value(ds_list_find_value(other.convos, other.index_convo), other.index_message));
	convos_set = true;
}


with (dialogue) dialogue_update();
if (input_pressed(INPUT.INTERACT) || input_pressed(INPUT.BACK)) {
	switch (dialogue.state) {
		case DIALOGUE.OPENING:
		case DIALOGUE.TYPING:
		dialogue.state = DIALOGUE.STATIC;
		break;
		case DIALOGUE.STATIC:
		// increase message index and set text if not at convo end
		if (++index_message >= ds_list_size(ds_list_find_value(convos, index_convo))) {
			// at convo end, reset message and increase convo
			index_convo++;
			index_message = 0;
			dialogue.state = DIALOGUE.CLOSING;
			// ensure convo isn't passed list size
			index_convo = clamp(index_convo, 0, ds_list_size(convos) - 1);
		} else {
			dialogue.state = DIALOGUE.TYPING;
		}
		dialogue.cursor_x = 0;
		dialogue.cursor_y = 0;
		with (dialogue) dialogue_settext(ds_list_find_value(ds_list_find_value(other.convos, other.index_convo), other.index_message));
		break;
	}
}
if (dialogue.state == DIALOGUE.OFF) focus_pop();

