/*
 * Filter Coefficients (C Source) generated by the Filter Design and Analysis Tool
 * Generated by MATLAB(R) 9.4 and Signal Processing Toolbox 8.0.
 * Generated on: 10-May-2019 13:13:19
 */

/*
 * Discrete-Time IIR Filter (real)
 * -------------------------------
 * Filter Structure    : Direct-Form II, Second-Order Sections
 * Number of Sections  : 1
 * Stable              : Yes
 * Linear Phase        : No
 */

/* General type conversion for MATLAB generated C-code  */
#include "tmwtypes.h"
/* 
 * Expected path to tmwtypes.h 
 * C:\matlab\extern\include\tmwtypes.h 
 */
#define MWSPT_NSEC 3
const int NL[MWSPT_NSEC] = { 1,2,1 };
const real64_T NUM[MWSPT_NSEC][2] = {
  {
     0.6778956368684,                 0 
  },
  {
                   1,                 1 
  },
  {
                   1,                 0 
  }
};
const int DL[MWSPT_NSEC] = { 1,2,1 };
const real64_T DEN[MWSPT_NSEC][2] = {
  {
                   1,                 0 
  },
  {
                   1,   0.3557912737369 
  },
  {
                   1,                 0 
  }
};
