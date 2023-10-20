# while (i<20) {
#  A[i] = A[i+2] + 100
#  i+=1 
#  }

# $s0 = &A
# $t0 = brojach, i
# $t1 = 20
# $t2 = A[i+2]
# $t3 = &A[i]

li $s0, 0x10010000
li $t0, 0
li $t1, 20

startLoop: bge $t0, $t1, endLoop
## teloto na ciklusot
addi $t2, $t0, 2 # t2 = i + 2
sll $t2, $t2, 2 # offset-ot na i+2 element vo odnos na pocetokot na nizata
add $t2, $t2, $s0 # t2 = &A[i+2]
lw $t2, 0($t2) # t2 = A[i+2]
addi $t2, $t2, 100 # t2 = A[i+2]+100

sll $t3, $t0, 2 # offset na i-tiot element vo odnos na pocetokot na nizata
add $t3, $t3, $s0 # &A[i]
sw $t2, 0($t3)


addi $t0, $t0, 1 # i++; i+=1
j startLoop



endLoop:
# nadvor od ciklusot