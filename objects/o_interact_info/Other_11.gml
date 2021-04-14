/// @description Detect Interact Button

if (interact_player_interacted()) {
	focus_push(id);
	dialogue.state = DIALOGUE.OPENING;
	interactions++;
}
