

// Schoelen
// PCC
// EET122, Spring  2020 Remote

// Digital Lock Sketch! 
// This is OPTIONAL
// This sketch replaces:
// 1. DIP switch
// 2. The three inverters that create the inverted version of A,B, and C.  
// 3. The SR latch that makes the clock.
// Use the Serial Monitor to send the combination, one code at a time (legal values are 0 through7)
// **** BESURE that Serial Monitor is set to "No line ending" at the dropdown on the bottom of the Serial Monitor **** 
// Pin definintions: 
#define A 2
#define B 3
#define C 4
#define A_BAR 5
#define B_BAR 6
#define C_BAR 7
#define MY_CLOCK_PORT 8

#define BLINK_RATE 100      // 500ms on and 500ms off for a 1 sec blink rate

// The clock to drive our progects will be 
// sourced on Port 8 (Which is pin23 on the Arduino board)
#define MY_CLOCK_PORT 8

void GetComm(void);


// declare and intilize to zero our global variables
int blink_counter = 0;
int led_state = 0;

uint8_t local_count;


uint8_t incomingByte = 0; // for incoming serial data
uint8_t formatted_bits = 0; // the serial byte formated into A, A_BAR,  B, B_BAR, C, C_BAR
 

void setup() {



 
  pinMode(LED_BUILTIN, OUTPUT);   // set the pin that drives the onboard LED to an output

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
}


void loop() {
CheckForSerialIn();
}


void CheckForSerialIn(void) {
//1. read incomming serail Byte
//2. convert the ascii byte value to A, A_BAR, B, B_BAR, C, C_BAR 
//3. output those six bits to pins
//4. stobe the clock once

  if (Serial.available() > 0) {
    // read the incoming byte:
    incomingByte = Serial.read();
    
    // Serial.println(incomingByte, HEX);
    formatted_bits = ConvertByte(incomingByte); 
    // Serial.println(formatted_bits, HEX);
    SendBitsToPort(formatted_bits);
    ClockOnce();
  }
}


void ClockOnce(void) {
  digitalWrite(8, LOW);   // set CLOCK LOW (make sure it's low when you come into this routine)
  delay(300);
  digitalWrite(8, HIGH);  // Set hight to get teh rising edge signa. 
  delay(300);            // the delay is here to make this human speed, you can put an LED on teh clock line and see it. 
  digitalWrite(8, LOW);   // return clock low. 
}

void SendBitsToPort(uint8_t mybits) {
pinMode(A, OUTPUT);
pinMode(B, OUTPUT);
pinMode(C, OUTPUT);
pinMode(A_BAR, OUTPUT);
pinMode(B_BAR, OUTPUT);
pinMode(C_BAR, OUTPUT);


// the arduino likes to write one bit at a time to ports
// so we will spool out the six bits that make up the each 
// bit of the lock combination 
//
int i;

// start at port bit 2 upto and including port bit 7
  for(i=2 ; i<=4; i++) {
    digitalWrite(i, (mybits & 0x01) );
    mybits = mybits >> 1; // shift to get the next bit   
  }

  mybits =  mybits >> 1; // shift past the dud bit backed into the byte.

  for(i=5 ; i<=7; i++) {
    digitalWrite(i, (mybits & 0x01));
    mybits = mybits >> 1; // shift to get the next bit   
  }
}


uint8_t ConvertByte(uint8_t my_byte) {

// Convert the ascii charachter value into A, A_BAR, B, B_BAR, C, C_BAR   
// use lower nibble for the TRUEs (A,B, C)
// use upper nible for the complements (BARs)
// 0 = A   least significant bit
// 1 = B
// 2 = C
// 3 = notused
// 4 = A_BAR
// 5 = B_BAR
// 6 = C_BAR
// 7 = not used

// with three bits we can have values from 000b to 111b
// So the locak combination to open it must be numbers between 0 and 7


uint8_t my_bits; 


switch (incomingByte) {
  case 0x30:    //ascii code for 0
      my_bits = 0x70;       //0111_0000b
  break;
  case 0x31:    //ascii code for 1
      my_bits = 0x61;      //0110_0001b
  break;
  case 0x32:    //ascii code for 2
      my_bits = 0x52;       //0101_0010b
  break;
  case 0x33:    //ascii code for 3
      my_bits = 0x43;      //0100_0011b
  break;
  case 0x34:    //ascii code for 4
      my_bits = 0x34;      //0011_0100b
  break;
  case 0x35:    //ascii code for 5
      my_bits = 0x25;     //0010_0101b
  break;
  case 0x36:    //ascii code for 6
      my_bits = 0x16;     //0001_0110b
  break;
  case 0x37:    //ascii code for 7
      my_bits = 0x07;    //0000_0111b
  break;
  
  default:
        my_bits = 0x00; 
  break;
}


return(my_bits);

}
