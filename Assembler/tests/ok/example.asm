; starts with all registers initialized
startLoop:
  lil r8,0x1230      ; peripheral's status register address, held in r8 for loop
  lil r9,0x1234      ; peripheral's data register address, held in r9 for loop
  lil r10,0x0001     ; bit to test for receive data present (1 = data is present in receiver)
  lil r11,0x0002     ; bit to test for transmit buffer empty (1 = transmitter ready to take data)
  add r5,r8,r0       ; transfers the contents of r8 into r5 (peripheral address register) (since r0 is always 0)
waitForRxData:
  lpb r12            ; read the status register from the peripheral bus
  and r12,r10,r12    ; AND the receive data present bit with the status register bit that was read (r10 AND r12 => R12)
                     ; the AND set the condition code register
  beq waitForRxData  ; tests the condition code register EQ=0 bit and jumps if there's no receive data yet
  add r5,r9,r0       ; set the peripheral address register to the peripheral data register address
  lpb r13            ; r13 will have the character that is in the receive buffer
  add r5,r9,r0       ; set the peripheral address to the peripheral's status register
waitForTxReady:
  lpb r12            ; read the status register from the peripheral bus
  and r12,r11,r12    ; AND the transmit data buffer empty bit with the status register but that was read
  beq waitForTxReady ; tests the condition code register EQ=0 bit and jumps if the transmit buffer is still full
  add r5,r9,r0       ; set the peripheral address register to the peripheral data register address
  spb r13            ; store the data that was read from the receiver into the transmitter
  bra waitForRxData  ; go get the next character
