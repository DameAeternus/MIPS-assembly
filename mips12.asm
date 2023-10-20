===== ZADACHA 12 ======

# $s0 = pochetnata adresa na A
# $s1 = broj na elementi vo A
# $s2 = broj na elementi delivi so 3
# $s5 = adresa kade da se smesti rezultatot
# $t0 = brojach
# $t1 = A[i]
# $t2 = 3 immediate
# $t3 = ostatok od delenje

li $s0, 0x10010000
li $s2, 0
li $s4, 4
li $s5, 0x100101e0
li $t0, 0
li $t2, 3

startLoop: bge $t0, $s4, endLoop
sll $t1, $t0, 2 # vo t1 offset za i-tiot element od pocetokot na nizata
add $t1, $t1, $s0 # t1 = &A[i]
lw $t1, 0($t1) # t1 = A[i]

div $t1, $t2 # $t1/3
mfhi $t3
bnez $t3, continue
addi $s2, $s2, 1
continue:
addi $t0, $t0, 1 # brojach+=1
j startLoop

endLoop:

sw $s2, 0($s5)
