/// @description 

// Inherit the parent event
event_inherited();

if (actor.state != id && shield_fx_id != undefined && instance_exists(shield_fx_id)) {
	instance_destroy(shield_fx_id);
}
