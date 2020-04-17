/*
 * ssd1306_i2c.c
 *
 * Created: 5/9/2017 6:25:16 PM
 *  Author: pvallone
 */ 
#include <atmel_start.h>
#include "hal_i2c_m_sync.h"
 #include "ssd1306_i2c.h"

 void write_command(uint8_t cmd){	 
	uint8_t buff[2];
	buff[0] = I2C_WRITE;
	buff[1] = cmd;

	struct _i2c_m_msg       msg;
	int32_t                 ret;

	msg.addr   = ADDRESS;
	msg.len    = 2;
	msg.flags  = I2C_M_STOP;
	msg.buffer = buff;

	ret = _i2c_m_sync_transfer(&I2C_0, &msg);	 
 }
