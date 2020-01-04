/// @description 

if (place_meeting(x, y, global.player)) {
	with (instance_create_depth(x, y, LAYER_SCENES, o_scene_door)) {
		door_start = other;
		room_start = room;
		door_end = other.target_door;
		room_end = other.target_room;
		focus_push(id);
	}
}
