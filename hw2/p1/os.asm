.ORIG x0100

TRAP xFF
LDI R3, STATE_1 
ADD R4, R3, #-1
BRz JUMP_1T
BRnp RSET_JUMP_2

JUMP_1T:
    ; set MR_SM to 0 before jump to another process
    LD R2, ZERO
    STI R2, MR_SM
    ; reset process-1 value to 2
    ; dump and jump to process-1
    LD R2, TWO
    STI R2, STATE_1
    LD R5, PROC1_ADDR
    TRAP xFF
    JMP R5

RSET_JUMP_2:
    LD R2, ZERO
    STI R2, STATE_1
    LDI R3, STATE_2 
    ADD R4, R3, #-1
    BRz JUMP_2T
    BRnp RSET_JUMP_3


JUMP_2T:
    ; set MR_SM to 0 before jump to another process
    LD R2, ZERO
    STI R2, MR_SM
    ; reset process-2 value to 2
    ; dump and jump to process-2
    LD R2, TWO
    STI R2, STATE_2
    LD R5, PROC2_ADDR
    TRAP xFF
    JMP R5

RSET_JUMP_3:
    LD R2, ZERO
    STI R2, STATE_2
    LDI R3, STATE_3
    ADD R4, R3, #-1
    BRz JUMP_3T
    BRnp RSET_JUMP_4

JUMP_3T:
    ; set MR_SM to 0 before jump to another process
    LD R2, ZERO
    STI R2, MR_SM
    ; reset process-3 value to 2
    ; dump and jump to process-3
    LD R2, TWO
    STI R2, STATE_3
    LD R5, PROC3_ADDR
    TRAP xFF
    JMP R5
    
RSET_JUMP_4:
    LD R2, ZERO
    STI R2, STATE_3
    LDI R3, STATE_4 
    ADD R4, R3, #-1
    BRz JUMP_4T
    BRnp RSET_JUMP_5

JUMP_4T:
    ; set MR_SM to 0 before jump to another process
    LD R2, ZERO
    STI R2, MR_SM
    ; reset process-4 value to 2
    ; dump and jump to process-4
    LD R2, TWO
    STI R2, STATE_4
    LD R5, PROC4_ADDR
    TRAP xFF
    JMP R5

RSET_JUMP_5:
    LD R2, ZERO
    STI R2, STATE_4
    LDI R3, STATE_5 
    ADD R4, R3, #-1
    BRz JUMP_5T
    BRp RSET5
    BR INF_LOOP

JUMP_5T:
    ; set MR_SM to 0 before jump to another process
    LD R2, ZERO
    STI R2, MR_SM
    ; reset process-5 value to 2
    ; dump and jump to process-5
    LD R2, TWO
    STI R2, STATE_5
    LD R5, PROC5_ADDR
    TRAP xFF
    JMP R5

RSET5:
    LD R2, ZERO
    STI R2, STATE_5
    TRAP x25

INF_LOOP:
    BR INF_LOOP

TWO  .FILL 2
ZERO .FILL 0

MR_SM .FILL xFE04

STATE_1 .FILL x0200
STATE_2 .FILL x0201
STATE_3 .FILL x0202
STATE_4 .FILL x0203
STATE_5 .FILL x0204

PROC1_ADDR .FILL x04000
PROC2_ADDR .FILL x05000
PROC3_ADDR .FILL x06000
PROC4_ADDR .FILL x07000
PROC5_ADDR .FILL x08000

.END
