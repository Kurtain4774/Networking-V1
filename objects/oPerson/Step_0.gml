/// @description Insert description here
// You can write your code in this editor


//Send Our Data
var buff = buffer_create(32, buffer_grow, 1);
buffer_seek(buff, buffer_seek_start, 0);
buffer_write(buff, buffer_u8, network.join);					//Set the ID of the packet to the MOVE network enum
buffer_write(buff, buffer_u16, my_id);					//Send our HP as an integer
network_send_packet(oWaiting.client, buff, buffer_tell(buff));	//Send this packet to the server using the client's socket
buffer_delete(buff);
	
