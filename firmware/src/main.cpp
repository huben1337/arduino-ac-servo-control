#include <stdint.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <config.h>

asm (
    "ldi r28, 0\n\t"
    "ldi r29, 0\n\t"
    "ldi r30, 0\n\t"
);


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

    asm volatile (
        "ldi r31, 82\n\t"                     // 'R'
        "ldi r20, 226\n\t"
        "L1:\n\t"
            "lds r15, %[ucsr0a]\n\t"
            "sbrs r15, 7\n\t"
            "rjmp L1\n\t"                    // while (!(UCSR0A & (1 << RXC0)));
            "lds r19, %[udr0]\n\t"                   // firstByte
        
        "L2:\n\t"
            "lds r15, %[ucsr0a]\n\t"
            "sbrs r15, 7\n\t"
            "rjmp L2\n\t"                    // while (!(UCSR0A & (1 << RXC0)));
            "lds r18, %[udr0]\n\t"
            "clr r24\n\t"
            "mul r18, r20\n\t"
            "mov r22, r0\n\t"
            "mov r23, r1\n\t"
            "mul r19, r20\n\t"
            "add r23, r0\n\t"
            "adc r24, r1\n\t"
            "mov r12, r22\n\t"
            "mov r13, r23\n\t"
            "mov r14, r24\n\t"

        "L3:\n\t"
            "lds r15, %[ucsr0a]\n\t"
            "sbrs r15, 5\n\t"
            "rjmp L3\n\t"                    // while (!(UCSR0A & (1 << UDRE0)));
            "sts %[udr0], r31\n\t"
            "rjmp L1\n\t"
        :
        : [ucsr0a] "i" (_SFR_ADDR(UCSR0A)), [udr0] "i" (_SFR_ADDR(UDR0)), [step_factor] "i" (STEP_FACTOR)
    );
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
        "cp r28, r12\n\t"
        "cpc r29, r13\n\t"
        "cpc r30, r14\n\t"
        "breq end\n\t"
        "brlo up\n\t"
        
        "sbi %[port], %[servor_dir_pin]\n\t"
        "sbi %[port], %[servo_pulse_pin]\n\t"
        "sbiw r28, 1\n\t"
        "sbc r30, __zero_reg__\n\t"
        "rjmp end\n\t"
        
        "up:\n\t"
            "cbi %[port], %[servor_dir_pin]\n\t"
            "sbi %[port], %[servo_pulse_pin]\n\t"
            "adiw r28, 1\n\t"
            "adc r30, __zero_reg__\n\t"
                
        "end:\n\t"
        : 
        : [port] "I" (_SFR_IO_ADDR(SERVO_STEP_CONTROL_PORT)), [servo_pulse_pin] "I" (SERVO_PULSE_PIN), [servor_dir_pin] "I" (SERVO_DIR_PIN)
    );


}