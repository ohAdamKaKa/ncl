.TH MAPEOD 3NCARG "March 1993" UNIX "NCAR GRAPHICS"
.na
.nh
.SH NAME
MAPEOD - Called by the Ezmap routines MAPLOT and MAPBLA.
The default version does nothing.  A user-written version may be supplied
to examine each outline-dataset segment and, perhaps, to delete selected
ones.
.SH SYNOPSIS
CALL MAPEOD (NOUT,NSEG,IDLS,IDRS,NPTS,PNTS)
.SH C-BINDING SYNOPSIS
#include <ncarg/ncargC.h>
.sp
void mapeod (int *nout, int *nseg, int *idls, int *idrs, \\
.br
int *npts, float *pnts)
.SH DESCRIPTION 
.IP NOUT 12
(an input expression of type INTEGER) is the number of the outline
dataset from which the segment comes, as follows:
.RS
.IP NOUT 8
Dataset from which the segment came
.IP 1 8 
CO - Continental outlines only.
.IP 2 8 
US - U.S. state outlines only.
.IP 3 8 
PS - Continental, U.S. state, and international
outlines.
.IP 4 8 
PO - Continental and international outlines.
.RE
.IP NSEG 12
(an input expression of type INTEGER) is the number of the segment
within the outline dataset. The maps in the example named "mpex09" show
segment numbers for the outline dataset 'CO'; the program may be modified
to produce maps showing segment numbers for any outline dataset.
.IP "IDLS and IDRS" 12
(input expressions of type INTEGER) are identifiers for the
areas to the left and right, respectively, of the segment. (Left and
right are defined from the standpoint of a viewer standing at point 1 of
the segment and looking toward point 2.) 
.IP NPTS 12
(an input/output variable of type INTEGER), on entry, is the number
of points defining the outline segment. NPTS may be zeroed by MAPEOD to
suppress plotting of the segment on the map.
.IP PNTS 12
(an input/output array, dimensioned 2*NPTS, of type REAL) is an
array of coordinates. PNTS(1) and PNTS(2) are the latitude and longitude
of the first point, PNTS(3) and PNTS(4) the latitude and longitude of the
second point, ... PNTS(2*NPTS-1) and PNTS(2*NPTS) the latitude and
longitude of the last point. All values are in degrees. Longitudes are
all between -180 and +180; no segment crosses the meridian at -180 (+180)
degrees.
.SH C-BINDING DESCRIPTION
The C-binding argument descriptions are the same as the FORTRAN 
argument descriptions.
.SH USAGE
MAPEOD is called by MAPLOT to examine each segment in an outline dataset
just before it is plotted and by MAPBLA to examine each segment in an
outline dataset just before it is added to an area map. The default
version of MAPEOD does nothing. A user-supplied version may cause
selected segments to be deleted (to reduce the clutter in northern
Canada, for example).
.SH EXAMPLES
Use the ncargex command to see the following relevant
examples: 
mpex03,
mpex05,
mpex09.
.SH ACCESS
To use MAPEOD, load the NCAR Graphics libraries ncarg, ncarg_gks,
and ncarg_loc, preferably in that order.  To use the C version of 
MAPEOD, load the NCAR Graphics libraries ncargC, ncarg_gksC, ncarg,
ncarg_gks, and ncarg_loc, preferably in that order.
.SH SEE ALSO
Online:
ezmap, 
ezmap_params, 
mapaci,
mapbla,
mapdrw,
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
mapiqm,
mapit,
mapita,
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
.PP
Hardcopy:  
Tutorial: A Step-by-Step Guide to Contouring and Mapping 
.SH COPYRIGHT
Copyright 1987, 1988, 1989, 1991, 1993 University Corporation
for Atmospheric Research
.br
All Rights Reserved
