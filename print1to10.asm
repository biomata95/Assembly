# example to print from 1 to 10

      .text
main: li $t0, 11 #sets the maximum value to $t0 + 1
        li $a0, 65+1 #sets the initial value to $a0 ($a0 serah quoter)
laco1: jal printInt # call our routine (print integer function)
        add $a0, $a0, 1
        bne $a0,$t0, laco1

        li $v0, 10 # system call for exit (specifies program termination)
        syscall # we are out of here. (calls SO to finish)

######### routine to print integer that is in $a0

      .text
printInt: li $v0, 1 # specifies in $V0 the function to be executed
                                  # in this case the Print Integer function
            syscall # call operating system function
            jr $ra # return

######### routine to print a queestah character in $a0

      .text
printChar: li $v0, 11 # specifies in $V0 the function to be executed
                                  # in this case the Print Integer function
            syscall # call operating system function
            jr $ra # return