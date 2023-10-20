# zbir na elementi od niza A

# $s0 = &A
# $s5 = adresata vo memorija kade shto treba da go zapisheme rezultatot

# $s1 = broj na elementi vo nizata length(A)
# $s2 = brojach, i
# $s3 = zbir
# $t0 = A[i]

li $s0, 0x10010000
li $s5, 0x100101e0
li $s1, 5 # broj na elementi vo nizata
li $s2, 0

startLoop: bge $s2, $s1, endLoop # ako brojach>=broj_elemtni skokni kaj endLoop

sll $t0, $s2, 2 # offset na i-tiot element vo pogled na start na nizata
add $t0, $t0, $s0 # t0 = &A[i]
lw $t0, 0($t0) # t0 = A[i]

add $s3, $t0, $s3 # $s3+=$t0 ;; $s3 = $s3 + $t0

addi $s2, $s2, 1 # i++
j startLoop


endLoop:
sw $s3, 0($s5)