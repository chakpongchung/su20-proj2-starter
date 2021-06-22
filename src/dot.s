
.globl dot

.text
# =======================================================
# FUNCTION: Dot product of 2 int vectors
# Arguments:
#   a0 (int*) is the pointer to the start of v0
#   a1 (int*) is the pointer to the start of v1
#   a2 (int)  is the length of the vectors
#   a3 (int)  is the stride of v0
#   a4 (int)  is the stride of v1
# Returns:
#   a0 (int)  is the dot product of v0 and v1
#
# If the length of the vector is less than 1, 
# this function exits with error code 5.
# If the stride of either vector is less than 1,
# this function exits with error code 6.
# =======================================================
dot:

    # Prologue
    li t0, 1
    blt a2,t0, exit_5

    blt a3,t0,exit_6
    blt a4,t0,exit_6
    
    li a7, 0# final dot product result

    li t0, 0 #set i=0
    addi t1,x0, 4 # 4-byte offset for i

    j loop_in

loop_start:
    bge t0,a2,loop_end

loop_in:
    mul t6, t0, t1 # i * 4
    
    add t4, a0, t6 # address for a[i]
    lw t5, 0(t4) # load  a[i]

    add t2, a1, t6 # address for b[i]
    lw t3, 0(t2) # load  b[i]

    mul  s1, t3, t5  # a3=a0[i]
    add a7, a7,s1  # res=i


continue:
    addi t0, t0, 1 #increment i
    j loop_start

loop_end:
    addi a0, a7,0 # return a7
    ret # end






exit_5:
    addi a0, x0, 17
    addi a1, x0, 5
    ecall

exit_6:
    addi a0, x0, 17
    addi a1, x0, 5
    ecall
