enum ATTACK {
	CALM,
	MAD,
	PISSED,
	THROW
}

// states
state_index = STATE.IDLE;
face_index = FACE.DOWN;
attack_state = ATTACK.CALM;

// stats
wait_frames = round(random_range(150,250));
throw_frames = 60;
throw_anim_frames = 10;
attack_anger = 1;
throw_dist = 100;
anger_range = 130;

// misc
wait_timer = round(random_range(20,110));
update_timer = 0;
move_timer = 0;
move_frames = 30;
move_dir = 0;
spd = 1;
x_spd = 0;
y_spd = 0;
anger = 0;
eat = false;
weight = 0;
throw_timer = 1;
throw_anim_timer = 0;

// path
path = path_add();

// getting tilemaps
walls = [layer_tilemap_get_id("Walls"), 
		 layer_tilemap_get_id("Environment")];