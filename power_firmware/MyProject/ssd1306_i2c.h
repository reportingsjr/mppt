/*
 * ssd1306_i2c.h
 *
 * Created: 5/9/2017 6:25:04 PM
 *  Author: pvallone
 */ 


#ifndef SSD1306_I2C_H_
#define SSD1306_I2C_H_


#define I2C_READ    1
#define I2C_WRITE	0

#define CONF_I2C_MASTER_MODULE SERCOM2
#define ADDRESS 0x3C

void write_command(uint8_t cmd);


#endif /* SSD1306_I2C_H_ */