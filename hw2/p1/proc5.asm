.ORIG x08000
LD R1, VAR5
STI R1, MR_SM
STI R1, MR_20

TRAP x25
VAR5 .FILL 5
MR_SM .FILL xFE04
MR_20 .FILL x0200

.END