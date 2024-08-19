// stats
spd = 2;
base_depth = depth;
hit_frames = 20;
hp = 3;

// states
enum STATE {
	IDLE,
	RUN,
	STILL
}

enum FACE {
	UP,
	DOWN,
	LEFT,
	RIGHT
}

// timers and movement
hor_move = 0;
ver_move = 0;
x_spd = 0;
y_spd = 0;
face_index = FACE.DOWN;
state_index = STATE.IDLE;
win = false;
hit = false;
hit_timer = 0;
colour = c_white;
start_pos = [x, y];
falling = true;
done_fall = true;
//fall_frames = 15;
//fall_timer = 0;

// getting tilemaps
walls = [layer_tilemap_get_id("Walls"), 
		 layer_tilemap_get_id("Environment"),
		 oPot1, oPot2, oPot3];
		 
walls1 = [layer_tilemap_get_id("Walls"), 
		 layer_tilemap_get_id("Environment")];
		 