.ORIG x05000

LD R1, VAR2
STI R1, MR_SM
STI R1, MR_20

TRAP x25

VAR2 .FILL 2
MR_SM .FILL xFE04
MR_20 .FILL x0200

.END