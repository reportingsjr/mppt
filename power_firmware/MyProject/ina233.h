float get_voltage(uint8_t address);
float get_current(uint8_t address, float current_lsb);
uint16_t calc_current_calibration(float max_current_expected, float r_shunt);
void set_current_calibration(uint8_t address, uint16_t calibration);
uint8_t get_capability(uint8_t address);
void clear_faults(uint8_t address);