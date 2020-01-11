/// @description 

/*
We're setting the dialogue text here instead of in the creation code, so that
way we only need to set the message in the room editor. 
*/
if (!convos_set) {
	for (var i = 0; i < ds_list_size(convos); i++) {
		with (dialogue) dialogue_settext(ds_list_find_value(ds_list_find_value(convos, index_convo), index_message));
	}
	convos_set = true;
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
			// increase message index and set text if not at convo end
			if (++index_message < ds_list_size(ds_list_find_value(convos, index_convo))) {
				dialogue_settext(ds_list_find_value(ds_list_find_value(convos, index_convo), index_message));
			} else {
				// at convo end, reset message and increase convo
				index_convo++;
				index_message = 0;
				state = DIALOGUE.CLOSING;
				// set text if not last convo, otherwise close 
			}
			break;
		}
	}
	if (state == DIALOGUE.OFF) focus_pop();
}
