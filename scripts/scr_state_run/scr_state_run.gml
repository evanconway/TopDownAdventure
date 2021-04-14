/// @function scr_state_run(state)
/// @description run logic of the current state
/// @param {state} state the state whos logic is to be run
function scr_state_run() {

	with (argument[0]) {
		event_user(STATE_EVENT_LOGIC);
	}


}
