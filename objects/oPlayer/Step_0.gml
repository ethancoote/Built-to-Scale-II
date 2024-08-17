// get controls
var _i = get_gamepad();
get_controls(_i);

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
var _inst = instance_place(x, y, oFood);
if _inst != noone {
	instance_destroy(_inst);
}

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
}

#endregion



