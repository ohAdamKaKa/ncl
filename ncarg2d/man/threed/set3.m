.\"
.\"	$Id: set3.m,v 1.1 1993-03-11 16:34:52 haley Exp $
.\"
.TH SET3 3NCARG "March 1993" UNIX "NCAR GRAPHICS"
.SH NAME
SET3 - Set up 3D equivalents of viewport and window, as well as
perspective angle.
.SH SYNOPSIS
CALL SET3 (XA,XB,YA,YB,UC,UD,VC,VD,WC,WD,EYE)
.SH C-BINDING SYNOPSIS
#include <ncarg/ncargC.h>
.sp
void c_set3 (float xa, float xb, float ya, float yb, float uc, float ud, float vc, float vd, float wc, float wd, float eye[3])
.SH DESCRIPTION 
.IP "XA, XB, YA, YB" 12
define the portion of the plotting surface into
which the user's plot will be placed. These values
should be in the range 0. to 1. For example, if one
wants the plot to occupy the maximum plotting surface,
set XA=0., YA=0., XB=1., YB=1.; if one wants the plot
to appear in the lower left corner of the plotting
surface, set XA=0., YA=0., XB=.5, YB=.5 .
.sp
UC, UD, VC, VD, WC, and WD define a volume in user coordinate
space which will be transformed onto the plotting
surface defined by XA, XB, YA, YB.
.IP EYE 12
is an array, 3 words long, containing the U, V, and W
coordinates of the EYE position. All lines in the plot
are drawn as viewed from the EYE. EYE is specified in
user coordinates and should be outside the box defined
by UC, UD, VC, VD, WC, and WD.
.SH C-BINDING DESCRIPTION
The C-binding argument descriptions are the same as the Fortran 
argument descriptions.
.SH USAGE
SET3 should be called before calling other THREED routines.
.SH ACCESS
To use SET3 load the NCAR Graphics libraries ncarg, ncarg_gks,
and ncarg_loc, preferably in that order.  To use c_set3 load 
the NCAR Graphics libraries ncargC, ncarg_gksC, ncarg, ncarg_gks,
and ncarg_loc, preferably in that order.
.SH SEE ALSO
Online:
curve3 fence3 frst3 line3 perim3 point3 set3 threed
tick43 vect3 ncarg_cbind
.sp
Hardcopy:  "NCAR Graphics User's Guide, Version 2.00"
.SH COPYRIGHT
(c) Copyright 1987, 1988, 1989, 1991, 1993 University Corporation
for Atmospheric Research
.br
All Rights Reserved
