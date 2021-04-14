/// @description Resize View

if (global.debug_active) {
	if (keyboard_check_pressed(vk_up)) m_view++;
	if (keyboard_check_pressed(vk_down)) m_view--;
	m_view = clamp(m_view, m_min, m_max);
}
