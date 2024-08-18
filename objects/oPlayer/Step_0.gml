// get controls
var _i = get_gamepad();
get_controls(_i);

#region Hit
// got hit
if hit {
	hit = false;
	if hit_timer <= 0 && state_index != STATE.STILL{
		hit_timer = hit_frames;
		oCamera.shake_frames = 12;
		oCamera.shake_pow = 2;
		oCamera.shake = true;
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
var _inst = instance_place(x, y, oFood);
if _inst != noone {
	oControl.weight += _inst.weight;
	oNPC1.eat = true;
	oNPC1.weight = _inst.weight;
	oCamera.shake_frames = 6;
	oCamera.shake_pow = 1;
	oCamera.shake = true;
	instance_destroy(_inst);
}

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
if hp <= 0 {
	oGame.lose = true;
	state_index = STATE.STILL;
	x_spd = 0;
	y_spd = 0;
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
} else if state_index == STATE.STILL {
	if image_index == 13 {
		image_speed = 0;
	}
	sprite_index = sFall;

}

#endregion



