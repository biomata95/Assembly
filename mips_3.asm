.date
n: .space 4

.text

main:
             lw $a0,n
             already readInt
             lw $a0,n
             lw $a1.n
             jal prints MatUnit
             read $a0.0
             already exit
     
.date
l: .space 4
c: .space 4

.text
                       
printMatUnit:
             sw $0.1
             lw $t1.1
             move $s1,$a0
while00:
             slt $t0,$t1,$s1
             beq $t0,$0,fimwhile00

             sw $0.0c
             lw $t2,c
             move $s2,$a1
while01:
             slt $t0,$t2,$s2
             beq $t0,$0,fimwhile01
if00:
             seq $t0,$t1,$t2
             beq $t0,$0,else00
             read $a0.1
             jal printsInt
else00:
             read $a0.0
             jal printsInt
             read $a0.32
             jal printChar
             add $t2,$t2.1
             sw$t2,c
             j while01
endwhile01:
             read $0.10
             jal printChar
             add $t1,$t1.1
             sw $t1.1
             j while00
endwhile00:
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