/// @description 

/*
Some thoughts I wanted to put here: since interact objects have their own logic
event that's run once the interact has focus, I thought we coult put the
logic from the door scene into the door event.
Except we cant... once we go to the next room, the door instance running the 
logic no longer exists. We have to use a persistent object, like a scene, to
do room-to-room transitions. 
*/

if (place_meeting(x, y, global.player) && target_door != undefined && target_room != undefined) {
	with (instance_create_depth(x, y, LAYER_SCENES, o_scene_door)) {
		door_start = other;
		room_start = room;
		door_end = other.target_door;
		room_end = other.target_room;
		focus_push(id);
	}
}
