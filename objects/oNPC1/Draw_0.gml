draw_self();

if anger > 0 && attack_state != ATTACK.PISSED && attack_state != ATTACK.THROW && annoy_timer > 0 {
	draw_sprite(sAnnoy, 0, x, y - 20); 
	annoy_timer--;
}

if (attack_state == ATTACK.PISSED || attack_state == ATTACK.THROW) /*&& angry_timer > 0*/ {
	draw_sprite(sAngry, 0, x, y - 20); 
	//angry_timer--;
}

