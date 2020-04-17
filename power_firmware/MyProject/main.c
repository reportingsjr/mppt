// Jon Neal 2019
// Code available under MIT license

#include <atmel_start.h>
#include "ina233.h"
#include "ssd1306_oled.h"

extern const unsigned char arial_8ptBitmaps[];
extern const unsigned char charMap[96];
extern const unsigned int arial_8ptDescriptors[96][3];

extern const unsigned char courierNew_16ptBitmaps[];
extern const unsigned int courierNew_16ptDescriptors[96][3];

extern const unsigned char freestyleScript_22ptBitmaps[];
extern const unsigned int freestyleScript_22ptDescriptors[96][3];

extern const unsigned char kristenITC_14ptBitmaps[];
extern const unsigned int kristenITC_14ptDescriptors[96][3];

int main(void)
{
	/* Initializes MCU, drivers and middleware */
	atmel_start_init();

	i2c_m_sync_set_baudrate(&I2C_0, 0, 8000000);
	i2c_m_sync_enable(&I2C_0);
	delay_init(SysTick);


	gpio_set_pin_level(yellow_led, true);
	gpio_set_pin_level(green_led, false);

	// Wait for 100ms after start up to let things settle
	delay_ms(100);

	init_oled();
	oled_setFont(arial_8ptBitmaps, arial_8ptDescriptors,96, charMap, 5);

	// enable SMPS
	gpio_set_pin_level(fet_enable, true);

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

	uint8_t x = 0;
	uint8_t y = 0;

	while (1) {
		oled_clear();
		// Read the current and voltage of the solar panel and multiply to get power 
		float input_current = get_current(0x40, 0.0001);
		float input_voltage = get_voltage(0x40);
		current_power = input_current*input_voltage;
		oled_printf(48,3, "Input");
		oled_printf(0,16, "Voltage %dmV", (int) (input_voltage*1000));
		oled_printf(0,32, "Current %dmA", (int) (input_current*1000));
		oled_printf(0,48, "Power   %dmW", (int) (current_power*1000));
		oled_update();
		delay_ms(3000);

		oled_clear();
		// Read the current and voltage of the solar panel and multiply to get power 
		float output_current = get_current(0x41, 0.0001);
		float output_voltage = get_voltage(0x41);
		current_power = output_current*output_voltage;
		oled_printf(42,3, "Output");
		oled_printf(0,16, "Voltage %dmV", (int) (output_voltage*1000));
		oled_printf(0,32, "Current %dmA", (int) (output_current*1000));
		oled_printf(0,48, "Power   %dmW", (int) (current_power*1000));
		oled_update();
		delay_ms(3000);
		/*
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

		previous_power = current_power;

		*/

		gpio_toggle_pin_level(yellow_led);
		gpio_toggle_pin_level(green_led);
	}
}