/// @param choice
function menu_createchoice() {
	var _ID;
	with (instance_create_depth(x, y, depth - 1, argument[0])) {
		menu = other;
		_ID = id;
	}

	return _ID;



}
