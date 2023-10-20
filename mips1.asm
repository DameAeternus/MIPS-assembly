## ZADACHA 1

# a = 8
# b = 17
# c = 39 
# d = 106
# rez = a+b+c+d

# s0 = a
# s1 = b
# s2 = c
# s3 = d
# s4 = rezultat

addi $s0, $zero, 8
addi $s1, $zero, 17
addi $s2, $zero, 39
addi $s3, $zero, 106

add $s4, $s0, $s1 # s4 = s0 +s1; s4 = a + b
add $s4, $s4, $s2 # s4 = s4 + s2 = s4 = s4 + c
add $s4, $s4, $s3 # s4 = s4 + s3 == s4 = s4 + d
