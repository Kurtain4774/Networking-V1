/// @description Insert description here
// You can write your code in this editor
if (my_id != other.my_id) {
	//Check if we will die from this bullet or not
	var estimated_hp = hp - other.damage;
	
	//Take damage or die and respawn
	if (estimated_hp <= 0) {
		x = random(room_width);
		y = random(room_height);
		hp = 100;
	} else {
		hp -= other.damage;	
	}
	
	//Destroy the bullet that hit us
	with (other) { instance_destroy(); }
}