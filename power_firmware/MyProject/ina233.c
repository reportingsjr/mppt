#include <atmel_start.h>
#include "ina233.h"

// List of commands on page 23 of the datasheet

float get_voltage(uint8_t address) {
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

float get_current(uint8_t address, float current_lsb) {
	uint8_t buffer[2];
	i2c_m_sync_set_slaveaddr(&I2C_0, address, I2C_M_SEVEN);
	i2c_m_sync_cmd_read(&I2C_0, 0x89, &buffer, sizeof(buffer));

	// This calculation assumes that no shifting was used to prevent rounding errors.
	return (((uint16_t) buffer[1]) << 8 + buffer[0])*current_lsb;
}

// max_current_expected: max current in Amps
// r_shunt: shunt resistance in Ohms
// returns the value to send to the IC
uint16_t calc_current_calibration(float max_current_expected, float r_shunt) {
	// The formula for this is CAL = 0.00512/(current_lsb * Rshunt)
	// current_lsb = max current expected/2^15
	float current_lsb = max_current_expected/(1 << 15);
	float cal = 0.00512/(current_lsb*r_shunt);
	return (uint16_t) cal;
}

void set_current_calibration(uint8_t address, uint16_t calibration) {
	uint8_t buffer[3];

	// register address
	buffer[0] = 0xD4;
	// lop off the MSB and store the LSB in the first spot
	buffer[1] = (uint8_t) calibration;
	// shift the MSB down and store it in the second spot
	buffer[2] = (uint8_t) (calibration >> 8);

	//i2c_m_sync_set_slaveaddr(&I2C_0, address, I2C_M_SEVEN);
	//i2c_m_sync_cmd_write(&I2C_0, 0xD4, buffer, sizeof(buffer));
	struct _i2c_m_msg temp;
	temp.addr = address;
	temp.flags = I2C_M_SEVEN | I2C_M_STOP;
	temp.len = 3;
	temp.buffer = &buffer;

	ret = _i2c_m_sync_transfer(&I2C_0->device, &temp);
}

// Doesn't really do anything other than have the IC return 0xB0
uint8_t get_capability(uint8_t address) {
	uint8_t buffer;

	i2c_m_sync_set_slaveaddr(&I2C_0, address, I2C_M_SEVEN);
	i2c_m_sync_cmd_read(&I2C_0, 0x19, &buffer, sizeof(buffer));

	return buffer;
}

void clear_faults(uint8_t address) {
		i2c_m_sync_set_slaveaddr(&I2C_0, address, I2C_M_SEVEN);
		i2c_m_sync_cmd_write(&I2C_0, 0x03, 0, 1);
}