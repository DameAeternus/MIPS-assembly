# posledni 8 bita da gi smesti kako prvi 8 bita

# s1= daden broj
# s2 = rezultat

li $s1, 0x0000abcd # hexadecimalna vrednost pocnue ss 0x(ima 32 bita aka 8 chars)
# na rezultat se bara 0xcd000000
sll $s2, $s1, 24 # za da se pomesti 6 mesta na levo cd, 6*4=24 (1 char e 4 bit)

# moze i ovakoj:
andi $s1, $s1, 0x000000ff # f=1111 (bilo sto i 1 == bilo sto) br i 0 == 0

# eve drug primer:
li $s1, 0x2345abcd

# za da se ocistiv 2345ad a bc da ostane:
andi $s1,$s1, 0x00000ff0 # $s1 = 0x00000bc0 e rezultat (logicka maska)
sll $s1,$s1, 16 # samo tija vrednosti sto su ostanale na predzadnjo mesto i pred njega ke se pomestiv (drugi su 0) za 4 mesta na levo
# ke se dobie 0x0bc00000

# f se stavlja na poziciju sto sakamo da gu zadrzimo ss andi