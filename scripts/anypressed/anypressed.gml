/// @description returns true if any buttons on controller are pressed

for (var i = 0; i < INPUT.SIZE; i++) {
	if (pressed(i)) return true;
}

return false;
