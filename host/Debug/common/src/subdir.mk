################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../common/src/AOCL_Utils.cpp 

OBJS += \
./common/src/AOCL_Utils.o 

CPP_DEPS += \
./common/src/AOCL_Utils.d 


# Each subdirectory must supply rules for building sources it contributes
common/src/%.o: ../common/src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	arm-linux-gnueabihf-g++ -I"E:\SOC_SDK\Quartus\hld\host\include" -I"E:\SOC_SDK\Quartus\hld\board\terasic\de1soc\design\Sobel_Filter\host\common\inc" -I"E:\SOC_SDK\SOCEDS\embedded\ds-5\include\opencv" -I"E:\SOC_SDK\SOCEDS\embedded\ds-5\include\opencv\opencv" -I"E:\SOC_SDK\SOCEDS\embedded\ds-5\include\opencv\opencv2" -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


