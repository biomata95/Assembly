
#     NOTE: running this program the output is
#     0 1 2 3 4 5 6 7 8 9 2 3 4 5 6 7 8 9 10 11 
#
#
.data
A: .space 40
B: .space 40
C: .space 80
i: .space 4

.text
main:                   
		sw $0,i	
for00:
		lw $t1,i
		slti $t0,$t1,10
		beq $t0,$0,fimfor00
		lw $s0,i
		mul $t2,$s0,4
		sw $s0,A($t2)
		lw $t1,i
		addi $t1,$t1,1
		sw $t1,i
		j for00
fimfor00:
		sw $0,i
for01:
		lw $t1,i
		slti $t0,$t1,10
		beq $t0,$0,fimfor01
		lw $t1,i
		mul $t0,$t1,4
		lw $t2,A($t0)
		addi $t2,$t2,2
		sw $t2,B($t0)
		lw $t1,i
		addi $t1,$t1,1
		sw $t1,i
		j for01
fimfor01:
		
		sw $0,i
for02:
		lw $t1,i
		slti $t0,$t1,20
		beq $t0,$0,fimfor02
if00:
			lw $t1,i
			slti $t0,$t1,10
			beq $t0,$t1,else00
			lw $t1,i
			mul $t0,$t1,4
			lw $t2,A($t0)
			sw $t2,C($t0)
			j fimif00
else00:
			lw $t1,i
			subi $t0,$t1,10
			mul $t0,$t0,4
			lw $t2,B($t0)
			lw $t1,i
			mul $t0,$t1,4
			sw $t2,C($t0)
fimif00:
		lw $t1,i
		addi $t1,$t1,1
		sw $t1,i
		j for02
fimfor02:
		
		sw $0,i
for03:
		lw $t1,i
		slti $t0,$t1,20
		beq $t0,$0,fimfor03
		lw $t0,i
		mul $t0,$t0,4
		lw $a0,C($t0)
		jal imprimeInt
		addi $a0,$0,32
		jal imprimeChar  
		lw $t1,i
		addi $t1,$t1,1
		sw $t1,i
		j for03
fimfor03:
		move $a0,$0
		jal exit
      .text   
######### routine to read integer and put the value in $v0
readInt:
         read $v0, 5 # readInt function number
         syscall # call OS function
         jr $ra # return

######### routine to print integer that is in $a0
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



