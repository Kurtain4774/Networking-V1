/// @description Insert description here
// You can write your code in this editor
/// @description Movement and Data

//Allow for movement only if our ID matches the client's
if (instance_exists(oClient) && (my_id == oClient.idd)) {

	//Basic Movement
	if keyboard_check(ord("W")) y -= 3;
		if keyboard_check(ord("S")) y += 3;
		if keyboard_check(ord("A")) x -= 3;
		if keyboard_check(ord("D")) x += 3;
		image_angle = point_direction(x, y, mouse_x, mouse_y);
	
	//Shooting Bullets
	var fire = mouse_check_button_pressed(mb_left);
	var barrel_x = x + lengthdir_x(48, image_angle);
	var barrel_y = y + lengthdir_y(48, image_angle);
	if (fire) {
		var my_bullet = instance_create_layer(barrel_x, barrel_y, "Instances", oBullet);	
		my_bullet.my_id = my_id;
		my_bullet.direction = image_angle;
		
		//Send our bullet's data to the server
		var bullet_buff = buffer_create(32, buffer_grow, 1);			//Create a new buffer for the bullet
		buffer_seek(bullet_buff, buffer_seek_start, 0);
		buffer_write(bullet_buff, buffer_u8, network.shoot);			//Use the new network.shoot enum for the packet ID
		buffer_write(bullet_buff, buffer_u16, my_bullet.my_id);			//Send the bullet's ID, x, y, and direction
		buffer_write(bullet_buff, buffer_s16, my_bullet.x);	
		buffer_write(bullet_buff, buffer_s16, my_bullet.y);
		buffer_write(bullet_buff, buffer_s16, my_bullet.direction);
		network_send_packet(oClient.client, bullet_buff, buffer_tell(bullet_buff));		//Send the packet to the server for it to handle
		buffer_delete(bullet_buff);
	}
	
	//Send Our Data
	var buff = buffer_create(32, buffer_grow, 1);
	buffer_seek(buff, buffer_seek_start, 0);
	buffer_write(buff, buffer_u8, network.move);					//Set the ID of the packet to the MOVE network enum
	buffer_write(buff, buffer_u16, my_id);							//Send our personal ID next so the other clients know who we are
	buffer_write(buff, buffer_s16, x);								//Send our X coordinate with s16 to allow for negative numbers
	buffer_write(buff, buffer_s16, y);								//Send Y coordinate respectively
	buffer_write(buff, buffer_s16, image_angle);					//Send our image angle
	buffer_write(buff, buffer_u16, hp);								//Send our HP as an integer
	network_send_packet(oClient.client, buff, buffer_tell(buff));	//Send this packet to the server using the client's socket
	buffer_delete(buff);											//Delete this buffer since we already sent it to the server

}
