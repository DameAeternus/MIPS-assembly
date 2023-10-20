
# s0 = golemina na vektori
# s1 = &vektor1
# s2= &vektor2
# s3 = adresa za rezultat
# t0 = brojac
# t1 = vektor1[i]
# t2 = vektor2[i]
# t3 = rezultat od mnozenje
# s4 = skalaren proizvod
# t4 = lokacija za zapisuvanje na i-tiot element 
.data
vektor1: .word 1, 2, 3
vektor2: .word 4, 5, 6
golemina: .word 3

#skalaren = 1*4 + 2*5 + 3*6
#vektorski = 1*4; 2*5; 3*6

.text
la $s0, golemina
lw $s0, 0($s0)
li $s3, 0x100101e0 
la $s1, vektor1
la $s2, vektor2
li $s4, 0

move $a0, $s0 # dolzina
move $a1, $s1 # adresa na vektor1
move $a2, $s2 # adresa na vektor2
move $a3, $s3 # adresa na rezultat

jal mnoziVektori

kraj:
li $v0, 10
syscall

mnoziVektori:
li $t0, 0
startLoop: bge $t0, $a0, endLoop

sll $t1, $t0, 2 # offset
sll $t2, $t0, 2 # offset

add $t1, $t1, $a1 # t1= &vektor1[i]
add $t2, $t2, $a2 # t2= &vektor2[i]
lw $t1, 0($t1) # t1=vektor1[i]
lw $t2, 0($t2) # t2=vektor2[i]

mult $t1, $t2
mflo $t3 # vektor1[i]*vektor2[i]
add $s4, $s4, $t3 # zbir+=(vektor1[i]+vektor2[i]) # za skalaren proizvod

sll $t4, $t0, 2
add $t4, $t4, $a3
sw $t3, 0($t4) # zapisuvanje na i-ta pozicija vektor1[i]*vektor2[i]



addi $t0, $t0, 1

j startLoop
endLoop:
jr $ra
