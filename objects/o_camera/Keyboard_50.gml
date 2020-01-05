/// @description Resize Resolution

if (global.debug_active) {
	if (keyboard_check_pressed(vk_up)) m_resolution++;
	if (keyboard_check_pressed(vk_down)) m_resolution--;
	m_resolution = clamp(m_resolution, m_min, m_max);
	surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
}
