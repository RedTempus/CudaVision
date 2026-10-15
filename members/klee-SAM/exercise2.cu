thrust::universal_vector<float> vec{1,2,3,54,7};


// cpu
thrust::for_each(thrust::host, vec.begin(), vec.end(), [] __host__ (int val) {
  printf("printing %d on %s\n", val, cv::execution_space());
});


// gpu
thrust::for_each(thrust::device, vec.begin(), vec.end(), [] __device__ (int val) {
  printf("printing %d on %s\n", val, cv::execution_space());
});