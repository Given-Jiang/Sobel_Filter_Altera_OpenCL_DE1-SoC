#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <cstring>
#include <iostream>
#include "CL/opencl.h"
#include "AOCL_Utils.h"

//OpenCV
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include "opencv2/imgproc/imgproc.hpp"

//时间测量
#include "time.h"
#include <sys/time.h>

using namespace std;
using namespace aocl_utils;
using namespace cv;

string in_img_name = "test.jpg";
unsigned int in_img_rows = NULL;
unsigned int in_img_cols = NULL;
unsigned int in_img_channels = NULL;
Mat in_img;


cl_uint num_platforms;
cl_platform_id platform;
cl_uint num_devices;
cl_device_id device;
cl_context context;
cl_command_queue queue;
cl_program program;
cl_kernel kernel;
cl_mem cl_img_in, cl_img_out;

string imageFilename;
string aocxFilename;
string deviceInfo;

struct timeval tstart,tend;//代码运行时间测量
unsigned int timeuse;

void teardown(int exit_status = 1);

void teardown(int exit_status)
{
    if (cl_img_in) clReleaseMemObject(cl_img_in);
    if (cl_img_out) clReleaseMemObject(cl_img_out);
    if (kernel) clReleaseKernel(kernel);
    if (program) clReleaseProgram(program);
    if (queue) clReleaseCommandQueue(queue);
    if (context) clReleaseContext(context);

    exit(exit_status);
}

// Free the resources allocated during initialization
void cleanup() {
  if(kernel) {
    clReleaseKernel(kernel);
  }
  if(program) {
    clReleaseProgram(program);
  }
  if(queue) {
    clReleaseCommandQueue(queue);
  }
  if(context) {
    clReleaseContext(context);
  }
}

//read image and get arguements
void img_init(string &str, Mat &img_buf, unsigned int &img_rows, unsigned int &img_cols, unsigned int &img_channels)
{
	img_buf = imread(str);
	cvtColor(img_buf, img_buf, CV_BGR2GRAY);
	img_rows = img_buf.rows;
	img_cols = img_buf.cols;
	img_channels = img_buf.channels();
}

void initCL(const unsigned int pixels_num)
{
    cl_int status;

    if (!setCwdToExeDir()) {
        teardown();
    }

    platform = findPlatform("Altera");
    if (platform == NULL) {
        teardown();
    }

    status = clGetDeviceIDs(platform, CL_DEVICE_TYPE_ALL, 1, &device, NULL);
    checkError (status, "Error: could not query devices");
    num_devices = 1; // always only using one device

    char info[256];
    clGetDeviceInfo(device, CL_DEVICE_NAME, sizeof(info), info, NULL);
    deviceInfo = info;

    context = clCreateContext(0, num_devices, &device, NULL, NULL, &status);
    checkError(status, "Error: could not create OpenCL context");

    queue = clCreateCommandQueue(context, device, 0, &status);
    checkError(status, "Error: could not create command queue");

//    gettimeofday(&tstart, NULL);//测量代码时间开始

    std::string binary_file = getBoardBinaryFile("Sobel_Filter", device);
    std::cout << "Using AOCX: " << binary_file << "\n";
//    gettimeofday(&tstart, NULL);//测量代码时间开始
    program = createProgramFromBinary(context, binary_file.c_str(), &device, 1);

//    gettimeofday(&tend, NULL);//结束测量

    status = clBuildProgram(program, num_devices, &device, "", NULL, NULL);
    checkError(status, "Error: could not build program");

//    gettimeofday(&tend, NULL);//结束测量
//    timeuse = (unsigned int) (1000000*(tend.tv_sec-tstart.tv_sec)+(tend.tv_usec-tstart.tv_usec)); //换算为微秒
//    cout << "Probe Used Time = " << timeuse << "uS" << endl;

    kernel = clCreateKernel(program, "sobel", &status);
    checkError(status, "Error: could not create Gray_Processing kernel");

    cl_img_in = clCreateBuffer(context, CL_MEM_READ_ONLY, pixels_num, NULL, &status);
    checkError(status, "Error: could not create device buffer");

    cl_img_out = clCreateBuffer(context, CL_MEM_WRITE_ONLY, pixels_num, NULL, &status);
    checkError(status, "Error: could not create output buffer");

    status  = clSetKernelArg(kernel, 0, sizeof(cl_mem), &cl_img_in);
    status |= clSetKernelArg(kernel, 1, sizeof(cl_mem), &cl_img_out);
    status |= clSetKernelArg(kernel, 2, sizeof(unsigned int), &pixels_num);
    checkError(status, "Error: could not set sobel args");
}

void Sobel(Mat &img, const unsigned int pixels_num, unsigned int rows, unsigned int cols)
{
    size_t SobelSize = 1;
    cl_int status;

    uchar* pixel_in = img.data;
    status = clEnqueueWriteBuffer(queue, cl_img_in, CL_FALSE, 0, pixels_num, pixel_in, 0, NULL, NULL);
    checkError(status, "Error: could not copy data into device");

    status = clFinish(queue);
    checkError(status, "Error: could not finish successfully");

    status = clSetKernelArg(kernel, 2, sizeof(unsigned int), &pixels_num);
    checkError(status, "Error: could not set sobel threshold");

    cl_event event;
    status = clEnqueueNDRangeKernel(queue, kernel, 1, NULL, &SobelSize, &SobelSize, 0, NULL, &event);
    checkError(status, "Error: could not enqueue sobel filter");

    status  = clFinish(queue);
    checkError(status, "Error: could not finish successfully");

    cl_ulong start, end;
    status  = clGetEventProfilingInfo(event, CL_PROFILING_COMMAND_START, sizeof(cl_ulong), &start, NULL);
    status |= clGetEventProfilingInfo(event, CL_PROFILING_COMMAND_END, sizeof(cl_ulong), &end, NULL);
    checkError(status, "Error: could not get profile information");
    clReleaseEvent(event);

    Mat out_img(rows, cols, CV_8UC1);//must define the arguements when define the Mat
	uchar* pixel_out = out_img.data;
    status = clEnqueueReadBuffer(queue, cl_img_out, CL_FALSE, 0, pixels_num, pixel_out, 0, NULL, NULL);
    checkError(status, "Error: could not copy data from device");

    status = clFinish(queue);
    checkError(status, "Error: could not successfully finish copy");

    imwrite("test_out.jpg", out_img);
}

int main(int argc, char **argv)
{
	img_init(in_img_name, in_img, in_img_rows, in_img_cols, in_img_channels);

	cout << "in_img_rows = " << in_img_rows <<endl;
	cout << "in_img_cols = " << in_img_cols <<endl;
	cout << "in_img_channels = " << in_img_channels <<endl;
	cout << "isContinue = " << in_img.isContinuous() << endl;

	const unsigned int IN_IMG_SIZE =  in_img_rows * in_img_cols * in_img_channels;

    gettimeofday(&tstart, NULL);//测量代码时间开始

    initCL(IN_IMG_SIZE);

//    gettimeofday(&tend, NULL);//结束测量

    Sobel(in_img, IN_IMG_SIZE, in_img_rows, in_img_cols);

    gettimeofday(&tend, NULL);//结束测量
    timeuse = (unsigned int) (1000000*(tend.tv_sec-tstart.tv_sec)+(tend.tv_usec-tstart.tv_usec)); //换算为微秒

    cout << "OpenCL Used Time = " << timeuse << "uS" << endl;

    gettimeofday(&tstart, NULL);//测量代码时间开始
	//opencv comparison
	Mat dst_x,dst_y,dst;
	Sobel(in_img, dst_x, in_img.depth(), 1, 0);
	Sobel(in_img, dst_y, in_img.depth(), 0, 1);
	convertScaleAbs(dst_x, dst_x);
    convertScaleAbs(dst_y, dst_y);
    addWeighted( dst_x, 0.5, dst_y, 0.5, 0, dst);
    imwrite("test_cv_sobel.jpg", dst);
	gettimeofday(&tend, NULL);//结束测量
	timeuse = (unsigned int) (1000000*(tend.tv_sec-tstart.tv_sec)+(tend.tv_usec-tstart.tv_usec)); //换算为微秒
	cout << "OpenCV Used Time = " << timeuse << "uS" << endl;

    teardown(0);
}
