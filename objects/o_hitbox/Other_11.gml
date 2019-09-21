/// @description Play Miss Sound

var _miss_ins = false;
var _miss_obj = false;

if (target_ins != undefined) {
	if (!place_meeting(x, y, target_ins)) _miss_ins = true;
} else _miss_ins = true;

if (target_obj != undefined) {
	if (!place_meeting(x, y, target_obj)) _miss_obj = true;
} else _miss_obj = true;

if (_miss_ins && _miss_obj) scr_play_sfx(miss_snd);
