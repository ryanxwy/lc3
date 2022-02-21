.ORIG x0100

; first dump
TRAP xFF

;R3 store each process's state
; R4 = R3 - 1 help to determine the running state
; if ready -> jump to process
; if not look for next one 

;JUMP_#T:
    ; reset process-# value to 2
    ; dump and jump to process-#

;RSET_JUMP_#
    ; set current process state as 0
    ; check next process's state

LDI R3, STATE_1 
ADD R4, R3, #-1
BRz JUMP_1T
BRnp RSET_JUMP_2

JUMP_1T:
    ; reset process-1 value to 2
    ; dump and jump to process-1
    LD R2, TWO
    STI R2, STATE_1
    LD R5, PROC1_ADDR

    ; set MR_SM to 0 before jump to another process
    LD R2, ZERO
    STI R2, MR_SM
    ; set MR_MPU to 2 before jump to process-1 0x4000
    LD R2, TWO
    STI R2, MR_MPU

    ; dump 
    TRAP xFF

    ; jump to current prosess
    JMP R5

RSET_JUMP_2:
    ; set current process state as 0
    ; check next process's state
    LD R2, ZERO
    STI R2, STATE_1
    LDI R3, STATE_2 
    ADD R4, R3, #-1
    BRz JUMP_2T
    BRnp RSET_JUMP_3


JUMP_2T:
    ; reset process-2 value to 2
    ; dump and jump to process-2
    LD R2, TWO
    STI R2, STATE_2
    LD R5, PROC2_ADDR
    

    ; set MR_SM to 0 before jump to another process
    LD R2, ZERO
    STI R2, MR_SM
    ; set MR_MPU to 3 before jump to process-2 0x5000
    LD R2, THREE
    STI R2, MR_MPU

    TRAP xFF

    JMP R5

RSET_JUMP_3:
    ; LD R2, ZERO
    ; STI R2, STATE_2
    LDI R3, STATE_3
    ADD R4, R3, #-1
    BRz JUMP_3T
    BRnp RSET_JUMP_4

JUMP_3T:
    ; reset process-3 value to 2
    ; dump and jump to process-3
    LD R2, TWO
    STI R2, STATE_3
    LD R5, PROC3_ADDR


    ; set MR_SM to 0 before jump to another process
    LD R2, ZERO
    STI R2, MR_SM
    ; set MR_MPU to 4 before jump to process-3 0x6000
    LD R2, FOUR
    STI R2, MR_MPU

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
    ; reset process-4 value to 2
    ; dump and jump to process-4
    LD R2, TWO
    STI R2, STATE_4
    LD R5, PROC4_ADDR

    ; set MR_SM to 0 before jump to another process
    LD R2, ZERO
    STI R2, MR_SM
    ; set MR_MPU to 5 before jump to process-4 0x7000
    LD R2, FIVE
    STI R2, MR_MPU

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
    ; reset process-5 value to 2
    ; dump and jump to process-5
    LD R2, TWO
    STI R2, STATE_5
    LD R5, PROC5_ADDR

    ; set MR_SM to 0 before jump to another process
    LD R2, ZERO
    STI R2, MR_SM
    ; set MR_MPU to 6 before jump to process-5 0x8000
    LD R2, SIX
    STI R2, MR_MPU

    TRAP xFF
    
    JMP R5

RSET5:
    LD R2, ZERO
    STI R2, STATE_5
    TRAP x25

INF_LOOP:
    BR INF_LOOP

SIX .FILL 6
FIVE  .FILL 5
FOUR .FILL 4
THREE .FILL 3
TWO  .FILL 2
ONE .FILL 1
ZERO .FILL 0

MR_SM .FILL xFE04
MR_MPU .FILL xFE06

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