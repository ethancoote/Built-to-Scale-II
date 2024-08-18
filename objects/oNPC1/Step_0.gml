
#region Attack

// set attack state
if anger >= attack_anger {
	attack_state = ATTACK.PISSED;
} else if anger > 0 {
	attack_state = ATTACK.MAD;
} else {
	attack_state = ATTACK.CALM;
}

// increase anger
if attack_state != ATTACK.PISSED {
	if eat == true {
		eat = false;
		var _dist = distance_to_object(oPlayer);
		if _dist < 110 {
			anger += weight;
		}
	}
}

// attack pissed
if attack_state == ATTACK.PISSED {
	check_player();
}

#endregion

#region Depth

if oPlayer.y < y {
	depth = 200;
} else {
	depth = 202;
}

#endregion

#region Movement
if attack_state == ATTACK.CALM {
	// movement
	if state_index == STATE.IDLE {
		x_spd = 0;
		y_spd = 0;
		if wait_timer > 0 {
			wait_timer--;
		} else {
			wait_timer = wait_frames;
			move_timer = move_frames;
			state_index = STATE.RUN;
			move_dir = irandom(3);
		}
	}

	if state_index == STATE.RUN {
		// set move direction
		if move_timer > 0 {
			if move_dir == 0 {
				x_spd = -spd;
				y_spd = 0;
				face_index = FACE.LEFT;
			} else if move_dir == 1 {
				x_spd = spd;
				y_spd = 0;
				face_index = FACE.RIGHT;
			} else if move_dir == 2 {
				x_spd = 0;
				y_spd = -spd;
				face_index = FACE.UP;
			} else if move_dir == 3 {
				x_spd = 0;
				y_spd = spd;
				face_index = FACE.DOWN;
			}
			move_timer--;
		} else {
			state_index = STATE.IDLE;
		}
	}
} else if attack_state == ATTACK.PISSED {
	state_index = STATE.RUN;
	if direction > 45 && direction < 135 {
		face_index = FACE.UP;
	} else if direction > 135 && direction < 225 {
		face_index = FACE.LEFT;
	} else if direction > 225 && direction < 315 {
		face_index = FACE.DOWN;
	} else if direction > 315 || direction < 45 {
		face_index = FACE.RIGHT;
	}
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
		sprite_index = sIdleUp1;
	} else if face_index == FACE.DOWN {
		sprite_index = sIdleDown1;
	} else if face_index == FACE.LEFT {
		sprite_index = sIdleLeft1;
	} else if face_index == FACE.RIGHT {
		sprite_index = sIdleRight1;
	}
} else if state_index == STATE.RUN {
	if face_index == FACE.UP {
		sprite_index = sRunUp1;
	} else if face_index == FACE.DOWN {
		sprite_index = sRunDown1;
	} else if face_index == FACE.LEFT {
		sprite_index = sRunLeft1;
	} else if face_index == FACE.RIGHT {
		sprite_index = sRunRight1;
	}
}

#endregion