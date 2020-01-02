/// @param choice
var _ID;
with (instance_create_layer(x, y, LAYER_MENUS, argument[0])) {
	menu = other;
	_ID = id;
}

return _ID;
