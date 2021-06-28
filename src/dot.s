
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
    addi sp, sp, -48

    sw ra, 0(sp)
    sw s0, 4(sp)
    sw s1, 8(sp)
    sw s2, 12(sp)
    sw s3, 16(sp)
    sw s4, 20(sp)
    sw s5, 24(sp)
    sw s6, 28(sp)
    sw s7, 32(sp)
    sw s8, 36(sp)
    sw s9, 40(sp)
    sw s10, 44(sp)

    
    li s5, 1
    blt a2,s5, exit_5

    blt a3,s5,exit_6
    blt a4,s5,exit_6
    
    mv s0 a0
    mv s1 a1
    mv s2 a2
    mv s3 a3
    mv s4 a4



    li s5, 0 #set i=0
    li s6, 0# final dot product result


    j loop_in


loop_start:
    bge s5,a2,loop_end

loop_in:
    addi t0,x0, 4 # 4-byte offset for i
    mul t0, s5, t0 # i * 4
    mul t0, t0, s3 # stride for a

    add t0, a0, t0 # address for a[i]
    lw t5, 0(t0) # load  a[i]

    addi t0,x0, 4 # 4-byte offset for i
    mul t0, s5, t0 # i * 4
    mul t0, t0, s4 # stride for b


    add t0, a1, t0 # address for b[i]
    lw t3, 0(t0) # load  b[i]

    mul  t0, t3, t5  # a3=a0[i]
    add s6, s6,t0  # res=i


continue:
    add s5, s5, a3 #increment i by stride a3 or a4
    j loop_start

loop_end:
    addi a0, s6,0 # return s6

        # Epilogue
    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    lw s2, 12(sp)
    lw s3, 16(sp)
    lw s4, 20(sp)
    lw s5, 24(sp)
    lw s6, 28(sp)
    lw s7, 32(sp)
    lw s8, 36(sp)
    lw s9, 40(sp)
    lw s10, 44(sp)

    addi sp, sp, 48 

    ret # end

exit_5:
    addi a0, x0, 17
    addi a1, x0, 5
    ecall

exit_6:
    addi a0, x0, 17
    addi a1, x0, 5
    ecall
