/// @function scr_actor_changestate(state)
/// @description changes actor to different state
/// @param {state} state the state the actor is switching to

with (argument[0]) {
	event_user(STATE_EVENT_CHANGE);
	return change;
}
