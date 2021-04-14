/// @description Delete if no actor

if (actor == undefined || !instance_exists(actor)) instance_destroy(id);