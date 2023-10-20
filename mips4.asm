# s1 mnozi so -128
# prvo da mnozime so 128, pa da napravime vtor kompleement za da dobieme -

li $s1, -2

sll $s1,$s1,7 # shift vo levo za 7 pozicii == *128 (2^7)

nor $s1, $s1, $zero # komplement na $s1

addi $s1,$s1,1 # +1 na komplement za 2 komplement
