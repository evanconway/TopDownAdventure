/// @description 

// darken the game
if (active) {
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0, 0, WINDOW_W, WINDOW_H, false);
}

// Inherit the parent event
event_inherited();
