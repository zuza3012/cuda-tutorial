# cuda-tutorial

## compiling
~~~
nvcc file.cu -o executable
~~~
~~~
nvcc -arch sm_75 file.cu -o executable
~~~

## Kernels
~~~
__global__ void someFunction(void)
~~~
This tells compiler that function will be called from CPU and executed on GPU
## Functions
~~~
cudaDeviceReset(); // Explicitly destroys and cleans up all resources associated with the current device in the current process. 
// It is the caller's responsibility to ensure that the resources are not accessed or passed in subsequent API calls and doing 
// so will result in undefined behavior 
~~~
~~~
cudaDeviceSynchronize(); // wait for all threads to finish works
~~~
~~~
cudaMalloc
~~~
~~~
cudaMemcpy
~~~
~~~
cudaMemset
~~~
~~~
cudaFree();
~~~

~~~
cudaMemcpyHostToHost
~~~
~~~
cudaMemcpyHostToDevice
~~~
~~~
cudaMemcpyDeviceToHost
~~~
~~~
cudaMemcpyDeviceToDevice
~~~
~~~
char*  cudaGetErrorString(cudaError_t error)
~~~
