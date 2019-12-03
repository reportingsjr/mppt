// Jon Neal 2019
// Code available under MIT license

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
	float ret = convert_signed_2s_complement(buffer[1], buffer[0])*current_lsb;
	return ret;
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
	write_register_word(address, 0xD4, calibration);
}

// Doesn't really do anything other than have the IC return 0xB0
uint8_t get_capability(uint8_t address) {
	uint8_t buffer;

	i2c_m_sync_set_slaveaddr(&I2C_0, address, I2C_M_SEVEN);
	i2c_m_sync_cmd_read(&I2C_0, 0x19, &buffer, sizeof(buffer));

	return buffer;
}

void clear_faults(uint8_t address) {
		write_register_byte(address, 0x03, 0);
}

void write_register_byte(uint8_t address, uint8_t register_address, uint8_t data) {
	// i2c_m_sync_cmd_write cannot be used to write the INA233's registers
	// as the IC expects the register address and data byte(s) to be sent
	// in one I2C/PMBus transfer. i2c_m_sync_cmd_write sends the register address
	// as its own transfer and then the data as its own.

	uint8_t temp_buffer[2];

	// register address
	temp_buffer[0] = register_address;
	// lop off the MSB and store the LSB in the first spot
	temp_buffer[1] = data;

	struct _i2c_m_msg temp;
	temp.addr = address;
	temp.flags = I2C_M_SEVEN | I2C_M_STOP;
	temp.len = 2;
	temp.buffer = &temp_buffer;

	_i2c_m_sync_transfer(&I2C_0, &temp);
}

void write_register_word(uint8_t address, uint8_t register_address, uint16_t data) {
	// i2c_m_sync_cmd_write cannot be used to write the INA233's registers
	// as the IC expects the register address and data byte(s) to be sent
	// in one I2C/PMBus transfer. i2c_m_sync_cmd_write sends the register address
	// as its own transfer and then the data as its own.

	uint8_t temp_buffer[3];

	// register address
	temp_buffer[0] = register_address;
	// lop off the MSB and store the LSB in the first spot
	temp_buffer[1] = (uint8_t) data;
	// shift the MSB down and store it in the second spot
	temp_buffer[2] = (uint8_t) (data >> 8);

	struct _i2c_m_msg temp;
	temp.addr = address;
	temp.flags = I2C_M_SEVEN | I2C_M_STOP;
	temp.len = 3;
	temp.buffer = &temp_buffer;

	_i2c_m_sync_transfer(&I2C_0, &temp);
}

int16_t convert_signed_2s_complement(uint8_t msb, uint8_t lsb) {
	uint16_t decombobulated_value = ((uint16_t) msb << 8) + lsb;
	int16_t return_value;

	// If the most significant bit is set this is a negative number
	if((0x8000 & decombobulated_value) == 0x8000) {
		return_value = (~decombobulated_value) + 1;
		return_value = return_value*-1;
		return return_value;
	}

	// otherwise it is positive and we don't do anything except cast it
	return_value = (int16_t) decombobulated_value;
	return return_value;
}

// see header files for defines to pass to this function
void set_adc_config(uint8_t address, uint8_t samples_average, uint8_t bus_v_conv_time, uint8_t shunt_v_conv_time, uint8_t mode) {
	uint16_t register_value = 0;

	register_value = register_value | (samples_average << 9);
	register_value = register_value | (bus_v_conv_time << 6);
	register_value = register_value | (shunt_v_conv_time << 3);
	register_value = register_value | mode;

	write_register_word(address, 0xD0, register_value);
}