.TH MAPUSR 3NCARG "March 1993" UNIX "NCAR GRAPHICS"
.na
.nh
.SH NAME
MAPUSR - Called by Ezmap routines that draw the various parts of the map.
The default version does nothing.  A user-written version may be supplied
to change the appearance of the map.
.SH SYNOPSIS
CALL MAPUSR (IPRT)
.SH C-BINDING SYNOPSIS
#include <ncarg/ncargC.h>
.sp
void mapusr (int iprt)
.SH DESCRIPTION 
.IP IPRT 12
(input expression, of type INTEGER), if positive, says that a
particular part of the map is about to be drawn, as follows:
.RS 16 
.IP IPRT 6
Part of map about to be drawn
.IP "1" 6
Perimeter.
.IP "2" 6 
Grid.
.IP "3" 6 
Labels.
.IP "4" 6
Limb lines.
.IP "5" 6
Continental outlines.
.IP "6" 6
U.S. state outlines.
.IP "7" 6
International outlines.
.RE
.IP "" 12
If IPRT is negative, then the drawing of the last
part is complete. The absolute value of IPRT will be
one of the above values. Changed quantities should be
restored.
.SH C-BINDING DESCRIPTION 
The C-binding argument description is the same as the FORTRAN 
argument description.
.SH USAGE
Ezmap executes the statement
.sp
.RS 4
CALL MAPUSR (IPRT)
.RE
.sp
just before and just after each portion of a map is drawn. The default
version of MAPUSR does nothing.
.sp
A user-supplied version of MAPUSR may set/reset the dotting parameter
\&'DL', the DASHCHAR dash pattern, the color index, etc., so as to achieve
a desired effect.
.SH EXAMPLES
Use the ncargex command to see the following relevant
example: 
mpex08.
.SH ACCESS
To use MAPUSR, load the NCAR Graphics libraries ncarg, ncarg_gks,
and ncarg_loc, preferably in that order.  To use the mapusr C-binding,
load the NCAR Graphics libraries ncargC, ncarg_gksC, ncarg, ncarg_gks, 
and ncarg_loc, preferably in that order.
.SH SEE ALSO
Online:
ezmap,
ezmap_params,
mapaci,
mapbla,
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
.SH COPYRIGHT
Copyright 1987, 1988, 1989, 1991, 1993 University Corporation for
Atmospheric Research
.br
All Rights Reserved
