.global memcpy
.global memset
.global strcmp

.section .text.memcpy
memcpy:
  MOV X3, X0
1:
  CBZ X2, 1f
  SUB X2, X2, #1
  LDRB W4, [X1]
  STRB W4, [X3]
  ADD X1, X1, #1
  ADD X3, X3, #1
  B 1b
1:
  RET

.section .text.memset
memset:
  MOV X3, X0
1:
  CBZ X2, 1f
  SUB X2, X2, #1
  STRB W1, [X3]
  ADD X3, X3, #1
  B 1b
1:
  RET

.section .text.strcmp
strcmp:
  LDRB W2, [X0]
  LDRB W3, [X1]
  ADD X0, X0, #1
  ADD X1, X1, #1

  CMP W2, W3
  B.LO lhsless
  B.HI lhsgreater
  CBZ W2, equal

  B strcmp
equal:
  MOV X0, #0
  RET

lhsgreater:
  MOV X0, #1
  RET

lhsless:
  MOV X0, #~0
  RET
