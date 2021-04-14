/// @function approach_solid_x(xmove)
/// @description returns the x distance to the nearest wall, or xmove if no wall is touched
/// @param {real} xmove x distance to move towards wall
function approach_solid_x() {

	if (argument[0] == 0) return 0;

	var _xmove = argument[0];
	var _x = 0;
	var _xprev = _x;
	var _checking = true;

	while (_checking) {
		_xprev = _x;
		_x += sign(_xmove);
		if (abs(_x) > abs(_xmove)) {
			_x = _xmove;
			_checking = false;
		}
		if (place_meeting(x + _x, y, o_solid)) {
			_x = _xprev;
			_checking = false;
		}
	}

	return _x;



}
