
#/*
# OBS1: doing up to line XXX first prints the first matrix
# doing everything prints two Arrays as below:
#
#            1 1 1 1 1 1 1 1 1 1 
#            0 1 1 1 1 1 1 1 1 1 
#            0 0 1 1 1 1 1 1 1 1 
#            0 0 0 1 1 1 1 1 1 1 
#            0 0 0 0 1 1 1 1 1 1 
#            0 0 0 0 0 1 1 1 1 1 
#            0 0 0 0 0 0 1 1 1 1 
#            0 0 0 0 0 0 0 1 1 1 
#            0 0 0 0 0 0 0 0 1 1 
#            0 0 0 0 0 0 0 0 0 1 
#
#            1 0 0 0 0 0 0 0 0 0 4 1 1 1 1 1 1 1 1 1 
#            1 1 0 0 0 0 0 0 0 0 4 4 1 1 1 1 1 1 1 1 
#            1 1 1 0 0 0 0 0 0 0 4 4 4 1 1 1 1 1 1 1 
#            1 1 1 1 0 0 0 0 0 0 4 4 4 4 1 1 1 1 1 1 
#            1 1 1 1 1 0 0 0 0 0 4 4 4 4 4 1 1 1 1 1 
#            1 1 1 1 1 1 0 0 0 0 4 4 4 4 4 4 1 1 1 1 
#            1 1 1 1 1 1 1 0 0 0 4 4 4 4 4 4 4 1 1 1 
#            1 1 1 1 1 1 1 1 0 0 4 4 4 4 4 4 4 4 1 1 
#            1 1 1 1 1 1 1 1 1 0 4 4 4 4 4 4 4 4 4 1 
#            1 1 1 1 1 1 1 1 1 1 4 4 4 4 4 4 4 4 4 4 
#
#*/

.data
Mat: .space 800
l: .space 4
c: .space 4

.text
main:
		sw $0,l
for00:
		lw $t1,l
		slti $t0,$t1,10
		beq $t0,$0,fimfor00
		sw $0,c
for01:
		lw $t2,c
		slti $t0,$t2,10
		beq $t0,$0,fimfor01
if00:
			lw $t1,l
			lw $t2,c
			sge $t0,$t1,$t2
			beq $t0,$0,else00
			lw $t1,l
			mul $t1,$t1,80
			lw $t2,c
			mul $t2,$t2,4
			add $t0,$t1,$t2
			li $s0,1
			sw $s0,Mat($t0)
			j fimif00
else00:
			lw $t1,l
			mul $t1,$t1,80
			lw $t2,c
			mul $t2,$t2,4
			add $t0,$t1,$t2
			sw $0,Mat($t0)
fimif00:
		lw $t2,c
		addi $t2,$t2,1
		sw $t2,c
		j for01
fimfor01:
		lw $t1,l
		addi $t1,$t1,1
		sw $t1,l
		j for00
fimfor00:
		addi $a0,$0,10
		jal imprimeChar            
		sw $0,l
for02:
		lw $t1,l
		slti $t0,$t1,10
		beq $t0,$0,fimfor02
		sw $0,c
for03:
		lw $t2,c
		slti $t0,$t2,10
		beq $t0,$0,fimfor03
		lw $t1,c
		mul $t1,$t1,80
		lw $t2,l
		mul $t2,$t2,4
		add $t0,$t1,$t2
		lw $a0,Mat($t0)
		jal imprimeInt
		addi $a0,$0,32
		jal imprimeChar  
		lw $t2,c
		addi $t2,$t2,1
		sw $t2,c
		j for03
fimfor03:
		addi $a0,$0,10
		jal imprimeChar
		lw $t1,l
		addi $t1,$t1,1
		sw $t1,l
		j for02
fimfor02:
		addi $a0,$0,10
		jal imprimeChar
		move $a0,$0
		jal exit


      .text   
######### routine to read integer and put the value in $v0
readInt:
         read $v0, 5 # readInt function number
         syscall # call OS function
         jr $ra # return

######### routine to print integer that is in $a0
.text
printInt: li $v0, 1 # specifies in $V0 the function to be executed
                                  # in this case the Print Integer function
            syscall # call operating system function
            jr $ra # return

######### routine to print a character that is in $a0
      .text
printChar: li $v0, 11 # specifies in $V0 the function to be executed
                                  # in this case the Print Integer function
            syscall # call operating system function
            jr $ra # return

######### exit routine that terminates program with value passed in $a0
      .text
exit: li $v0, 10 # system call for exit (specifies program termination)
        syscall # we are out of here. (calls SO to finish)
        #see that there is no return as the program ends


