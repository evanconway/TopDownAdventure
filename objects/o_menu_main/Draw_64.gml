/// @description 

// Inherit the parent event
event_inherited();

// draw title
draw_set_font(f_title);
if (active) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_text_floor(VIEW_W/2, VIEW_H/6, "UNTITLED");
}
