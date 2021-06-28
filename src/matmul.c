// C program to multiply two square matrices.
#include <stdio.h>
#define N 3

// This function multiplies mat1[][] and mat2[][],
// and stores the result in res[][]
// void multiply(int mat1[][N], int mat2[][N], int res[][N])
// {
//     int i, j, k;
//     for (i = 0; i < N; i++)
//     {
//         for (j = 0; j < N; j++)
//         {
//             res[i][j] = 0;
//             for (k = 0; k < N; k++)
//                 res[i][j] += mat1[i][k] * mat2[k][j];
//         }
//     }
// }


// #   a0 (int*) is the pointer to the start of v0
// #   a1 (int*) is the pointer to the start of v1
// #   a2 (int)  is the length of the vectors
// #   a3 (int)  is the stride of v0
// #   a4 (int)  is the stride of v1
int dot(int *vec1, int *vec2, int n, int s1, int s2)
{

    int res = 0;
    for (int k = 0; k < n; k++)
    {
        res += vec1[s1 * k] * vec2[s2 * k];
    }

    return res;
}

// # Arguments:
// # 	a0 (int*)  is the pointer to the start of m0
// #	a1 (int)   is the # of rows (height) of m0
// #	a2 (int)   is the # of columns (width) of m0
// #	a3 (int*)  is the pointer to the start of m1
// # 	a4 (int)   is the # of rows (height) of m1
// #	a5 (int)   is the # of columns (width) of m1
// #	a6 (int*)  is the pointer to the the start of d
// # Returns:
// #	None (void), sets d = matmul(m0, m1)
void multiply(int *mat1, int m1, int n1, int *mat2, int m2, int n2, int *res)
{
    for (int k = 0; k < m1*n2; k++)
    {
        int i = k / m1, j = k % n1;
        printf("i: %d, j: %d\n",i,j);
        res[k] = dot(mat1 + i, mat2+j, n1, 1, m2);
    }
}

int main()
{

    int vec1[9] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    int vec2[9] = {1, 2, 3, 4, 5, 6, 7, 8, 9};

    int r[4];
    multiply(vec1, 2,3, vec2, 3, 2, r);

    for(int i =0;i<4;i++){
        printf(  "r[i]: %d\n",r[i] );
    }

    // int mat1[N][N] = {{1, 2, 3},
    //                   {4, 5, 6},
    //                   {7, 8, 9}};

    // int mat2[N][N] = {{1, 2, 3},
    //                   {4, 5, 6},
    //                   {7, 8, 9}};

    // int res[N][N]; // To store result
    // int i, j;
    // multiply(mat1, mat2, res);

    // printf("Result matrix is \n");
    // for (i = 0; i < N; i++)
    // {
    //     for (j = 0; j < N; j++)
    //         printf("%d ", res[i][j]);
    //     printf("\n");
    // }

    return 0;
}