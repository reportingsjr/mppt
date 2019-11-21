float get_voltage(uint8_t address);
float get_current(uint8_t address, float current_lsb);
uint16_t calc_current_calibration(float max_current_expected, float r_shunt);
void set_current_calibration(uint8_t address, uint16_t calibration);
uint8_t get_capability(uint8_t address);
void clear_faults(uint8_t address);
void write_register_byte(uint8_t address, uint8_t register_address, uint8_t data);
void write_register_word(uint8_t address, uint8_t register_address, uint16_t data);
int16_t convert_signed_2s_complement(uint8_t msb, uint8_t lsb);

// number of ADC samples that are averaged together
#define ADC_AVG_1    0b001
#define ADC_AVG_4    0b010
#define ADC_AVG_16   0b011
#define ADC_AVG_128  0b100
#define ADC_AVG_256  0b101
#define ADC_AVG_512  0b110
#define ADC_AVG_1024 0b111

// bus voltage conversion time
#define ADC_BUS_V_TIME_140us  0b000
#define ADC_BUS_V_TIME_204us  0b001
#define ADC_BUS_V_TIME_332us  0b010
#define ADC_BUS_V_TIME_588us  0b011
#define ADC_BUS_V_TIME_1100us 0b100
#define ADC_BUS_V_TIME_2116us 0b101
#define ADC_BUS_V_TIME_4156us 0b110
#define ADC_BUS_V_TIME_8244us 0b111

// shunt voltage conversion time
#define ADC_SHNT_V_TIME_140us  0b000
#define ADC_SHNT_V_TIME_204us  0b001
#define ADC_SHNT_V_TIME_332us  0b010
#define ADC_SHNT_V_TIME_588us  0b011
#define ADC_SHNT_V_TIME_1100us 0b100
#define ADC_SHNT_V_TIME_2116us 0b101
#define ADC_SHNT_V_TIME_4156us 0b110
#define ADC_SHNT_V_TIME_8244us 0b111

// different modes
#define ADC_MODE_SHTDWN               0b000
#define ADC_MODE_TRIG_SHUNT_V         0b001
#define ADC_MODE_TRIG_BUS_V           0b010
#define ADC_MODE_TRIG_SHUNT_AND_BUS_V 0b011
#define ADC_MODE_ALSO_SHTDWN          0b100
#define ADC_MODE_CONT_SHUNT_V         0b101
#define ADC_MODE_CONT_BUS_V           0b110
#define ADC_MODE_CONT_SHUNT_AND_BUS_V 0b111
void set_adc_config(uint8_t address, uint8_t samples_average, uint8_t bus_v_conv_time, uint8_t shunt_v_conv_time, uint8_t mode);