.TH MAPTRA 3NCARG "March 1993" UNIX "NCAR GRAPHICS"
.na
.nh
.SH NAME
MAPTRA - Projects points.
.SH SYNOPSIS
CALL MAPTRA (RLAT,RLON,UVAL,VVAL)
.SH C-BINDING SYNOPSIS
#include <ncarg/ncargC.h>
.sp
void c_maptra (float rlat, float rlon, float *uval, 
.br
float *vval)
.SH DESCRIPTION 
.IP "RLAT and RLON" 12
(input expressions, of type REAL) are the latitude and
longitude, respectively, of a point on the globe. RLAT must be
between -90. and +90., inclusive; RLON must be between -540. and +540.,
inclusive.
.IP "UVAL and VVAL" 12
(output variables, of type REAL) define the point
(UVAL,VVAL) that is the projection in the u/v plane of (RLAT,RLON). The
units of UVAL and VVAL depend on the projection.
.sp
If the point is not projectable or if it is outside the boundary of the
map (as defined by the last call to MAPSET and by the value of the
parameter 'EL'), UVAL is returned equal to 1.E12.
.SH C-BINDING DESCRIPTION 
The C-binding argument descriptions are the same as the FORTRAN 
argument descriptions.
.SH EXAMPLES
Use the ncargex command to see the following relevant
examples: 
ccpmpxy,
cmptra,
fgkgtx,
fngngdts.
.SH ACCESS
To use MAPTRA, load the NCAR Graphics libraries ncarg, ncarg_gks,
and ncarg_c, preferably in that order.  To use c_maptra, load the 
NCAR Graphics libraries ncargC, ncarg_gksC, ncarg, ncarg_gks, and 
ncarg_c, preferably in that order.
.SH SEE ALSO
Online:
ezmap,
ezmap_params,
mapaci,
mapbla,
mapblm,
mapdrw,
mapeod,
mapfst,
mapgci,
mapgrd,
mapgrm,
mapgtc,
mapgti,
mapgtl,
mapgtr,
mapint,
mapiq,
mapiqa,
mapiqd,
mapiqm,
mapit,
mapita,
mapitd,
mapitm,
maplbl,
maplmb,
maplot,
mappos,
maproj,
maprs,
maprst,
mapsav,
mapset,
mapstc,
mapsti,
mapstl,
mapstr,
maptri,
maptrn,
mapusr,
mapvec,
mpgetc,
mpgeti,
mpgetl,
mpgetr,
mpsetc,
mpseti,
mpsetl,
mpsetr,
supmap,
supcon,
ncarg_cbind
.sp
Hardcopy:
NCAR Graphics Contouring and Mapping Tutorial
.SH COPYRIGHT
Copyright (C) 1987-1996
.br
University Corporation for Atmospheric Research
.br
The use of this Software is governed by a License Agreement.
