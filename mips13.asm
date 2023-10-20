# $s0 - vneseniot broj od korisnikot
# $s1 - golemina na niza
# $s2 - &A
# $s3 - A[i]
# $t0 - brojac

.data
broevi: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
golemina: .word 10
vnesiVrednost: .asciiz "Vnesi vrednost:"
postoi: .asciiz "Postoi"
nepostoi: .asciiz "Ne postoi"

.text

# pechatenje na "vnesi vrednost"

pecatenjeporaka: li $v0, 4 # syscall id za print_string
		 la $a0, vnesiVrednost
		 syscall

citanjeVrednost: li $v0, 5 #syscall id za read_int
		 syscall # rezultatot od citanjeto ke go imame vo $v0
		 move $s0, $v0
		 
izminuvanjeNiza:
li $t0, 0 #brojac
la $s1, golemina # &golemina
lw $s1, 0($s1)	
	 
la $s2, broevi

startLoop: bge $t0, $s1, neENajden

sll $s3, $t0, 2 # vo s3 e offsetot na i-tiot element od pocetokot na nizata
add $s3, $s3, $s2 # s3=&A[i]
lw $s3, 0($s3) # s3=A[i]

beq $s3, $s0, najden

addi $t0, $t0, 1 # brojac+=1
j startLoop

neENajden: li $v0,4 # pechatime poraka "ne postoi"
	   la $a0, nepostoi
	   syscall 
	   j kraj # go skokame sledniot blok "najden" i direktno odime na kraj
	   
najden: li $v0, 4 # za pecatenje na 4 syscallid pechatime poraka "postoi"
	la $a0, postoi;
	syscall
		
kraj:   li $v0,10
	syscall