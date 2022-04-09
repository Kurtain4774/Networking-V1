var packet = async_load[? "buffer"];
buffer_seek(packet, buffer_seek_start, 0);

var PACKET_ID = buffer_read(packet, buffer_u8);

switch (PACKET_ID) {
	#region Join
	case network.join:
		//When we get the packet of someone shooting, we need to read the data and perform a few actions
		//First we need to get the bullet's ID before anything
		var bullet_id = buffer_read(packet, buffer_u16);
		
		var find_player = ds_map_find_value(instances, bullet_id);		//Find the instance ID of the player through the instance map
		
		//If there is no player with that ID in our map, then create one and add it to the map
		if (is_undefined(find_player)) {
			var p = instance_create_layer(0,0, "Instances", oPlayer);
			ds_map_add(instances, bullet_id, p);
		}
	break;
	#endregion

}
	
	
