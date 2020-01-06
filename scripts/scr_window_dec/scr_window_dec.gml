// decrease window size (but not below resolution)

var _resh = RESOLUTION_H;
var _mmax = display_get_height() / _resh;
o_camera.m_window = clamp(--o_camera.m_window, 1, _mmax);
if (WINDOW_H >= display_get_height()) window_set_fullscreen(true);
else {
	window_set_fullscreen(false);
	window_set_size(WINDOW_W, WINDOW_H);
}
