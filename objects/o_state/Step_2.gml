/// @description Delete If No actor

if (actor == undefined || !instance_exists(actor)) instance_destroy(id);

// remember that all states must be set to persistent