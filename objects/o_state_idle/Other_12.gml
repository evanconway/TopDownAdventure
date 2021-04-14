/// @description Remain

var _remain = true;

with (actor.ai.controller) {
	if (anydown()) _remain = false;
}

remain = _remain;