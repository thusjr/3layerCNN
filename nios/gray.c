/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>
#include "system.h"
#include "string.h"

#define FRAME_LENGTH 768
#define FRAME_WIDTH 1024
#define FRAME_SIZE 786432

// 彩色图像指针
unsigned short * rgbram = (unsigned short *)(SDRAM_BASE+0x100000);
// 28*28指针
unsigned short * smallram = (unsigned short *)(SDRAM_BASE+0x200000);
// 灰度矩阵指针
unsigned char * grayram = (unsigned char *)(SDRAM_BASE+0x300000);
unsigned short rr,gg,bb;
int i;
int j;
void tosmall();
void togray();
int main(void)
{

    memset(rgbram,0,FRAME_SIZE);
    memset(smallram,0,784);
    memset(grayram,0,784);


    for(i=0;i<786432;i++){
        *(rgbram++) = (unsigned short)0xDEDE;
    }
    rgbram = (unsigned short *)(SDRAM_BASE+0x100000);
    tosmall();
    togray();

//    for(i=0;i<200;i++){
//        printf("%d\n",*(--rgbram));
//    }

//    for(i=0;i<25;i++){
//        printf("%d\n",*(smallram++));
//    }

    for(i=0;i<784;i++){
        printf("%d\n",*(grayram++));
    }
    return 0;
}

// 1024*768图像转变为28*28图像
void tosmall()
{
	//列循环
	for (i=0;i<FRAME_LENGTH;i++)
	{
		//行循环
		for(j = 0;j<FRAME_WIDTH;j++)
		{
			//选择对应像素
			if(i == 0 || i == 28 || i == 56 || i == 84 || i == 112 || i == 140 || i == 168 || i == 196 || i == 224 || i == 252 || i == 280 || i == 308 || i == 336 || i == 364 || i == 392 || i == 420 || i == 448 || i == 476 || i == 504 || i == 532 || i == 560 || i == 588 || i == 616 || i == 644 || i == 672 || i == 700 || i == 728 || i == 756)
			{
				if(j == 0 || j == 37 || j == 74 || j == 111 || j == 148 || j == 185 || j == 222 || j == 259 || j == 296 || j == 333 || j == 370 || j == 407 || j == 444 || j == 481 || j == 518 || j == 555 || j == 592 || j == 629 || j == 666 || j == 703 || j == 740 || j == 777 || j == 814 || j == 851 || j == 888 || j == 925 || j == 962 || j == 999)
				{
					*(smallram++) = *(rgbram);
				}
			}
			rgbram++;
		}
	}
	//重置28*28彩色图像指针
	smallram = (unsigned short *)(SDRAM_BASE+0x200000);
}

//rgb565转变为灰度
void togray()
{
	for(i = 0; i < 784 ;i++)
	{
		//转变为rgb888
		rr = (unsigned char)((*(smallram) & 0xf800) >> 8);
		gg = (unsigned char)((*(smallram) & 0x07e0) >> 3);
		bb = (unsigned char)((*(smallram) & 0x001f) << 3);
		smallram++;
		//转变为灰度值
	    *(grayram++) = (rr + gg + gg + bb) >> 2;
	}
	//重置灰度矩阵指针
	grayram = (unsigned char *)(SDRAM_BASE+0x300000);
}

