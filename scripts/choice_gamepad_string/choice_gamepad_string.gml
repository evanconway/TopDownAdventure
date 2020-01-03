/// @param gamepad_enum

var result = "";

switch (argument0) {
	case GAMEPAD.LS_UP:
	result = "LS_UP";
	break;
	case GAMEPAD.LS_DOWN:
	result = "LS_DOWN";
	break;
	case GAMEPAD.LS_LEFT:
	result = "LS_LEFT";
	break;
	case GAMEPAD.LS_RIGHT:
	result = "LS_RIGHT";
	break;
	case GAMEPAD.LS_CLICK:
	result = "LS_CLICK";
	break;
	case GAMEPAD.RS_UP:
	result = "RS_UP";
	break;
	case GAMEPAD.RS_DOWN:
	result = "RS_DOWN";
	break;
	case GAMEPAD.RS_LEFT:
	result = "RS_LEFT";
	break;
	case GAMEPAD.RS_RIGHT:
	result = "RS_RIGHT";
	break;
	case GAMEPAD.RS_CLICK:
	result = "RS_CLICK";
	break;
	case GAMEPAD.DP_UP:
	result = "DP_UP";
	break;
	case GAMEPAD.DP_DOWN:
	result = "DP_DOWN";
	break;
	case GAMEPAD.DP_LEFT:
	result = "DP_LEFT";
	break;
	case GAMEPAD.DP_RIGHT:
	result = "DP_RIGHT";
	break;
	case GAMEPAD.FACE1: // A (xbox)
	result = "FACE1";
	break;
	case GAMEPAD.FACE2: // B (xbox)
	result = "FACE2";
	break;
	case GAMEPAD.FACE3: // X (xbox)
	result = "FACE3";
	break;
	case GAMEPAD.FACE4: // Y (xbox)
	result = "FACE4";
	break;
	case GAMEPAD.TRIGGER_R:
	result = "TRIGGER_R";
	break;
	case GAMEPAD.TRIGGER_L:
	result = "TRIGGER_L";
	break;
	case GAMEPAD.BUMPER_R:
	result = "BUMPER_R";
	break;
	case GAMEPAD.BUMPER_L:
	result = "BUMPER_L";
	break;
	case GAMEPAD.START:
	result = "START";
	break;
	case GAMEPAD.SELECT:
	result = "SELECT";
	break;
}

return result;