#include <stdint.h>
// ####################################### Serial Config #######################################

#define UART_BAUDRATE 250000    // baudrate
#define ACK_MESSAGE             // define to send ACK

// calculated values
#define BAUD_PRESCALE (((F_CPU / (UART_BAUDRATE * 16UL))) - 1)

// ######################################## Port Config ########################################

// Servo Step Control
#define SERVO_STEP_CONTROL_PORT PORTD
#define SERVO_PULSE_PIN PD6    // needs to be on SERVO_STEP_CONTROL_PORT
#define SERVO_DIR_PIN PD7      // needs to be on SERVO_STEP_CONTROL_PORT

// Servo General Control
#define SERVO_GENERAL_CONTROL_PORT PORTB
#define SERVO_ENABLE_PIN PB5   // needs to be on PORTB

// Set Port Config
#define DDRB_CONFIG DDRB | (1 << SERVO_ENABLE_PIN)                          // all pins on PORTB
#define DDRD_CONFIG DDRD | (1 << SERVO_PULSE_PIN) | (1 << SERVO_DIR_PIN)    // all pins on PORTD
// #define DDRC_CONFIG DDRC | <WHATEVER_PINS>                                // all pins on PORTC

// ###################################### Servo Config #########################################

#define SERVO_RPM (float) 3000                  // servo nominal rpm
#define SERVO_SPR (float) 10000                 // servo steps per rotation
#define SERVO_GEAR_RATIO (float) 3              // servo gear ratio - set in the servo driver
#define ACTUATOR_MAX_LENGTH (float) 696         // fully extended length in mm
#define SCREW_LEAD (uint8_t) 10                 // screw lead in mm (lead = (pitch / number of screws))
#define INPUT_RESOLUTION  (uint8_t) 10          // input resolution in bits (max 16)

// calculated values
typedef uint8_t factor_t;                       // type of factor (float is more precise but slower) !!! mus be less then 255 !!!
#define STEP_FACTOR (factor_t) (( (SERVO_SPR / SERVO_GEAR_RATIO) * (ACTUATOR_MAX_LENGTH / SCREW_LEAD) ) / (1 << INPUT_RESOLUTION))
#define SERVO_PULSE_PERIOD (uint8_t) (F_CPU / ( (SERVO_RPM / 60) * (SERVO_SPR / SERVO_GEAR_RATIO) ))
