float get_voltage(uint8_t address);
float get_current(uint8_t address, float current_lsb);
uint16_t calc_current_calibration(float max_current_expected, float r_shunt);
void set_current_calibration(uint8_t address, uint16_t calibration);
uint8_t get_capability(uint8_t address);
void clear_faults(uint8_t address);
void write_register_byte(uint8_t address, uint8_t register_address, uint8_t data);
void write_register_word(uint8_t address, uint8_t register_address, uint16_t data);
int16_t convert_signed_2s_complement(uint8_t msb, uint8_t lsb);