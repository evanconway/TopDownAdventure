/// @description Deletion

if (delete_on_solid &&  place_meeting(x, y, o_solid)) {
	marked_for_deletion = true;
	// we create delete fx one layer lower so we can still see hit fx;
	if (delete_fx != undefined) instance_create_depth(x, y, LAYER_EFFECTS + 1, delete_fx);
	if (delete_snd != undefined) scr_play_sfx(delete_snd);
	//audio_stop_sound(miss_snd); // not sure I like this??
}

// marked_for_deletion is set by various other game elements
if (marked_for_deletion) instance_destroy(id);
