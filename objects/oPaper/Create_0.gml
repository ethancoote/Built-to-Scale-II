x_rand = round(random_range(-10, 10));
y_rand = round(random_range(-10, 10));
x_attack = oPlayer.x + x_rand;
y_attack = oPlayer.y + y_rand;
dir = point_direction(x, y, x_attack, y_attack);
direction = dir;
spd = random_range(1.4, 1.8);
speed = spd;
hit = false;
depth_timer = 10;

walls = layer_tilemap_get_id("Walls");

audio_emitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance_clamped);