#include <atmel_start.h>
#include "ina233.h"

float read_voltage(uint8_t address) {
		uint8_t voltage_buffer[2];
		
		i2c_m_sync_set_slaveaddr(&I2C_0, address, I2C_M_SEVEN);
		i2c_m_sync_cmd_read(&I2C_0, 0x88, voltage_buffer, sizeof(voltage_buffer));
		
		// To convert the "Direct" voltage form to a floating point number follow this equation from page 17 of the INA233 datasheet
		// X = (1/8)(reading*10^-2) = reading/800
		// The reading is sent back as 2 bytes, least significant byte first
		float voltage = ((voltage_buffer[1] << 8) + voltage_buffer[0]);
		voltage = voltage/800;
		return voltage;
}