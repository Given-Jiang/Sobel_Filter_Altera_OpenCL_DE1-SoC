#define ROWS 576
#define COLS 720

__kernel
__attribute__((task))
void sobel(__global uchar* restrict img_test_in, __global uchar* restrict img_test_out, const unsigned int iterations)
{
    unsigned int count = 0;

    // Filter coefficients
    int Gx[3][3] = {{-1,-2,-1},{0,0,0},{1,2,1}};
	int Gy[3][3] = {{-1,0,1},{-2,0,2},{-1,0,1}};

	int rows[2 * COLS + 3];

    while(count != iterations)
    {
		#pragma unroll
		for (int i = COLS * 2 + 2; i > 0; --i)
		{
			rows[i] = rows[i - 1];
		}
		rows[0] = img_test_in[count];

		int x_dir = 0;
        int y_dir = 0;

		#pragma unroll
		for (int i = 0; i < 3 ; ++i)
		{
			#pragma unroll
			for (int j = 0; j < 3; ++j)
			{
				unsigned int pixel = rows[i * COLS + j];
				x_dir += pixel * Gx[i][j];
				y_dir += pixel * Gy[i][j]; 
			}
		}
		int temp_x = abs(x_dir) + abs(y_dir);
		uchar temp;
		if (temp_x >= 255)
		{
			temp = 255;
		}else
		{
			temp = temp_x;
		}
		img_test_out[count++] = temp;
	}

}


