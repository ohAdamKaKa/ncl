.TH CPPKLB 3NCARG "March 1993" UNIX "NCAR GRAPHICS"
.na
.nh
.SH NAME
CPPKLB - Picks a set of labels for labeled contour levels.
.SH SYNOPSIS
CALL CPPKLB (ZDAT, RWRK, IWRK)
.SH C-BINDING SYNOPSIS
#include <ncarg/ncargC.h>
.sp
void c_cppklb (float *zdat, float *rwrk, int *iwrk)
.SH DESCRIPTION 
All three arguments are arrays used in the last call to 
CPRECT, CPSPS1, or CPSPS2, the contents of which must not 
have been changed since that call.
.IP ZDAT 12
(REAL array, dimensioned as specified in the last call 
to CPRECT, CPSPS1, or CPSPS2, input) is the data array.
.IP RWRK 12
(REAL array, dimensioned as specified in the last call 
to CPRECT, CPSPS1, or CPSPS2, input/output) is the real 
workspace array.
.IP IWRK 12
(INTEGER array, dimensioned as specified in the last 
call to CPRECT, CPSPS1, or CPSPS2, input/output) is the 
integer workspace array.
.SH C-BINDING DESCRIPTION
The C-binding argument descriptions are the same as the FORTRAN
argument descriptions.
.SH USAGE@@@
Normally, CPPKLB is called by Conpack when labels for the
contour levels are needed.  You can call CPPKLB directly (after
the initialization call to CPRECT, CPSPS1 or CPSPS2) when you
want to modify the resulting parameter arrays that specify the
labels.
.sp
If the constant-field-flag 'CFF' is non-zero, indicating that
on the last call to CPRECT, CPSPS1 or CPSPS2 the data were
found to be essentially constant, CPPKLB does nothing.
Otherwise, CPPKLB examines the first  'NCL' elements of the
parameter array 'CLV', which defines the contour levels, and
the associated parameter arrays, looking for levels that are to
be labeled ('CLU' = 2 or 3) for which no label is  specified
('LLT' = ' ').  (The value of 'LLT' is a single blank.) If any
such levels are found, labels are generated for them.
.sp
The scale factor 'SFU' may be set as a byproduct of choosing
the labels.  See the description of the parameters 'SFU' (scale
factor used) and 'SFS' (scale factor selector) in the 
conpack_params man page. After calling CPPKLB, a user
program may examine the generated labels and change them in
various ways.
.SH ACCESS
To use CPPKLB, load the NCAR Graphics libraries ncarg,
ncarg_gks, and ncarg_loc, preferably in that order.  To use c_cppklb, 
load the NCAR Graphics libraries ncargC, ncarg_gksC, ncarg,
ncarg_gks, and ncarg_loc, preferably in that order.
.SH MESSAGES
See the conpack man page for a description of all Conpack error
messages and/or informational messages.
.SH SEE ALSO
Online:
conpack,
cpback, cpchcf, cpchcl, cpchhl, cpchil, cpchll, cpcica, cpclam, cpcldm,
cpcldr, cpcltr, cpcnrc, cpdrpl, cpezct, cpgetc, cpgeti, cpgetr, cplbam,
cplbdr, cpmpxy, cppkcl, cprect, cprset, cpscae, cpsetc, cpseti,
cpsetr, cpsps1, cpsps2, ncarg_cbind
.sp
Hardcopy:
Tutorial: A Step-by-Step Guide to Contouring and Mapping
.SH COPYRIGHT
Copyright 1987, 1988, 1989, 1991, 1993 University Corporation
for Atmospheric Research
.br
All Rights Reserved

