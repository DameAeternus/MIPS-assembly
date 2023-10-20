# i = 5
# A[i] = 15
# A[i+1] = A[i] + A[3*i+2]
# $s0 = &A

# $s1 = 5 # ova e i
# $s2 == A[i] = 15
# $t0 = &A[i]
# $t1 = &A[3*i+2]
# $t2 = A[3*i+2]
# $t3 = A[i]+A[3*i+2]
# t4 = &A[i+1]

li $s0, 0x10010000
li $s1, 5 # s1==i = 5
li $s2, 15 # s2 = 15

sll $t0, $s1, 2
add $t0, $t0, $s0 # t0 = adresata na koja se naogja A[i] elementot

sw $s2, 0($t0)

li $t1, 3
mult $s1, $t1

mflo $t1 # t1 = 3*i
addi $t1, $t1, 2 # t1 = 3*i+2
sll $t1, $t1, 2 # offset za 3*i+2 elementot vo memorija
add $t1, $t1, $s0 # t1 = &A[3*i+2]
lw $t2, 0($t1) # t2 = A[3*i+2]


add $t3, $s2, $t2 # t3 = A[i] + A[3*i+2]
# sw $t3, 4($t0) # ova e eden nachin za zachuvuvanje na pozicija A[i+i]

addi $t4, $s1, 1 # t4 = i+1 = 6
sll $t4, $t4, 2 # offset vo memorija za i+1 element
add $t4, $t4, $s0 # &A[i+1]


sw $t3, 0($t4) # A[i+1] = A[i] + A[3*i+2]
