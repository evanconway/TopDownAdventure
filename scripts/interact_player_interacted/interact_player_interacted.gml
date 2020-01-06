/*
So here's a crazy weird solution for interaction detection. The player object itself 
doesn't have any code related to detection, this script checks a point a specific 
position in relation to the player, and checks if that point is colliding with the
interact object that called this script. This script then returns true or false
depending on the result.
*/

var result = false;
if (global.player == undefined) return result;
if (!instance_exists(global.player)) return result;
if (!input_pressed(INPUT.INTERACT)) return result;

var _detect_dist = 10;

with (global.player) {
	switch (actdirection) {
		case DIR.UP:
		result = position_meeting(x, y - _detect_dist - 1, other);
		break;
		case DIR.DOWN:
		result = position_meeting(x, y + _detect_dist, other);
		break;
		case DIR.LEFT:
		result = position_meeting(x - _detect_dist - 1, y, other);
		break;
		case DIR.RIGHT:
		result = position_meeting(x + _detect_dist, y, other);
		break;
	}
}

return result;