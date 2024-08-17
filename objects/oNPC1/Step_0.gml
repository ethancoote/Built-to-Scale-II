
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