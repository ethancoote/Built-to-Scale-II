// update delta_time
actual_delta = delta_time/1000000;
global.delta_mult = actual_delta/target_delta;

show_debug_message(string(timer_stop));
if (room == Level1Room || room == Level2Room) && !timer_stop {
	timer -= (1/60) * global.delta_mult;
}

if start_music == true && room == MenuRoom {
	audio_play_sound(song1, 99, true, 0.5);
	start_music = false;
}
if timer <= 0 {
	oPlayer.hp = 0;
}


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
		timer_stop = true;
		if room != MenuRoom {
			LootLockerSubmitScore("24185", string(timer));
			audio_play_sound(win2, 0, false, 0.3);
			oGame.win = true;
		}
	}
}
 


if room != NameRoom {
	audio_listener_position(oPlayer.x, oPlayer.y, 0);
	if oPlayer.lose {
		timer_stop = true;
	}
}


if level_change_timer > 0 {
	level_change_timer--;
	if level_change_timer == 1 {
		room_goto(level_room[level]);
	}
}

if set_ll_name == true {
	LootLockerSetPlayerName(ll_name);
	set_ll_name = false;
}