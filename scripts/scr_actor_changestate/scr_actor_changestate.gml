/// @function scr_actor_changestate(state)
/// @description changes actor to different state
/// @param {state} state the state the actor is switching to

state = argument[0];
with (argument[0]) {
	actor = other;
	event_user(STATE_EVENT_CHANGE);
}