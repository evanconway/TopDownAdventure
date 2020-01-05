/// @description Resize Window

if (global.debug_active) {
	if (keyboard_check_pressed(vk_up)) m_window++;
	if (keyboard_check_pressed(vk_down)) m_window--;
	var _m_max = display_get_height() / RESOLUTION_H;
	m_window = clamp(m_window, 1, _m_max);
	window_set_size(WINDOW_W, WINDOW_H);
}
