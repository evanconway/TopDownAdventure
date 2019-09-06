/// @description Read Me

/*
This is our first attempt at some sort of event management system. This object does literally nothing 
except contain the ID of the instance making the event, the ID of the instance it targets (if needed),
and the event type, which is determined by an enumerator. 
*/

enum EVENT {
	HITBOX,
	SOMETHING
}

type = undefined;
maker = undefined;
target = undefined;
