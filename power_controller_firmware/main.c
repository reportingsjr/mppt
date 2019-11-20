#include <atmel_start.h>

int main(void)
{
	/* Initializes MCU, drivers and middleware */
	atmel_start_init();

	delay_init(SysTick);

	//pwm_set_parameters(&PWM_0, 10000, 5000);
	//pwm_enable(&PWM_0);

	/* Replace with your application code */
	while (1) {
			gpio_set_pin_level(GreenLED, true);
			gpio_set_pin_level(YellowLED, true);
			gpio_set_pin_level(PA10, true);
			gpio_set_pin_level(GPIO(GPIO_PORTA, 11), true);
			delay_ms(500);
			gpio_set_pin_level(GreenLED, false);
			gpio_set_pin_level(YellowLED, false);
			gpio_set_pin_level(PA10, false);
			gpio_set_pin_level(GPIO(GPIO_PORTA, 11), false);
			delay_ms(500);
	}
}
