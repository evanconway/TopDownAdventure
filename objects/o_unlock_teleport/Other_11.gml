/// @description 

// grant power on first interact
if (interact_player_interacted() && interactions <= 0) {
	global.player.player_state_dodge.unlocked = true;
}

// change sprite after first interaction
if (interactions > 0 && sprite_index == s_campfire_magic) {
	sprite_index = s_campfire;
	message_set = false;
	message = message_d;
}

// Inherit the parent event
event_inherited();
