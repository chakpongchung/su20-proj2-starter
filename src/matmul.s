
.globl matmul

.text

matmul:
    # Error checks
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

    # Error checks
    # Prologue
    mv s0 a0
    mv s1 a1 
    mv s2 a2

    mv s3 a3
    mv s4 a4 
    mv s5 a5 

    mv s6 a6

    addi s7 x0 0 #   for i
    addi s8 x0 0 #   for j
    li   s9,0  #     index of d


outer_loop_start:

    bge s7 s1 outer_loop_end
    addi s8 x0 0 #   for j


inner_loop_start:

    bge s8 s5 outer_loop_start

#prepare argument for dot
# n0*i
    mul t0 s2 s7
    addi t1 x0 4  
    mul t0 t0 t1 
#for mat0 offset
    add a0 s0 t0 
# 1*j
    addi t0 x0 4  
    mul t0 s8 t0
#for mat1 offset
    add a1 s3 t0
#   a2 (int)  is the length of the vectors
    add a2 s2 x0

    addi a3 x0 1
    add a4 x0 s5

    # Call dot function
    jal ra dot

# save result from dot to d
    # li t0 4
    addi t0 x0 4 # why t0 is not 4??
    mul t0 t0 s9 
    add t0 s6 t0  # new address for d ,saved in a6
    sw a0 0(t0)

inner_loop_end:

    addi s8 s8 1 #j
    addi s9 s9 1 #k for d

    blt  s8 s5 inner_loop_start

outer_loop_end:

    addi s7 s7 1
    blt s7 s1 outer_loop_start

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
    
    ret