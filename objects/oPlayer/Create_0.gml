// stats
spd = 2.5;
depth = 0;

// states
enum STATE {
	IDLE,
	RUN
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


// getting tilemaps
walls = [layer_tilemap_get_id("Walls"), 
		 layer_tilemap_get_id("Environment")];