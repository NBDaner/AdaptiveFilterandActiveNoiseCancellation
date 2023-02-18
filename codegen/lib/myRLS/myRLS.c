/*
 * File: myRLS.c
 *
 * MATLAB Coder version            : 5.4
 * C/C++ source code generated on  : 16-Feb-2023 10:01:19
 */

/* Include Files */
#include "myRLS.h"

/* Function Definitions */
/*
 * function [e, y, w] = myRLS(d, x,lamda,M)
 *
 * Arguments    : const double d[256]
 *                const double x[256]
 *                double lamda
 *                double M
 * Return Type  : void
 */
void myRLS(const double d[256], const double x[256], double lamda, double M)
{
  (void)d;
  (void)x;
  (void)lamda;
  (void)M;
  /*  ------------------------------------------------------------------------
   */
  /*   Copyright (C) */
  /*   LiXirong - Wuhan University, China */
  /*   */
  /*   LiXirong <634602068@qq.com> or <lixirong@whu.edu.cn> */
  /*   2018.10.15 */
  /*  ------------------------------------------------------------------------
   */
  /*  myRLS.m - least mean squares algorithm */
  /*  */
  /*  Usage: [e, y, w] = myRLS(d, x, lamda, M) */
  /*  */
  /*  Inputs: */
  /*  d  - the vector of desired signal samples of size Ns, 参考信号 */
  /*  x  - the vector of input signal samples of size Ns, 输入信号 */
  /*  lamda - the weight parameter, 权重 */
  /*  M  - the number of taps. 滤波器阶数 */
  /*  */
  /*  Outputs: */
  /*  e - the output error vector of size Ns */
  /*  y - output coefficients */
  /*  w - filter parameters */
  /*  */
  /*  ------------------------------------------------------------------------
   */
  /* 信号长度 */
  /*  if (Ns <= M)   */
  /*      %print('error: 信号长度小于滤波器阶数！'); */
  /*      return;  */
  /*  end */
  /*  if (Ns ~= length(x)) */
  /*      %print('error: 输入信号和参考信号长度不同！'); */
  /*      return; */
  /*  end */
  /* M为滤波器阶数 创建一个M阶的方阵 */
  /* a为M阶方阵的系数 */
  /* x = x; %在输入信号x前补上M-1个0，使输出y与输入具有相同长度 */
  /* zeros创建全0矩阵 */
}

/*
 * File trailer for myRLS.c
 *
 * [EOF]
 */
