/// @description 

if (actor.state != id) exit;

// intercept, and delete, all hurt events
with (o_event_hurt) {
	if (id_hurtbox == other.actor.hurtbox) instance_destroy(id);
}
