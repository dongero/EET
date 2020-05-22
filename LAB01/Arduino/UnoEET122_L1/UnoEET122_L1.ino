

// Schoelen
// PCC
// EET122, Spring  2020 Remote

// you can display DAC data either in the:
//    Serial Monitor  (Tools -> Serial Monitor) 
//    OR
//    Serial Plotter (Tools -> Serial Plotter)

// the interupt timer is set to go off at 1ms intervals
// We want to run some of our processes at differnt rates
// so we definr those rates here. 
#define BLINK_RATE 500      // 500ms on and 500ms off for a 1 sec blink rate
#define MY_CLOCK_RATE 500  // 500ms HIGH, 500ms LOW for a 1Hz clock
#define ADC_RATE 10       // 10ms get new adc value. This will refresh new values fast enough

// The clock to drive our progects will be 
// sourced on Port 8 (Which is pin23 on the Arduino board)
#define MY_CLOCK_PORT 8
#define MY_ADC_INPUT_CH1 A0
#define MY_ADC_INPUT_CH2 A5



// declare and intilize to zero our global variable
int blink_counter = 0;
int adc_counter = 0;
int clock_counter = 0;
int led_state = 0;
int clock_state = 0;
int adc_take_reading = 0;

uint8_t local_count;


void setup() {
  // put your setup code here, to run once:

  pinMode(LED_BUILTIN, OUTPUT);   // set the pin that drives the onboard LED to an output
  pinMode(A1, INPUT);             // this is out ADC input to measure voltage set's the A1 port of the micro controller to be an input
  pinMode(MY_CLOCK_PORT, OUTPUT); // this will be our TTL clock (ARB) to our circuit if we want a free running clock
  Serial.begin(9600);             // this sets the communcation rate from the Ardiuno board back to the console display

// the folowing code sets up a timer to go off every 1ms
// we use this to time events like read the ADC and toggle our TTL clock
// don't worry about this code, second year EET stuff. 
noInterrupts();           // disable all interrupts
//set timer1 interrupt at 10Hz
  TCCR1A = 0;// set entire TCCR1A register to 0
  TCCR1B = 0;// same for TCCR1B
  TCNT1  = 0;//initialize counter value to 0
  // set compare match register for 1hz increments
  OCR1A = 16; // = (16*10^6) / (10*1024) - 1 (must be <65536)
  // turn on CTC mode
  TCCR1B |= (1 << WGM12);
  // Set CS12 and CS10 bits for 1024 prescaler
  TCCR1B |= (1 << CS12) | (1 << CS10);  
  // enable timer compare interrupt
  TIMSK1 |= (1 << OCIE1A);
  interrupts();             // enable all interrupts
 }


ISR(TIMER1_COMPA_vect){
  if(blink_counter < BLINK_RATE) {
    blink_counter ++;   // if we have not reached the count level yet, increment and skip led toggle
  }
  else {
    blink_counter = 0;
        if (led_state == HIGH){
          digitalWrite(LED_BUILTIN, LOW);   // turn the LED on (HIGH is the voltage level)
          led_state = LOW;
        }
        else{
          digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
          led_state = HIGH;
       }
  }


  if(clock_counter < MY_CLOCK_RATE) {
    clock_counter ++;   // if we have not reached the count level yet, increment and skip clock toggle
  }
  else {
    clock_counter = 0;
    if (clock_state == HIGH){
      digitalWrite(8, LOW);   // set CLOCK HIGH
      clock_state = LOW;
     }
     else{
      digitalWrite(8, HIGH);   // set CLOCK LOW
      clock_state = HIGH;
     }
  }


 if(adc_counter < ADC_RATE) {
    adc_counter ++;   // if we have not reached the count level yet, increment and skip clock toggle
  }
  else {
    adc_counter = 0;
    adc_take_reading = HIGH;
  }

}


void loop() {
  // put your main code here, to run repeatedly:

    // what is a uint16_t variable?
  // A uint16_t is:
  //    u: unsigned (no sign bit, remenber from EET121 these are signed and unsigned formates for representing numbers)
  //    int: an integer that is stored as 16-bits. Integer means that it can only store integers: 1,2,3 etc, no fractional part like 3.3
  //    16: is 16-bits in size. Since there is no sign bit the valies that fit in the variable are 0 to (2^16 -1) (0 to 65535)
  //    _t: means type (don't worry bout this) 
  //
  // likewise what is a uint8_t ?
  // same as a uint16_t but only 8-bits. So a uint8_t can have values of: 0 to 2^8 - 1 (0 - 255)
  // 
  // The analog to digital converter on the micro controller is 10-bits in resolution, that's more than eight and less than sixteen. 
  // Therefore we need to use a unit16_t to store the value read from the Analog to Digial converter.  
  // Also note that we are using unsigned. We use unsigned becase the ADC on the microcontroller can only convert positive voltages
  // so we can never get a negative number from it. 
   
  
uint16_t my_adc_reading;         // a variable that we will use to store the value read from the analof-to-digial converter
uint16_t my_measured_voltage;    // calculated voltage on the pin based on the ADC reading
uint16_t my_measured_voltage_mv;   // calculated voltage on the pin based on the ADC reading
 
  
  if( adc_take_reading == HIGH) {
    adc_take_reading = LOW;
    my_adc_reading = analogRead(MY_ADC_INPUT_CH1); //Reads the analog value on pin A5 into my_adc_reading
  // the values from the ADC can be 0 to 1023 (10-bit converter 2^10 = 1024 values (0 to 1023) )
  // the min valie 0 represents 0 Volts on the pin
  // the max value 1023 represents +5 Volts on the pin 
  // so the 0V to 5V span is broken down into 1023 slices of reloution
  // Measure voltage on the pin = (ADC Reading / 1023) * 5 volts
  
// Serial.print("Analog value: "); // we don't really need the raw ADC value displayed, but it's here if you want to uncomment the code
// Serial.println(my_adc_reading);
my_measured_voltage = ((my_adc_reading * 50) /102); // the math was done this way to improve resolution. 
// 500 == 5V, 450 == 4.5V, etc. 

// This is for the serial terminal Voltage display (kinda like cheap Voltage Meater)
Serial.print(my_measured_voltage / 100); // this displays the integer volts
Serial.print(".");
Serial.print(my_measured_voltage % 100);  // this displays the fractional volts
Serial.print(" V");


// the following adds a little wiggle to the display so that if the measured voltage is not changing
// there is still some visabiliaty the measrments are sill occuring. 
if(local_count == 1) {
  local_count = 0;
  Serial.print(" ");
  Serial.print(" | ");
}
else {
  local_count = 1;
  Serial.print(" ");
  Serial.print(" / ");
}
 Serial.println(" "); // send a new line 


  }
}
  
