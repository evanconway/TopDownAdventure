/// @description 

if (draw_black_box) {
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_rectangle(0, 0, room_width, room_height, false);
}

// Inherit the parent event
event_inherited();

