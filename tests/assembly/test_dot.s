.import ../../src/dot.s
.import ../../src/utils.s

# Set vector values for testing
.data
vector0: .word 1 2 3 4 5 6 7 8 9
vector1: .word 1 2 3 4 5 6 7 8 9
# Arguments:
#   a0 (int*) is the pointer to the start of v0
#   a1 (int*) is the pointer to the start of v1
#   a2 (int)  is the length of the vectors
#   a3 (int)  is the stride of v0
#   a4 (int)  is the stride of v1
# Returns:
#   a0 (int)  is the dot product of v0 and v1

.text
# main function for testing
main:
    # Load vector addresses into registers
    la s0 vector0
    la s1 vector1

    # Set vector attributes
    addi s2 x0 9

    addi s3 x0 1
    addi s4 x0 1

    mv a0 s0
    mv a1 s1

    mv a2 s2

    mv a3 s3
    mv a4 s4

    # Call dot function
    jal ra dot

    # Print integer result
    mv a1 a0
    jal ra print_int

    # Print newline
    li a1 '\n'
    jal ra print_char

    # Exit
    jal exit
