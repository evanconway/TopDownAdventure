/// @description Resize View

if (global.debug_active) {
	if (keyboard_check_pressed(vk_up)) m_view_h++;
	if (keyboard_check_pressed(vk_down)) m_view_h--;
	if (keyboard_check_pressed(vk_left)) m_view_w--;
	if (keyboard_check_pressed(vk_right)) m_view_w++;
	m_view_h = clamp(m_view_h, m_min, m_max);
	m_view_w = clamp(m_view_w, m_min, m_max);
}
