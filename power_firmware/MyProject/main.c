#include <atmel_start.h>
#include "ina233.h"


int main(void)
{
	/* Initializes MCU, drivers and middleware */
	atmel_start_init();

	pwm_set_parameters(&PWM_0, 160, 80);
	pwm_enable(&PWM_0);

	i2c_m_sync_enable(&I2C_0);

	delay_init(SysTick);

	// Wait for 500ms after start up to enable to FET driver to make sure the 5V rail is fully powered up
	delay_ms(500);
	// enable the FET driver
	gpio_set_pin_level(fet_enable, true);

	// 3.2768A gives a resolution of 100uA per bit
	// current_lsb = 0.0001
	uint16_t current_calibration = calc_current_calibration(3.2768, 0.01);
	set_current_calibration(0x40, current_calibration);
	set_current_calibration(0x41, current_calibration);

	while (1) {
		volatile float current1 = get_current(0x40, 0.0001);
		volatile float current2 = get_current(0x41, 0.0001);

		volatile float voltage1 = get_voltage(0x40);
		volatile float voltage2 = get_voltage(0x41);
		
		
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

