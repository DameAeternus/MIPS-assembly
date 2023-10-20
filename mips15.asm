# $s0 = golemina
# $s1 = &A
# $s2 = broj na prosti broevi
# $s3 = brojach vo main
# $s4 = A[i]
# $s5 = test broj
# $s6 = rezultat od funkcijata
.data
niza: .word 5, 10, 15, 20, 25, 17
golemina: .word 6

.text

la $s0, golemina
lw $s0, 0($s0) # s0 = golemina = 6

la $s1, niza
li $s3, 0

loopMain: bge $s3, $s0, endMain
sll $s4, $s3, 2 # offset vo odnos na start na nizata za A[i]
add $s4, $s4, $s1 # &A[i]
lw $s4, 0($s4) # A[i]

# povik na funkcija
  move $a0, $s4
  jal proveriProst
  move $s6, $v0
  beq $s6, $zero, brojotNeEProst
  addi $s2, $s2, 1 # se zgolemuva brojot na prosti broevi za 1
  brojotNeEProst:  
addi $s3, $s3, 1
j loopMain



endMain: li $v0, 10
         syscall

proveriProst: 
# a0 = vlezniot broj za koj proveruvame
# t0 = brojach
# t1 = ostatokot

li $t0, 0

startLoop: bge $t0, $a0, EProst
div $a0, $t0
mfhi $t1

beqz $t1, neEProst

addi $t0, $t0, 1
j startLoop

EProst:
li $v0, 1
jr $ra

neEProst:
li $v0, 0
jr $ra