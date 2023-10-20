# a = (b-c)+(d+e-f)-3

# s0 = a = rezultat
# s1 = b
# s2 = c
# s3 = d
# s4 = e
# s5 = f

# t0 = 3
# t1 = (d+e-f)

# (5-5)+(1+2-0)-3 = 0 + 3 - 3 = 0

addi $s1, $zero, 6 # b = 5
li $s2, 5 # c = 5
li $s3, 1 # d = 1
li $s4, 2 # e = 2
li $s5, 0 # f = 0

li $t0, 3 # t0 = 3

sub $s0, $s1, $s2 # a = (b-c)

add $t1, $s3, $s4 # t1 = (d+e)
sub $t1, $t1, $s5 # t1 = (d+e-f)

add $s0, $s0, $t1 # s0 = (b-c) + (d+e-f)

sub $s0, $s0, $t0 # s0 = (b-c) + (d+e-f) - 3