/// @function scr_actor_changestate(state)
/// @description changes actor to different state
/// @param {state} state the state the actor is switching to
function scr_actor_changestate() {

	with (argument[0]) {
		if (!unlocked) return false;
		event_user(STATE_EVENT_CHANGE);
		return change;
	}



}
