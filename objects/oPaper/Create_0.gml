x_rand = round(random_range(-10, 10));
y_rand = round(random_range(-10, 10));
x_attack = oPlayer.x + x_rand;
y_attack = oPlayer.y + y_rand;
dir = point_direction(x, y, x_attack, y_attack);
direction = dir;
spd = 1;
speed = spd;