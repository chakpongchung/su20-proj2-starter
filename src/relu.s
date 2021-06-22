.globl relu

.text
# ==============================================================================
# FUNCTION: Performs an inplace element-wise ReLU on an array of ints
# Arguments:
# 	a0 (int*) is the pointer to the array
#	a1 (int)  is the # of elements in the array
# Returns:
#	None
#
# If the length of the vector is less than 1, 
# this function exits with error code 8.
# ==============================================================================
relu:
    # Prologue

    li t0,1 

    blt a1 t0 exit_8

    li t0,0 # set i =0

    addi t1, x0, 4 # 32-bit offset, shift a word at a time

    j loop_in


loop_start:
    bge t0 a1 loop_end

    # todo  take abs and update in place
loop_in:
    mul t6 t0 t1

    add t4 a0 t6

    lw t5 0(t4)

    blt t5 x0 up

    j loop_continue


up:
    sw x0 0(t4) 


loop_continue:
    addi t0, t0, 1 #increment i
    j loop_start




loop_end:
    # Epilogue
	ret

exit_8:
    addi a0, x0, 17
    addi a1, x0, 8
    ecall