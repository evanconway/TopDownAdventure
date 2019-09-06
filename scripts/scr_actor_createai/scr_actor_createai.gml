/// @function scr_actor_createai(ai)
/// @description creates and connects ai for an actor
/// @param {o_ai} ai to be returned

var _ai = instance_create_layer(0, 0, LAYER_ACTORS, argument[0]);
_ai.actor = id;
return _ai;
