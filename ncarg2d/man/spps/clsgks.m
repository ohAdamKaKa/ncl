.TH CLSGKS 3NCARG "March 1993" UNIX "NCAR GRAPHICS"
.na
.nh
.SH NAME
CLSGKS - Deactivates workstation 1, closes workstation 1, and
closes GKS.
.SH STATUS
CLSGKS is somewhat dated.  It was primarily used with NCAR GKS-0A
when this package only allowed for a single metacode workstation.
Now that the NCAR GKS package, like most vendor and commercial GKS
packages, provides for multiple workstations
to be open, it is recommended that standard GKS calls to
GDAWK, GCLWK, and GCLKS be used instead.
.SH SYNOPSIS
CALL CLSGKS
.SH C-BINDING SYNOPSIS
#include <ncarg/ncargC.h>
.sp
void c_clsgks()
Use the ncargex command to see the following relevant examples: 
agex01.
.SH EXAMPLES
Use the ncargex command to see the following relevant examples: 
agex01.
.SH ACCESS
To use CLSGKS, load the NCAR Graphics libraries ncarg, ncarg_gks,
and ncarg_loc, preferably in that order.  To use c_clsgks, load the 
NCAR Graphics libraries ncargC, ncarg_gksC, ncarg, ncarg_gks,
and ncarg_loc, preferably in that order.
.SH SEE ALSO
Online:
spps, gdawk, gclwk, gclks, opngks, setusv, getusv, ncarg_cbind
.sp
Hardcopy:  
NCAR Graphics Fundamentals, UNIX Version;
User's Guide for NCAR GKS-0A Graphics
.SH COPYRIGHT
Copyright 1987, 1988, 1989, 1991, 1993 University Corporation
for Atmospheric Research
.br
All Rights Reserved
