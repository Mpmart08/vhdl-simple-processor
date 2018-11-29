        ORG     0
MAIN:   IN      SWITCHES    ;Read from SWITCHES
        STORE   INDATA      ;Store value in INDATA
LOOP:   OUT     LEDS        ;Write to LEDS
        OUT     SEVENSEG    ;Write to SEVENSEG
        SHIFT   &H01        ;Shift left 1
        STORE   INDATA      ;Store value in INDATA
        SUB     INDATA      ;AC = 0
        OUT     TIMER       ;Reset TIMER
CHECK:  IN      TIMER       ;Read from TIMER
        SUB     TWOSEC      ;TIMER - TWOSEC
        JZERO   LOOP        ;If TIMER == 2s then LOOP
        JPOS    LOOP        ;If TIMER > 2s then LOOP
        JUMP    CHECK       ;Else CHECK again

        ORG     &H030
INDATA: DW      &H0000
TWOSEC: DW      &H0014
        
SWITCHES:   EQU     &H00
LEDS:       EQU     &H01
TIMER:      EQU     &H02
SEVENSEG:   EQU     &H04