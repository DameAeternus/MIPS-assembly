# da se sporedat s0 i s1 i pogolemata vrednost da se zapishe vo s2

# $t0 = rezultat od sporedba na $s0 i $s1 ($s0<$s1)
# $s2 = pogolemiot broj od s0 i s1

li $s0, 35
li $s1, 20

slt $t0, $s0, $s1

beq $t0, $zero, s0pogolemo # vo ovoj slucaj, s0 e pogolema
move $s2, $s1
j kraj



s0pogolemo: # ke se izvrshuva ako s0 e pogolemiot broj
move $s2, $s0 

kraj:
    