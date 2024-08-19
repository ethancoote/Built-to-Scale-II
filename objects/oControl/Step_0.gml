if level_weight[level] <= weight {
	win = true;
	level+= 1;
	if level != max_level {
		level_change_timer = level_change_frames;
	}
	
}

if win {
	win = false;
	instance_create_depth(oPlayer.x, oPlayer.y, 1, oHole, {
		image_index: 0
	});
	oPlayer.win = true;
	
	// win level
	if level == max_level {
		if room != MenuRoom {
			oGame.win = true;
		}
	}
}

if level_change_timer > 0 {
	level_change_timer--;
	if level_change_timer == 1 {
		room_goto(level_room[level]);
	}
}