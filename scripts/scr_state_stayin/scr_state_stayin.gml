/// @function scr_state_stayin(state)
/// @description returns true if state will stayin
/// @param {state} state the instance ID of the state to check stayin of

with (argument[0]) {
	event_user(STATE_EVENT_STAYIN);
	return stayin;
}
