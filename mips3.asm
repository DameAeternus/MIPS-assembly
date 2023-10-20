# a=(a/b)+(c%d)+(a*d) 1+1+
# $s1= a
# s2= b
# s3=c
# s4=d
# 
addi $s1,$zero, 6 #a=6
addi $s2,$zero, 4 #b=4
addi $s3,$zero, 3 #c=3
addi $s4,$zero, 2 #d=2
div $s1,$s2
mflo $t0 #t0=a/b

div $s3,$s4
mfhi $t2 #t1=c%d

mult $s1,$s4 
mflo $t3 #t3=a*d

add $s0,$t0,$t1 # a=(a/b)+(c%d)
add $s0,$s0,$t3 # a=(a/b)+(c%d)+(a*d)

