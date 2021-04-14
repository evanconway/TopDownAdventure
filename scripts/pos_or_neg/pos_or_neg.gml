/// @description pos_or_neg(real)
/// @param number
function pos_or_neg() {

	if (irandom_range(0, 1) == 1) return argument[0];
	else return -1 * argument[0];


}
