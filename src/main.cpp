#include <stdint.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#define ACK_MESSAGE true

#define SERVO_PULSE_PERIOD 96U

#define UART_BAUDRATE 250000
#define BAUD_PRESCALE (((F_CPU / (UART_BAUDRATE * 16UL))) - 1)

volatile __uint24 currentStepPosition = 0; // __uint24
volatile __uint24 targetStepPosition = 0; // __uint24


int main (void) {
    DDRB |= (1 << PB7);
    DDRD |= (1 << PD6) | (1 << PD7);

    PORTB = PORTB & (1 << PB5);

    cli();
    TCCR2A = (1 << WGM21);
    TCCR2B = (1 << CS20);
    TCNT2 = 0;
    OCR2A = SERVO_PULSE_PERIOD - 1; // 149 is possible
    OCR2B = (SERVO_PULSE_PERIOD / 2) - 1; // 
    TIMSK2 |= (1 << OCIE2A) | (1 << OCIE2B);
    sei();

    UBRR0L = BAUD_PRESCALE;
    UBRR0H = BAUD_PRESCALE >> 8;
    UCSR0B = (1 << TXEN0) | (1 << RXEN0);

    while (!(UCSR0A & (1 << UDRE0)));
    UDR0 = 'C';
    // while (!(UCSR0A & (1 << UDRE0)));

    // option 1: =((10000/3)*(696/10))/2^10
    const float factor = 226.5625; 

    // option 2: =((10000/3)*696)/2^8

    // volatile bool firstByteRead = false;
    uint8_t firstByte = 0;

    while (true) {
        if (UCSR0A & (1 << RXC0)) { // uart0_AvailableBytes()
            if (firstByte) {
                targetStepPosition = ((uint16_t) (firstByte << 8) | UDR0) * factor;
                // firstByteRead = false;
                firstByte = 0;
                #if ACK_MESSAGE
                    // uart_putc_noblock('R');
                    while (!(UCSR0A & (1 << UDRE0)));
                    UDR0 = 'R';
                    // while (!(UCSR0A & (1 << UDRE0)));
                #endif
            } else {
                firstByte = UDR0;
                // firstByteRead = true;
            }
        }
    }
}

ISR(TIMER2_COMPA_vect) {
    asm volatile (
        "cbi %[portd], 6"
        :
        : [portd] "I" (_SFR_IO_ADDR(PORTD))
    );
}

ISR(TIMER2_COMPB_vect) {

    asm volatile (
        "cp %A[currentStepPosition], %A[targetStepPosition]\n\t"
        "cpc %B[currentStepPosition], %B[targetStepPosition]\n\t"
        "cpc %C[currentStepPosition], %C[targetStepPosition]\n\t"
        "breq end\n\t"
        "brlo up\n\t"

        "sbi %[portd], 7\n\t"
        "sbi %[portd], 6\n\t"
        "sbiw %[currentStepPosition], 1\n\t"
        "sbc %C[currentStepPosition], __zero_reg__\n\t"
        "rjmp end\n\t"
        
        "up:\n\t"
            "cbi %[portd], 7\n\t"
            "sbi %[portd], 6\n\t"
            "adiw %[currentStepPosition], 1\n\t"
            "adc %C[currentStepPosition], __zero_reg__\n\t"
        
        "end:\n\t"
        : [currentStepPosition] "+r" (currentStepPosition)
        : [portd] "I" (_SFR_IO_ADDR(PORTD)), [targetStepPosition] "r" (targetStepPosition)
    );

    /* asm volatile (
        "cp %A[currentStepPosition], %A[targetStepPosition]\n\t"
        "cpc %B[currentStepPosition], %B[targetStepPosition]\n\t"
        "breq end\n\t"
        "brlo up\n\t"

        "sbi %[portd], 7\n\t"
        "sbi %[portd], 6\n\t"
        "sbiw %[currentStepPosition], 1\n\t"
        "rjmp end\n\t"
        
        "up:\n\t"
            "cbi %[portd], 7\n\t"
            "sbi %[portd], 6\n\t"
            "adiw %[currentStepPosition], 1\n\t"
        
        "end:\n\t"
        : [currentStepPosition] "+w" (currentStepPosition)
        : [portd] "I" (_SFR_IO_ADDR(PORTD)), [targetStepPosition] "w" (targetStepPosition)
    ); */
    
    /* if (targetStepPosition > currentStepPosition) {
        asm volatile(
            "cbi %[portd], 7\n\t"
            "sbi %[portd], 6\n\t"
            "adiw %[currentStepPosition], 1"
            : [currentStepPosition] "+r" (currentStepPosition)
            : [portd] "I" (_SFR_IO_ADDR(PORTD))
        );
    } else if (targetStepPosition < currentStepPosition) {
        asm volatile(
            "sbi %[portd], 7\n\t"
            "sbi %[portd], 6\n\t"
            "sbiw %[currentStepPosition], 1"
            : [currentStepPosition] "+r" (currentStepPosition)
            : [portd] "I" (_SFR_IO_ADDR(PORTD))
        );
    } */

    /* if (targetStepPosition > currentStepPosition) {
        currentStepPosition++;
        asm volatile(
            "cbi %[portd], 7\n\t"
            "sbi %[portd], 6"
            : 
            : [portd] "I" (_SFR_IO_ADDR(PORTD))
        );
    } else if (targetStepPosition < currentStepPosition) {
        currentStepPosition--;
        asm volatile(
            "sbi %[portd], 7\n\t"
            "sbi %[portd], 6"
            : 
            : [portd] "I" (_SFR_IO_ADDR(PORTD))
        );
    } */
}