/// @description Handle Events

shader = undefined;

with (o_event_actor_shader) {
	if (id_actor == other) {
		other.shader = shader;
	}
}

image_alpha = 1;
with (o_event_actor_alpha) {
	if (id_actor == other) {
		other.image_alpha = alpha;
	}
}
