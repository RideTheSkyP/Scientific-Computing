#include <stdio.h>
#include <float.h>

int main(void)
{
    printf("Machine float32 epsilon: %.64f\n", FLT_EPSILON);
    printf("Machine float64 epsilon: %.64f\n", DBL_EPSILON);
    return 0;
}
