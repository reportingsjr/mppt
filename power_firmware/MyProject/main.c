#include <atmel_start.h>
#include "ina233.h"


int main(void)
{
	/* Initializes MCU, drivers and middleware */
	atmel_start_init();

	pwm_set_parameters(&PWM_0, 160, 80);
	pwm_enable(&PWM_0);

	struct io_descriptor *I2C_0_io;
	i2c_m_sync_get_io_descriptor(&I2C_0, &I2C_0_io);

	i2c_m_sync_enable(&I2C_0);
	i2c_m_sync_set_slaveaddr(&I2C_0, 0x40, I2C_M_SEVEN);
	i2c_m_sync_cmd_write(&I2C_0, 0x03, (uint8_t *)"Test", 4);

	delay_init(SysTick);

	// Wait for 500ms after start up to enable to FET driver to make sure the 5V rail is fully powered up
	delay_ms(500);
	// enable the FET driver
	gpio_set_pin_level(fet_enable, true);

	/* Replace with your application code */
	while (1) {
		i2c_m_sync_set_slaveaddr(&I2C_0, 0x40, I2C_M_SEVEN);
		// clear faults
		i2c_m_sync_cmd_write(&I2C_0, 0x03, 0, 1);
		// retrieve "capability"
		uint8_t buffer;
		i2c_m_sync_cmd_read(&I2C_0, 0x19, &buffer, sizeof(buffer));
		
		volatile float voltage1 = read_voltage(0x40);
		volatile float voltage2 = read_voltage(0x41);
		
		
		delay_ms(1);
		/*gpio_set_pin_level(yellow_led, true);
		gpio_set_pin_level(green_led, true);
		//pwm_set_parameters(&PWM_0, 160, 20);
		delay_ms(1000);
		gpio_set_pin_level(yellow_led, false);
		gpio_set_pin_level(green_led, false);
		//pwm_set_parameters(&PWM_0, 160, 150);
		delay_ms(1000);*/
	}
}

