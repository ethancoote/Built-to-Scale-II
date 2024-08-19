
function check_player(){
	var _dist = distance_to_object(oPlayer);
	var _x_range = choose(-2,-1,0,1, 2);
	var _y_range = choose(-2,-1,0,1, 2);
	var _found_player = mp_grid_path(global.mp_grid, path, x, y, oPlayer.x + _x_range, oPlayer.y + _y_range, false);
	
	if _found_player {
		path_start(path, spd* 1.5, path_action_stop, false);
	}
}