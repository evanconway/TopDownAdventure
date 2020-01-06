/// @description 

// Inherit the parent event
event_inherited();

if (actor == undefined || !instance_exists(actor)) instance_destroy(id);
else {
	x = actor.x;
	y = actor.y;
}
