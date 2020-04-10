// Jon Neal 2019
// Code available under MIT license

#include <atmel_start.h>
#include "ina233.h"


int main(void)
{
	/* Initializes MCU, drivers and middleware */
	atmel_start_init();

	//pwm_set_parameters(&PWM_0, 10, 80);
	//pwm_enable(&PWM_0);

	i2c_m_sync_enable(&I2C_0);

	delay_init(SysTick);

	gpio_set_pin_level(yellow_led, true);
	gpio_set_pin_level(green_led, false);

	// TODO: When Nick completes the UI part uncomment this and fill in correct I2C address
	// uint8_t ui_address = 0x42;

	// Wait for 100ms after start up to enable to FET driver to make sure the 5V rail is fully powered up
	delay_ms(100);
	// enable the FET driver
	//gpio_set_pin_level(fet_enable, true);

	// 3.2768A gives a resolution of 100uA per bit
	// current_lsb = 0.0001
	uint16_t current_calibration = calc_current_calibration(3.2768, 0.01);
	set_current_calibration(0x40, current_calibration);
	set_current_calibration(0x41, current_calibration);

	// P&O algorithm variables
	float previous_power = 0;
	bool increase_output_resistance = false; // start algorithm by decreasing output resistance
	float current_power = 0;
	uint8_t pwm_value = 10;

	while (1) {
		// Read the current and voltage of the solar panel and multiply to get power 
		/*float current = get_current(0x40, 0.0001);
		float voltage = get_voltage(0x40);
		current_power = current*voltage;

		if(current_power-previous_power > 0) {
			// measured power is greater than the previous, continue moving in same direction
			if(increase_output_resistance) {
				// moving to make the output resistance higher which means outputting
				// a lower voltage from the buck converter

				// first check if the current PWM value is greater than zero so we don't underflow
				if(pwm_value > 0) {
					pwm_value -= 1;
				}
			} else {
				// make the output resistance lower
				// which means outputting a higher voltage from the buck

				// Check to make sure we aren't already at the max PWM value
				if(pwm_value < 160) {
					pwm_value += 1;
				}
			}
		} else  {
			// the measured power is less than it previously was, move in the opposite direction
			increase_output_resistance = !increase_output_resistance;

			// now the the direction is flipped we can do the same thing we did in the above section
			if(increase_output_resistance) {
				// moving to make the output resistance higher which means outputting
				// a lower voltage from the buck converter

				// first check if the current PWM value is greater than zero so we don't underflow
				if(pwm_value > 0) {
					pwm_value -= 1;
				}
			} else {
				// make the output resistance lower
				// which means outputting a higher voltage from the buck

				// Check to make sure we aren't already at the max PWM value
				if(pwm_value < 160) {
					pwm_value += 1;
				}
			}
		}
		
		// update buck converter PWM now that the value has changed
		pwm_set_parameters(&PWM_0, 160, pwm_value);

		previous_power = current_power;

		// TODO: When Nick completes the UI part uncomment this to send data over via I2C
		//i2c_m_sync_set_slaveaddr(&I2C_0, ui_address, I2C_M_SEVEN);
		//io_write(I2C_0_io, (uint8_t *)current_power), 1;
		*/
		gpio_toggle_pin_level(yellow_led);
		gpio_toggle_pin_level(green_led);
		// Add a small delay to limit possible oscillations and let things settle
		delay_ms(2000);
	}
}

