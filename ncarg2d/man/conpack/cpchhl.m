.TH CPCHHL 3NCARG "March 1993" UNIX "NCAR GRAPHICS"
.na
.nh
.SH NAME
CPCHHL - 
Provides user control as high and low labels
are drawn.
.SH SYNOPSIS
CALL CPCHHL (IFLG)
.SH C-BINDING SYNOPSIS
#include <ncarg/ncargC.h>
.sp
void cpchhl (int *iflg)
.SH DESCRIPTION 
.IP IFLG 12
(INTEGER, input) is positive if an action is about to 
be taken, negative if an action has just been completed. 
The action in question is defined by the absolute value of 
IFLG, as follows:
.RS
.IP \(bu 4
The value 1 implies the determination of the size of the 
label for a high (by means of a call to PLCHHQ, in the 
package Plotchar, with ANGD = 360.).
.IP \(bu 4
The value 2 implies the filling of the box around the label 
for a high, which is done before the drawing of the label 
itself.
.IP \(bu 4
The value 3 implies the drawing of the label for a high (by 
means of a call to PLCHHQ, in the package Plotchar).
.IP \(bu 4
The value 4 implies the drawing of the box around the label 
for a high, which is done after the drawing of the label 
itself.
.IP \(bu 4
The value 5 implies the determination of the size of the 
label for a low (by means of a call to PLCHHQ, in the 
package Plotchar, with ANGD = 360.).
.IP \(bu 4
The value 6 implies the filling of the box around the label 
for a low, which is done before the drawing of the label 
itself.
.IP \(bu 4
The value 7 implies the drawing of the label for a low (by 
means of a call to PLCHHQ, in the package Plotchar).
.IP \(bu 4
The value 8 implies the drawing of the box around the label 
for a low, which is done after the drawing of the label 
itself.
.RE
.SH USAGE
The routine CPCHLL is not to be called by the user. It is
called several times by CPLBAM and/or CPLBDR while each
contour-line label is positioned and drawn. The default
version of CPCHLL does nothing. A user-supplied replacement
may change attributes such as color and line width (by
calling the SPPS routine SETUSV or the appropriate GKS
routines). The text of the label may be retrieved by means
of a "CALL CPGETC ('CTM',CVAL)". The text of the label may
be changed by means of a "CALL CPSETC ('CTM',CVAL)"; this
should only be done during a call with IFLG = 1 or 3 and,
if it is done for one of those values, it should be done
for the other.
.sp
When CPCHLL is called, the parameter 'PAI' will have been
set to the index of the appropriate contour level. Thus,
parameters associated with that level may easily be
retrieved by calls to CPGETx.
.SH ACCESS
To use CPCHHL, load the NCAR Graphics libraries ncarg, ncarg_gks,
and ncarg_loc, preferably in that order.  To use cpchhl from a C
program, load the NCAR Graphics libraries ncargC, ncarg_gksC, 
ncarg, ncarg_gks, and ncarg_loc, preferably in that order.
.SH SEE ALSO
Online: 
conpack, 
cpback, cpchcf, cpchcl, cpchil, cpchll, cpcica, cpclam, cpcldm,
cpcldr, cpcltr, cpcnrc, cpdrpl, cpezct, cpgetc, cpgeti, cpgetr, cplbam,
cplbdr, cpmpxy, cppkcl, cppklb, cprect, cprset, cpscae, cpsetc, cpseti,
cpsetr, cpsps1, cpsps2, ncarg_cbind
.SH COPYRIGHT
Copyright 1987, 1988, 1989, 1991, 1993 University Corporation
for Atmospheric Research
.br
All Rights Reserved

