cv::where_am_I("host");

thrust::universal_vector<int> vec{1};
thrust::for_each(thrust::device, vec.begin(), vec.end(),
    [] __host__ __device__(int) { cv::where_am_I("device"); });

thrust::for_each(thrust::host, vec.begin(), vec.end(),
    [] __host__ __device__(int) { cv::where_am_I("host"); });

cv::where_am_I("host");