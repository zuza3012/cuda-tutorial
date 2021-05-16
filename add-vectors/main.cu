#include <stdio.h>
#define N 10

__global__ void add(int *a, int *b, int *c){
    int tid = blockIdx.x;
    if(tid < N){
        c[tid] = a[tid] + b[tid];   
    }
}


int main(void){

    int nDevices;

    cudaGetDeviceCount(&nDevices);
    for (int i = 0; i < nDevices; i++) {
        cudaDeviceProp prop;
        cudaGetDeviceProperties(&prop, i);
        printf("Device Number: %d\n", i);
        printf("  Device name: %s\n", prop.name);
        printf("  Memory Clock Rate (KHz): %d\n",
            prop.memoryClockRate);
        printf("  Memory Bus Width (bits): %d\n",
            prop.memoryBusWidth);
        printf("  Peak Memory Bandwidth (GB/s): %f\n\n",
            2.0*prop.memoryClockRate*(prop.memoryBusWidth/8)/1.0e6);
    }

    
    int a[N], b[N], c[N];
    int *dev_a, *dev_b, *dev_c;
    

    // memory allocation on GPU
    cudaMalloc((void**)&dev_a, N * sizeof(int));
    cudaMalloc((void**)&dev_b, N * sizeof(int));
    cudaMalloc((void**)&dev_c, N * sizeof(int));

    // insert data to arays

    for(int i = 0; i < N; i++){
        a[i] = 1;
        b[i] = 2;
    }
    cudaMemcpy(dev_a, a, N * sizeof(int), cudaMemcpyHostToDevice);
    cudaMemcpy(dev_b, b, N * sizeof(int), cudaMemcpyHostToDevice);
    add<<<N,1>>>(dev_a, dev_b, dev_c);
    cudaDeviceSynchronize();
    // copy data to GPU
    cudaMemcpy(c, dev_c, N * sizeof(int), cudaMemcpyDeviceToHost);
    
   // see result
    for(int i = 0; i < N; i++){
        printf("%d + %d = %d \n", a[i], b[i], c[i]);
    }
    

    cudaFree(dev_a);
    cudaFree(dev_b);
    cudaFree(dev_c);
   
    
    return 0;
}