/// @description returns true if any buttons on controller are down

for (var i = 0; i < INPUT.SIZE; i++) {
	var _check = down(i);
	if (_check) return true;
}

return false;
