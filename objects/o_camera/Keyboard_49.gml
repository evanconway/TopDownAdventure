/// @description Resize Window

if (global.debug_active) {
	if (keyboard_check_pressed(vk_up)) m_window_h++;
	if (keyboard_check_pressed(vk_down)) m_window_h--;
	if (keyboard_check_pressed(vk_left)) m_window_w--;
	if (keyboard_check_pressed(vk_right)) m_window_w++;
	m_window_h = clamp(m_window_h, m_min, m_max);
	m_window_w = clamp(m_window_w, m_min, m_max);
	window_set_size(WINDOW_W, WINDOW_H);
}
