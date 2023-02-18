/*
 * File: _coder_myRLS_mex.c
 *
 * MATLAB Coder version            : 5.4
 * C/C++ source code generated on  : 16-Feb-2023 10:01:19
 */

/* Include Files */
#include "_coder_myRLS_mex.h"
#include "_coder_myRLS_api.h"

/* Function Definitions */
/*
 * Arguments    : int32_T nlhs
 *                mxArray *plhs[]
 *                int32_T nrhs
 *                const mxArray *prhs[]
 * Return Type  : void
 */
void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs,
                 const mxArray *prhs[])
{
  (void)plhs;
  mexAtExit(&myRLS_atexit);
  /* Module initialization. */
  myRLS_initialize();
  /* Dispatch the entry-point. */
  unsafe_myRLS_mexFunction(nlhs, nrhs, prhs);
  /* Module termination. */
  myRLS_terminate();
}

/*
 * Arguments    : void
 * Return Type  : emlrtCTX
 */
emlrtCTX mexFunctionCreateRootTLS(void)
{
  emlrtCreateRootTLSR2022a(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1,
                           NULL, (const char_T *)"GBK", true);
  return emlrtRootTLSGlobal;
}

/*
 * Arguments    : int32_T nlhs
 *                int32_T nrhs
 *                const mxArray *prhs[4]
 * Return Type  : void
 */
void unsafe_myRLS_mexFunction(int32_T nlhs, int32_T nrhs,
                              const mxArray *prhs[4])
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  st.tls = emlrtRootTLSGlobal;
  /* Check for proper number of arguments. */
  if (nrhs != 4) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 4, 4,
                        5, "myRLS");
  }
  if (nlhs > 0) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 5,
                        "myRLS");
  }
  /* Call the function. */
  myRLS_api(prhs);
}

/*
 * File trailer for _coder_myRLS_mex.c
 *
 * [EOF]
 */
