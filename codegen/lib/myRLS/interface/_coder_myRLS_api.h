/*
 * File: _coder_myRLS_api.h
 *
 * MATLAB Coder version            : 5.4
 * C/C++ source code generated on  : 16-Feb-2023 10:01:19
 */

#ifndef _CODER_MYRLS_API_H
#define _CODER_MYRLS_API_H

/* Include Files */
#include "emlrt.h"
#include "tmwtypes.h"
#include <string.h>

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
void myRLS(real_T d[256], real_T x[256], real_T lamda, real_T M);

void myRLS_api(const mxArray *const prhs[4]);

void myRLS_atexit(void);

void myRLS_initialize(void);

void myRLS_terminate(void);

void myRLS_xil_shutdown(void);

void myRLS_xil_terminate(void);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for _coder_myRLS_api.h
 *
 * [EOF]
 */
