.TH MAPLMB 3NCARG "March 1993" UNIX "NCAR GRAPHICS"
.na
.nh
.SH NAME
MAPLMB - Draws a limb line.
.SH SYNOPSIS
CALL MAPLMB
.SH C-BINDING SYNOPSIS
#include <ncarg/ncargC.h>
.sp
void c_maplmb()
.SH DESCRIPTION 
In many filled or masked maps, you may need a limb line.
You can draw a limb line by calling MAPLMB.
.SH EXAMPLES
Use the ncargex command to see the following relevant
example: 
mpex07.
.SH ACCESS
To use MAPLMB, load the NCAR Graphics libraries ncarg, ncarg_gks,
and ncarg_c, preferably in that order.  To use c_maplmb, load the 
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
maptra,
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
NCAR Graphics Contouring and Mapping Tutorial; 
.SH COPYRIGHT
Copyright (C) 1987-1996
.br
University Corporation for Atmospheric Research
.br
The use of this Software is governed by a License Agreement.
