
#region Setup
// get controls
var _i = get_gamepad();
get_controls(_i);

// audio
var _pitch = random_range(0.6, 0.9);

// weight scaling
/*
image_xscale = 1 * (oControl.weight/100);

if image_xscale < 0.9 {
	image_xscale = 0.9;
}*/

#endregion

#region Walls

if oControl.weight >= 171 {
	walls = walls_free;
} else if oControl.weight >= 155 {
	walls = walls_1_tree;
} else if oControl.weight >= 135 {
	walls = walls_2_tree;
} else if oControl.weight >= 117 {
	walls = walls1;
}

#endregion

#region Hit
// got hit
if hit {
	hit = false;
	if hit_timer <= 0 && state_index != STATE.STILL{
		hit_timer = hit_frames;
		oCamera.shake_frames = 12;
		oCamera.shake_pow = 2;
		oCamera.shake = true;
		audio_play_sound(grunt1, 1, false);
		hp--;
	}
}

if hit_timer > 0 {
	hit_timer--;
	colour = c_red;
	spd = 3.5;
} else {
	colour = c_white;
	spd = 2.5;
}
#endregion

#region Movement
// movement
hor_move = right_key - left_key;
ver_move = down_key - up_key;
x_spd = hor_move * spd;
y_spd = ver_move * spd;

// diagonal slow
if x_spd != 0 && y_spd != 0 {
	x_spd = x_spd * .707;
	y_spd = y_spd * .707;
}

// set state
if x_spd != 0 || y_spd != 0 {
	state_index = STATE.RUN;
} else {
	state_index = STATE.IDLE;
}

#endregion

#region Face
// setting face
if x_spd > 0 {
	face_index = FACE.RIGHT;
} else if x_spd < 0 {
	face_index = FACE.LEFT;
}

if y_spd > 0 {
	face_index = FACE.DOWN;
} else if y_spd < 0 {
	face_index = FACE.UP;
}

#endregion

#region Eat
// eat
var _list = ds_list_create();
var _num = instance_place_list(x, y, oFood, _list, false);

if _num > 0 && done_fall{
	for (var _j = 0; _j < _num; _j++) {
		if oControl.weight >= _list[| _j].min_weight {
			var _k = choose(0, 1);
			var _pitch2 = random_range(0.8, 1.2);
			audio_play_sound(pop1, 1, false, 0.4, 0, _pitch2);
			audio_play_sound(eat_sounds[_k], 1, false, 0.5, 0, _pitch);
			
			oControl.weight += _list[| _j].weight;
			with (oNPC1) {
				weight = 0.4;
				eat = true;
				
			}
			//oCamera.shake_frames = 6;
			//oCamera.shake_pow = 1;
			//oCamera.shake = true;
			instance_destroy(_list[| _j]);
		}
	}
	
}
ds_list_destroy(_list);

#endregion

#region Win
// win condition
if win {
	x_spd = 0;
	y_spd = 0;
	state_index = STATE.STILL;
}
#endregion

#region Lose
// lose
if hp <= 0 && !lose{
	oGame.lose = true;
	audio_play_sound(lose1, 0, false);
	
	lose = true;
}

if lose {
	state_index = STATE.STILL;
	oControl.timer_stop = true;
	x_spd = 0;
	y_spd = 0;
}

#endregion

#region MoveSound

if x_spd != 0 || y_spd != 0 {
	if step_timer == 0 {
		var _pitch1 = random_range(0.7, 1.2);
		var _gain = random_range(0.1, 0.6);
		audio_play_sound(step1, 0, false, _gain, 0, _pitch1);
		step_timer = step_frames
	} else {
		step_timer--;
	}
}

#endregion

#region Scaling

image_xscale = 1 * oControl.weight/100;
image_yscale = 1 * oControl.weight/100;

#endregion

#region Collision
// y collision
var _sub_pixel = 0.5;
if place_meeting(x, y+y_spd, walls) {
	var _pixel_check = _sub_pixel * sign(y_spd);
	
	while !place_meeting(x, y + _pixel_check, walls) {
		y += _pixel_check;
	}
	y_spd = 0;
}

y += y_spd;

// x collision
if place_meeting(x+x_spd, y, walls) {
	var _pixel_check = _sub_pixel * sign(x_spd);
	
	while !place_meeting(x + _pixel_check, y, walls) {
		x += _pixel_check;
	}
	x_spd = 0;
}

x += x_spd;

#endregion

#region Menu

if room == MenuRoom {
	state_index = STATE.STILL;
}

#endregion

#region Fall In
if room != MenuRoom && room != Level1Room && falling {
	y -= 500;
	done_fall = false;
	falling = false;
}

if y < start_pos[1] && done_fall == false {
	y += 25;
} else {
	done_fall = true;
}

#endregion

#region Animation
// idle
if state_index == STATE.IDLE {
	if face_index == FACE.UP {
		sprite_index = sIdleUp;
	} else if face_index == FACE.DOWN {
		sprite_index = sIdleDown;
	} else if face_index == FACE.LEFT {
		sprite_index = sIdleLeft;
	} else if face_index == FACE.RIGHT {
		sprite_index = sIdleRight;
	}
} else if state_index == STATE.RUN {
	if face_index == FACE.UP {
		sprite_index = sRunUp;
	} else if face_index == FACE.DOWN {
		sprite_index = sRunDown;
	} else if face_index == FACE.LEFT {
		sprite_index = sRunLeft;
	} else if face_index == FACE.RIGHT {
		sprite_index = sRunRight;
	}
} else if state_index == STATE.STILL {
	if image_index == 13 {
		image_speed = 0;
	}
	sprite_index = sFall;

}

#endregion



