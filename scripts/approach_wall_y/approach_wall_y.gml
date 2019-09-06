/// @function approach_wall_y(ymove)
/// @description returns the y distance to the nearest wall, or ymove if no wall is touched
/// @param {real} ymove y distance to move towards wall

if (argument[0] == 0) return 0;

var _ymove = argument[0];
var _y = 0;
var _yprev = _y;
var _checking = true;

while (_checking) {
	_yprev = _y;
	_y += sign(_ymove);
	if (abs(_y) > abs(_ymove)) {
		_y = _ymove;
		_checking = false;
	}
	if (place_meeting(x, y +_y, o_wall)) {
		_y = _yprev;
		_checking = false;
	}
}

return _y;
