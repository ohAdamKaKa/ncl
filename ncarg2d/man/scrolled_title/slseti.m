.\"
.\"	$Id: slseti.m,v 1.1 1993-03-11 16:30:14 haley Exp $
.\"
.TH SLSETI 3NCARG "March 1993" UNIX "NCAR GRAPHICS"
.SH NAME
SLSETI - sets integer valued parameters.
.SH SYNOPSIS
CALL SLSETI (PNAM, IVAL)
.SH C-BINDING SYNOPSIS
#include <ncarg/ncargC.h>
.sp
void c_slseti (char *pnam, int ival)
.SH DESCRIPTION 
.IP PNAM 12
The parameter name, of type character (for example,	'ALN').
.IP IVAL 12
The integer variable you set for the internal parameter.
.SH C-BINDING DESCRIPTION
The C-binding argument descriptions are the same as the Fortran 
argument descriptions.
.SH ACCESS
To use SLSETI load the NCAR Graphics libraries ncarg, ncarg_gks,
and ncarg_loc, preferably in that order.  To use c_slseti load 
the NCAR Graphics libraries ncarg, ncarg_gks,
and ncarg_loc, preferably in that order.
.SH SEE ALSO
Online: 
ftitle movies slgeti slgetr slseti slsetr stitle ncarg_cbind
.sp
Hardcopy:
"NCAR Graphics User's Guide, Version 2.00"
.SH COPYRIGHT
(c) Copyright 1987, 1988, 1989, 1991, 1993 University Corporation
for Atmospheric Research
.br
All Rights Reserved

