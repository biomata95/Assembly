.data
menor: .space 4
i: .space 4
n: .space 4

.text


main:
	sw $0,i
	jal readInt
	sw $v0,n
	lw $t1,n
while00:
	sge $t0,$t1,0
	beq $t0,$0,fimwhile00
	lw $a0,n
	lw $a1,i
	jal min
	sw $v0,menor
	li $a0,10
	jal imprimeChar
	lw $a0,menor
	jal imprimeInt
	
	sw $v0,n
	lw $t2,i
	addi $t2,$t2,1
	sw $t2,i
	j while00
fimwhile00:
	move $a0,$0
	jal exit

.data
m: .space 4

.text
min:
if00:
	slt $t0,$a0,$a1
	beq $t0,$0,fimif00
	sw $a0,m
fimif00:
else00:
	sw $a1,m
	lw $v0,m
	jr $ra

	
######### routine to read integer and put the value in $v0
      .text
readInt:
         read $v0, 5 # readInt function number
         syscall # call OS function
         jr $ra # return

######### routine to print integer that is in $a0
printInt: li $v0, 1 # specifies in $V0 the function to be executed
                                  ## in this case the Print Integer function
            syscall # call operating system function
            jr $ra # return

######### routine to print a character that is in $a0
      .text
printChar: li $v0, 11 # specifies in $V0 the function to be executed
                                  ## in this case the Print Integer function
            syscall # call operating system function
            jr $ra # return

######### exit routine that terminates program with value passed in $a0
      .text
exit: li $v0, 10 # system call for exit (specifies program termination)
        syscall # we are out of here. (calls SO to finish)
        #see that there is no return as the program ends