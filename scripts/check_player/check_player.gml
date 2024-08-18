
function check_player(){
	var _dist = distance_to_object(oPlayer);
	
	var _found_player = mp_grid_path(global.mp_grid, path, x, y, oPlayer.x, oPlayer.y, false);
	
	if _found_player {
		path_start(path, spd, path_action_stop, false);
	}
}