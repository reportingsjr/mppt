/*
 * Code generated from Atmel Start.
 *
 * This file will be overwritten when reconfiguring your Atmel Start project.
 * Please copy examples or other code you want to keep to a separate file
 * to avoid losing it when reconfiguring.
 */

#include "driver_init.h"
#include <peripheral_clk_config.h>
#include <utils.h>
#include <hal_init.h>
#include <hpl_gclk_base.h>
#include <hpl_pm_base.h>

struct i2c_m_sync_desc I2C_0;

struct pwm_descriptor PWM_0;

void I2C_0_PORT_init(void)
{

	gpio_set_pin_pull_mode(PA08,
	                       // <y> Pull configuration
	                       // <id> pad_pull_config
	                       // <GPIO_PULL_OFF"> Off
	                       // <GPIO_PULL_UP"> Pull-up
	                       // <GPIO_PULL_DOWN"> Pull-down
	                       GPIO_PULL_OFF);

	gpio_set_pin_function(PA08, PINMUX_PA08D_SERCOM2_PAD0);

	gpio_set_pin_pull_mode(PA09,
	                       // <y> Pull configuration
	                       // <id> pad_pull_config
	                       // <GPIO_PULL_OFF"> Off
	                       // <GPIO_PULL_UP"> Pull-up
	                       // <GPIO_PULL_DOWN"> Pull-down
	                       GPIO_PULL_OFF);

	gpio_set_pin_function(PA09, PINMUX_PA09D_SERCOM2_PAD1);
}

void I2C_0_CLOCK_init(void)
{
	_pm_enable_bus_clock(PM_BUS_APBC, SERCOM2);
	_gclk_enable_channel(SERCOM2_GCLK_ID_CORE, CONF_GCLK_SERCOM2_CORE_SRC);
	_gclk_enable_channel(SERCOM2_GCLK_ID_SLOW, CONF_GCLK_SERCOM2_SLOW_SRC);
}

void I2C_0_init(void)
{
	I2C_0_CLOCK_init();
	i2c_m_sync_init(&I2C_0, SERCOM2);
	I2C_0_PORT_init();
}

void PWM_0_PORT_init(void)
{

	gpio_set_pin_function(PA10, PINMUX_PA10E_TCC1_WO0);
}

void PWM_0_CLOCK_init(void)
{
	_pm_enable_bus_clock(PM_BUS_APBC, TCC1);
	_gclk_enable_channel(TCC1_GCLK_ID, CONF_GCLK_TCC1_SRC);
}

void PWM_0_init(void)
{
	PWM_0_CLOCK_init();
	PWM_0_PORT_init();
	pwm_init(&PWM_0, TCC1, _tcc_get_pwm());
}

void system_init(void)
{
	init_mcu();

	// GPIO on PA00

	gpio_set_pin_level(GreenLED,
	                   // <y> Initial level
	                   // <id> pad_initial_level
	                   // <false"> Low
	                   // <true"> High
	                   false);

	// Set pin direction to output
	gpio_set_pin_direction(GreenLED, GPIO_DIRECTION_OUT);

	gpio_set_pin_function(GreenLED, GPIO_PIN_FUNCTION_OFF);

	// GPIO on PA01

	gpio_set_pin_level(YellowLED,
	                   // <y> Initial level
	                   // <id> pad_initial_level
	                   // <false"> Low
	                   // <true"> High
	                   false);

	// Set pin direction to output
	gpio_set_pin_direction(YellowLED, GPIO_DIRECTION_OUT);

	gpio_set_pin_function(YellowLED, GPIO_PIN_FUNCTION_OFF);

	gpio_set_pin_level(PA10, false);
	gpio_set_pin_direction(PA10, GPIO_DIRECTION_OUT);
	gpio_set_pin_function(PA10, GPIO_PIN_FUNCTION_OFF);

	gpio_set_pin_level(GPIO(GPIO_PORTA, 11), false);
	gpio_set_pin_direction(GPIO(GPIO_PORTA, 11), GPIO_DIRECTION_OUT);
	gpio_set_pin_function(GPIO(GPIO_PORTA, 11), GPIO_PIN_FUNCTION_OFF);

	//PWM_0_init();

	I2C_0_init();
}
