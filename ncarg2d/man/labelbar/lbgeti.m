.TH LBGETI 3NCARG "March 1993" UNIX "NCAR GRAPHICS"
.na
.nh
.SH NAME
LBGETI - Retrieves the current value of internal parameters
of type INTEGER in Labelbar.
.SH SYNOPSIS
CALL LBGETI (PNAM, IVAL)
.SH C-BINDING SYNOPSIS
#include <ncarg/ncargC.h>
.sp
void c_lbgeti (char *pnam, int *ival)
.SH DESCRIPTION 
.IP PNAM 12
(an input expression of type CHARACTER) is a string three or 
more characters in length, beginning with one of the six 
character strings 'CBL', 'CFL', 'CLB', 'WBL', 'WFL', or 'WLB'.
.IP IVAL 12
(an output variable of type INTEGER) is the name of a variable 
into which the value of the parameter specified by PNAM is 
to be retrieved.
.SH C-BINDING DESCRIPTION
The C-binding argument descriptions are the same as the FORTRAN 
argument descriptions.
.SH USAGE
This routine allows you to retrieve the current value of
Labelbar parameters. For a complete list of parameters available
in this utility, see the labelbar_params man page.
.SH ACCESS
To use LBGETI, load the NCAR Graphics libraries ncarg, ncarg_gks,
and ncarg_loc, preferably in that order.  To use c_lbgeti, load 
the NCAR Graphics libraries ncargC, ncarg_gksC, ncarg, ncarg_gks,
and ncarg_loc, preferably in that order.
.SH MESSAGES
See the labelbar man page for a description of all Labelbar error
messages and/or informational messages.
.SH SEE ALSO
Online:
labelbar, labelbar_params, lbfill, lbgetr, lblbar, lbseti, lbsetr,
ncarg_cbind
.SH COPYRIGHT
Copyright 1987, 1988, 1989, 1991, 1993 University Corporation
for Atmospheric Research
.br
All Rights Reserved
