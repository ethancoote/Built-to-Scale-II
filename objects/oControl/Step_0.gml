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
			audio_play_sound(win2, 0, false, 0.5);
			oGame.win = true;
		}
	}
}

audio_listener_position(oPlayer.x, oPlayer.y, 0);

if level_change_timer > 0 {
	level_change_timer--;
	if level_change_timer == 1 {
		room_goto(level_room[level]);
	}
}