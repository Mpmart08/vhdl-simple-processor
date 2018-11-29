        ORG     0
MAIN:   CALL    CALC    ;Call subroutine CALC
        JUMP    MAIN

        ORG     &H010
CALC:   LOAD    A       ;Load value stored in A
        AND     B       ;A and B
        XOR     C       ;(A and B) xor C
        STORE   D       ;D = (A and B) xor C
        RETURN          ;Return to caller

        ORG     &H030
A:      DW      &H00FF
B:      DW      &HA5A5
C:      DW      &H3300
D:      DW      &H0000