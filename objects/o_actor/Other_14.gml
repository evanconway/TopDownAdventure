/// @description Handle Events

shader = undefined;

with (o_event_actor_shader) {
	if (id_actor == other) {
		other.shader = shader;
	}
}

var _self = id;

image_alpha = 1;
with (o_event_actor_alpha) {
	if (id_actor == other.id) {
		other.image_alpha = alpha;
	}
}
