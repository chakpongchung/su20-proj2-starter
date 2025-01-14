

.globl argmax

.text
# =================================================================
# FUNCTION: Given a int vector, return the index of the largest
#	element. If there are multiple, return the one
#	with the smallest index.
# Arguments:
# 	a0 (int*) is the pointer to the start of the vector
#	a1 (int)  is the # of elements in the vector
# Returns:
#	a0 (int)  is the first index of the largest element
# Exceptions:
# - If the length of the vector is less than 1,
#   this function terminates the program with error code 120.
# =================================================================

# t=a[0];
# int res=-1;
# for(int i =1;i< n;i++){
   # if(a0[i]<=t) continue;
#    t=a0[i];
#    res=i;
# }
# return res;

argmax:
    li a2, 1
    blt a1, a2, exit_7

    lw a3, 0(a0) #t, current max
    li a7, 0 # res

    li t0, 0 #set i=0
    addi t3,x0, 4 # 4-byte offset for i
    j loop_in

loop_start:
    bge t0,a1,after_loop

loop_in:
    mul t6, t0, t3 # i * 4
    add t4, a0, t6 # address for a[i]
    lw t5, 0(t4) # load  a[i]
    bge a3, t5, continue

    add  a3, x0, t5  # a3=a0[i]
    addi a7, t0,0  # res=i

continue:
    addi t0, t0, 1 #increment i
    j loop_start

after_loop:
    addi a0, a7,0 # return a7
    ret # end

exit_7:
    addi a0, x0, 17
    addi a1, x0, 7
    ecall

