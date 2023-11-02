#include <stdint.h>
#include <config.h>
#include <avr/io.h>
#include <avr/interrupt.h>

volatile __uint24 currentStepPosition = 0; // __uint24
volatile __uint24 targetStepPosition = 0; // __uint24


int main (void) {
    #ifdef DDRB_CONFIG
        DDRB = DDRB_CONFIG;
    #endif
    #ifdef DDRD_CONFIG
        DDRD = DDRD_CONFIG;
    #endif
    #ifdef DDRC_CONFIG
        DDRC = DDRC_CONFIG;
    #endif

    SERVO_GENERAL_CONTROL_PORT |= (1 << SERVO_ENABLE_PIN); // Enable Servo

    cli();
    TCCR2A = (1 << WGM21);
    TCCR2B = (1 << CS20);
    TCNT2 = 0;
    OCR2A = SERVO_PULSE_PERIOD - 1;
    OCR2B = (SERVO_PULSE_PERIOD / 2) - 1;
    TIMSK2 |= (1 << OCIE2A) | (1 << OCIE2B);
    sei();

    UBRR0L = BAUD_PRESCALE;
    UBRR0H = BAUD_PRESCALE >> 8;
    UCSR0B = (1 << TXEN0) | (1 << RXEN0);

    while (!(UCSR0A & (1 << UDRE0)));
    UDR0 = 'C';

    while (true) {
        while (!(UCSR0A & (1 << RXC0)));
        uint8_t firstByte = UDR0;
        while (!(UCSR0A & (1 << RXC0)));
        targetStepPosition = (__uint24) ((uint16_t) (firstByte << 8) | UDR0) * STEP_FACTOR;
        #ifdef ACK_MESSAGE
            while (!(UCSR0A & (1 << UDRE0)));
            UDR0 = 'R';
        #endif
    }
}

ISR(TIMER2_COMPA_vect) {
    asm volatile (
        "cbi %[port], %[servo_pulse_pin]\n\t"
        :
        : [port] "I" (_SFR_IO_ADDR(SERVO_STEP_CONTROL_PORT)), [servo_pulse_pin] "I" (SERVO_PULSE_PIN)
    );
}

ISR(TIMER2_COMPB_vect) {

    asm volatile (
        "cp %A[currentStepPosition], %A[targetStepPosition]\n\t"
        "cpc %B[currentStepPosition], %B[targetStepPosition]\n\t"
        "cpc %C[currentStepPosition], %C[targetStepPosition]\n\t"
        "breq end\n\t"
        "brlo up\n\t"

        "sbi %[port], %[servor_dir_pin]\n\t"
        "sbi %[port], %[servo_pulse_pin]\n\t"
        "sbiw %[currentStepPosition], 1\n\t"
        "sbc %C[currentStepPosition], __zero_reg__\n\t"
        "rjmp end\n\t"
        
        "up:\n\t"
            "cbi %[port], %[servor_dir_pin]\n\t"
            "sbi %[port], %[servo_pulse_pin]\n\t"
            "adiw %[currentStepPosition], 1\n\t"
            "adc %C[currentStepPosition], __zero_reg__\n\t"
        
        "end:\n\t"
        : [currentStepPosition] "+r" (currentStepPosition)
        : [port] "I" (_SFR_IO_ADDR(SERVO_STEP_CONTROL_PORT)), [servo_pulse_pin] "I" (SERVO_PULSE_PIN), [servor_dir_pin] "I" (SERVO_DIR_PIN), [targetStepPosition] "r" (targetStepPosition)
    );

}