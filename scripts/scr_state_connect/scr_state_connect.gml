/// @function scr_state_connect(state)
/// @description returns true if actor can switch to state
/// @param {state} state the instance ID of the state getting checked

with (argument[0]) {
	event_user(STATE_EVENT_CONNECT);
	return connect;
}