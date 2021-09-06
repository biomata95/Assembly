.date
i: .space 4

.text
main:
      already readInt
      sw $v0,i
      lw $t1,i
while00:
      sgt $t0,$t1,$0
      beq $t0,$t1,endwhile00
      moves $a0,$t1
      jal printsInt
      I went up $t1,$t1.1
      j while00
endwhile00:
      move $a0,$zero
      already exit

######### routine to read integer and put the value in $v0
      .text
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