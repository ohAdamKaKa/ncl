.\"
.\"	$Id: gqlwsc.m,v 1.1 1993-03-11 16:22:58 haley Exp $
.\"
.TH GQLWSC 3NCARG "March 1993" UNIX "NCAR GRAPHICS"
.SH NAME
GQLWSC (Inquire linewidth scale factor) - retrieves the current setting of the
linewidth scale factor.
.SH SYNOPSIS
CALL GQLWSC (ERRIND, LWIDTH)
.SH DESCRIPTION
.IP ERRIND 12
(Integer, Output) - If the inquired value cannot be returned correctly,
a non-zero error indicator is returned in ERRIND, otherwise a zero is returned.
Consult "User's Guide for NCAR GKS-0A Graphics" for a description of the
meaning of the error indicators.
.IP LWIDTH 12
(Real, Output) - Returns the current value of the linewidth scale factor
as set by default or by a call to GSLWSC.
.SH ACCESS
To use GKS routines, load the NCAR GKS-0A library ncarg_gks.
.SH SEE ALSO
Online: 
gpl, gsln, gslwsc, gscr, gsplci, gqln, gqplci, dashline
.sp
Hardcopy: 
"User's Guide for NCAR GKS-0A Graphics"
.SH COPYRIGHT
(c) Copyright 1987, 1988, 1989, 1991, 1993 University Corporation
for Atmospheric Research
.br
All Rights Reserved
