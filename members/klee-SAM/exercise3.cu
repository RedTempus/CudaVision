constexpr float room = 50.f;
// ok
constexpr float k = 1.8;

// cpu
// std::vector<float> temp{42, 24, 50};

// auto op = [=](float t) {
//     return t + k * (room - t);
// };

// thrust::transform(thrust::device, temp.begin(), temp.end(), temp.begin(), op);


// gpu

thrust::universal_vector<float> temp2{42, 24, 50};

auto op2 = [=] __host__ __device__ (float t) {
    return t + k * (room - t);
};

thrust::transform(thrust::device, temp2.begin(), temp2.end(), temp2.begin(), op2);

std::for_each(temp2.begin(), temp2.end(), [](float t) { printf("%d\n", t); } );