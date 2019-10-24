Embedded systems

Maximum Power Point Tracker

https://www.instructables.com/id/ARDUINO-SOLAR-CHARGE-CONTROLLER-Version-30/
https://microcontrolere.wordpress.com/2016/12/16/mppt-solar-charger/
https://hackaday.io/project/4613-arduino-mppt-solar-charge-controller
https://web.archive.org/web/20130430163911/http://www.timnolan.com/index.php?page=arduino-ppt-solar-charger

Atmel SAMD21
    https://github.com/adafruit/asf4
    https://cdn-shop.adafruit.com/product-files/2772/atmel-42181-sam-d21_datasheet.pdf
    ATSAMD21G18A - 256K flash, 32k ram, 48pin TQFP, $3.20/ea
    ATSAMD21J18 - 256K flash, 32k ram, 64 pin TQFP, $3.40/ea

    https://learn.adafruit.com/how-to-program-samd-bootloaders/overview
    U2F bootloader (probably not useful): https://learn.adafruit.com/adafruit-metro-m4-express-featuring-atsamd51/uf2-bootloader-details

    I2C is through a "SERCOM" Serial Communication Interface https://learn.adafruit.com/using-atsamd21-sercom-to-add-more-spi-i2c-serial-ports
    The G and J version have 6 of these SERCOMs, the E version only has 4

    1.62V – 3.63V operating voltage

    Feather M0 using the SAMD21:
    https://www.adafruit.com/product/2772
    Schematic: https://cdn-learn.adafruit.com/assets/assets/000/028/801/original/adafruit_products_M0SCHEM.png
    Board layout: https://cdn-learn.adafruit.com/assets/assets/000/028/802/original/adafruit_products_m0fab.png
    Github with eagle files: https://github.com/adafruit/Adafruit-Feather-M0-Basic-Proto-PCB

    SMD SWD header: FTSH-105-01-L-DV-007-K
    THT SWD header: FTSH-105-01-L-D-007-K
    pinout: https://test.embeetle.com/#hardware/probe-conn/10pin-cortex-db

    PWM: http://shawnhymel.com/1710/arduino-zero-samd21-raw-pwm-using-cmsis/

    Current requirement:
        CPU running at more or less max at a higher temp is about 7mA absolute worst case
        I2C running in standard mode requires 3mA worst case to output a low
        Other peripherals (FET PWM, etc) are probably under a couple mA.
        Status LEDs? probably a good idea to add two or three. 1mA each
        Total: 7+3+3+3 = 16mA for the micro and LEDs

Status LEDs:
    about 1.8V Vf at 1mA for yellow and green
    3.3V supply
    (3.3V-1.8V)/0.001 = 1.5k


Current/Voltage Monitor:
    INA233
        https://www.ti.com/lit/ds/symlink/ina233.pdf
        I2C
        0-36V common mode input
        2.7V to 5.5V supply (perfect!)
        Can read both shunt voltage (current) as well as bus voltage, so no other ADC or scaling is needed

        10mOhm shunt resistor used

    I2C stuff:
        can run from 10kHz to 400kHz
        100kHz seems like a nice middle ground
        pull up resistors:
            https://www.ti.com/lit/an/slva689/slva689.pdf
            Rmin = (Vcc-Vol)/Iol = (3.3-0.4)/3mA = 1kOhm
            Rmax = tr/(0.8473Cb), tr = 1us, Cb = 400pF
            Rmax = 2950 Ohms
            The faster we want the bus the lower the pull up resistors should be
            1.5k is a pretty good value that I have

        Seems like 1.5k may be a bit too strong of a pull up:
        https://learn.sparkfun.com/tutorials/i2c/i2c-at-the-hardware-level
        Most people go with 4.7k to 10k as a first guess
        It is likely that the Cb value of 400pF is way, way too high for this situation

    Current requirement:
        310uA typical for each
        Let's say 1mA for the two of them

solar panel
    https://github.com/VoltaicEngineering/Solar-Panel-Drawings/blob/master/Voltaic%20Systems%202W%206V%20112x136mm%20DRAWING%20CURRENT%202017%207%2020.pdf
    about 2W max
    Isc = 370mA
    Imp = 340mA
    Voc = 7.7V
    Vmp = 6.5V

Switching transistor:
    https://datasheet.octopart.com/BSS806NEH6327XTSA1-Infineon-datasheet-47941179.pdf
    BSS806NE
    N-Channel fet, good for low side switching, not so good for high side (which is what is needed for a buck converter)
    Can use a fet controller to still use this
    about 40mOhm with 2.5Vgs
    With max current of 370mA from solar panel power dissipation of .37^2 * .04 = 5.5mW dissipation
    
    http://www.vishay.com/docs/63199/si2365eds.pdf
    si2365eds
    P-Channel, ~40mOhm at Vgs = -3.3V
    If we drive this transistor at 50kHz and want transitions 10 times that we need Qg/(1/(50kHz*10))A of current = 21nC/(2us) = 10.5mA https://www.wolframalpha.com/input/?i=21nC%2F%281%2F%2850khz*10%29%29
    Since the solar panel is max ~7V we won't be able to turn this transistor off directly from the microcontroller

Gate drivers (maybe not necessary):
    https://www.digikey.com/products/en/integrated-circuits-ics/pmic-gate-drivers/730?FV=4500405%2C4500481%2C45004f7%2C450016d%2C450151d%2C450023c%2C450023d%2C4500250%2C1e300005%2C1e300007%2Cffe002da&quantity=10&ColumnSort=1000011&page=1&stock=1&pageSize=25
    Definitely necessary as the samd21 output won't be high enough voltage to turn off a P-Channel FET switching 7V

    LTC1157
        Almost perfect for this application (Driver voltage is typically about 8.7V from a 3.3V supply)
        $6!!!!

    LTC1477
        A bit higher drive voltage, but $8/ea!

    Look for gate drivers that are 5V powered.
    There are almost no lower cost options for 3.3V.
    This will require a 5V boost converter from the SMPS/battery, but this is useful for powering the curiosity dev board anyhow.

    PX3519XTMA1
        5V supply
        can drive up to 3nF gate capacitance
        Synchronous buck, so has two NFET drivers with auto deadtime adjustments
        Bootstrap cap can provide gate voltages of up to 9V above high side FET source
        Works with a 3.3V PWM input
        About 2mA max supply current
        $0.93/ea

MPPT Algorithm
Peturb and observe flowchart:
https://microcontrolere.files.wordpress.com/2019/03/po-algorithm.png

Battery
    Charge up to 4.2V
    Using a 3000mAh battery, .5C charge rate is 1.5A, way too high
    Absolute max out from the panel is about 2.2W, 2.2W/4.2V ~ 500mA
    So we need to add current limiting to about 500mA
    If we don't do this the buck converter will enter discontinuous mode due to the inductor fully draining and having negative current. This is not great.

    Battery connector will follow adafruit standards and use a JST PH-2.0 with pin 1 being +V and pin 2 being GND.

Buck converter
    f = 50kHz
    Worst case Vin/Vout values:
    Vin = 7.7V (Voc of 2W solar panel)
    Vout = 2.5V (fully discharged battery)
    Iload = 500mA
    R = Vout/Iload = 5ohms
    D = Vout/Vin = 0.325
    Lmin = (1-D)R/(2f) = 0.675*5/100000 = 33.75uH.

    Best case Vin/Vout:
    Vin = 6V
    Vout = 4.2
    Iload = 500mA
    R = Vout/Iload = 8.4ohms
    D = Vout/Vin = 0.7
    Lmin = (1-D)R/2f = 0.3*8.4/100000 = 25.2uH

    33.75uH > 25.2uH, so use anything greater than 33.75uH
    I have PM3316-151M-RC stocked which is 150uH and good up to 800mA, way more than enough! 540mOhm of series resistance though.

    Capacitor selection:
    Preferably would like to keep voltage ripple below about 20mV
    deltaV/V = 0.02/4.2 = 0.0047 (0.47% ripple)

    C = (1-D)/(8L*(deltaV/V)*f^2) = 0.325/(8*150*10^-6*0.0047*50000^2) 
      = 0.325/(0.0012*0.0047*2500000000)
      = 0.325/(14100)
      = 23uF


    Using a smaller inductor, L = 47uH:
    C = 0.325/(8*47*10^-6*0.0047*50000^2)
      = 0.325/(0.000376*0.0047*2500000000)
      = 0.325/4418
      = 73.5uF

    Ripple due to capacitor ESR:
        33uH lowest inductor value
        Vin = 7.7V worst case
        Vout = 2.5V worst case
        inductor ripple current = Vout(1-D)/(Lf) 
           = 2.5(1-0.325)/(33*10^-6*50000)
           = 2.5*0.675/1.65 
           = 1A
        Vout,ESR = inductor ripple current*ESR = 1*0.022 = 22mV (with a good polymer electrolytic)

    Use 16SVPF270M (270uF, 16V, 0.022Ohm ESR) for bulk capacitance
    Use EMK212ABJ106MG-T (10uF, 16V ceramic) to reduce ESR ripple


3.3V Rail:
    16mA for micro and LEDS
    1mA for the INA233s together
    3mA for I2C drive current

    Total around 20mA max

    LT3080 drives 10uA through a resistor to generate a reference voltage for output
    3.3V = R*10uA => R = 330k

    2.2uF low ESR cap minimum output for LT3080

Curiosity board/PIC16F1619:
    Run as I2C slave mode: https://www.microchip.com/forums/m920858.aspx