/// @description Delete If No Target

if (target_ins == undefined && target_obj == undefined) {
	show_debug_message("Deleting attack ID: " + string(id) + " with no target");
	instance_destroy(id);
}
