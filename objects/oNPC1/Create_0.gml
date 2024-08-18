enum ATTACK {
	CALM,
	MAD,
	PISSED
}

// states
state_index = STATE.IDLE;
face_index = FACE.DOWN;
attack_state = ATTACK.CALM;

// stats
wait_frames = 200;
attack_anger = 5;

// misc
wait_timer = 60;
move_timer = 0;
move_frames = 30;
move_dir = 0;
x_spd = 0;
y_spd = 0;
anger = 0;
eat = false;
weight = 0;

// getting tilemaps
walls = [layer_tilemap_get_id("Walls"), 
		 layer_tilemap_get_id("Environment")];