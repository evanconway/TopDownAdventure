/// @description Resize Resolution

if (global.debug_active) {
	if (keyboard_check_pressed(vk_up)) m_resolution_h++;
	if (keyboard_check_pressed(vk_down)) m_resolution_h--;
	if (keyboard_check_pressed(vk_left)) m_resolution_w--;
	if (keyboard_check_pressed(vk_right)) m_resolution_w++;
	m_resolution_h = clamp(m_resolution_h, m_min, m_max);
	m_resolution_w = clamp(m_resolution_w, m_min, m_max);
	surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
}
