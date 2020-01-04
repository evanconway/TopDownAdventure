/// @function scr_actor_createstate(state)
/// @description creates and connects state for an actor
/// @param {o_state} state to be returned

var _state = instance_create_depth(0, 0, LAYER_ACTORS, argument[0]);
_state.actor = id;
return _state;
