#include <stdio.h>

__global__ void kernel( void ) { 
    printf("Hello from gpu!\n");
}

int main( void ) {

    kernel<<<1,1>>>();
    cudaDeviceSynchronize();
    //printf( "Hello, World!\n" );

    return 0; 

}
