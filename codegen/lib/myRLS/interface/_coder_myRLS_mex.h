/*
 * File: _coder_myRLS_mex.h
 *
 * MATLAB Coder version            : 5.4
 * C/C++ source code generated on  : 16-Feb-2023 10:01:19
 */

#ifndef _CODER_MYRLS_MEX_H
#define _CODER_MYRLS_MEX_H

/* Include Files */
#include "emlrt.h"
#include "mex.h"
#include "tmwtypes.h"

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
MEXFUNCTION_LINKAGE void mexFunction(int32_T nlhs, mxArray *plhs[],
                                     int32_T nrhs, const mxArray *prhs[]);

emlrtCTX mexFunctionCreateRootTLS(void);

void unsafe_myRLS_mexFunction(int32_T nlhs, int32_T nrhs,
                              const mxArray *prhs[4]);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for _coder_myRLS_mex.h
 *
 * [EOF]
 */
