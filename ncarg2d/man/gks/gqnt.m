.\"
.\"	$Id: gqnt.m,v 1.1 1993-03-11 16:23:08 haley Exp $
.\"
.TH GQNT 3NCARG "March 1993" UNIX "NCAR GRAPHICS"
.SH NAME
GQNT (Inquire normalization transformation) - retrieves the 
window and viewport associated with a given normalization transformation. 
Users of NCAR Graphics are encouraged to use the SPPS routines SET
and GETSET to handle normalization transformations instead of the
GKS entries GSWN, GSVP, GSELNT, and GQNT.
.SH SYNOPSIS
CALL GQNT (NTNR, ERRIND, WINDOW, VIEWPT)
.SH DESCRIPTION
.IP NTNR 12
(Integer, Input) - Gives the number of the normalization transformation.
.IP ERRIND 12
(Integer, Output) - If the inquired value cannot be returned correctly,
a non-zero error indicator is returned in ERRIND, otherwise a zero is returned.
Consult "User's Guide for NCAR GKS-0A Graphics" for a description of the
meaning of the error indicators.
.IP "WINDOW(4)" 12
(Real Array, Output) - The world coordinate window limits in the order
WXMIN, WXMAX, WYMIN, WYMAX.
.IP "VIEWPT(4)" 12
(Real Array, Output) - The normalized device coordinate viewport limits
in the order
VXMIN, VXMAX, VYMIN, VYMAX.
.SH ACCESS
To use GKS routines, load the NCAR GKS-0A library ncarg-gks.
.SH SEE ALSO
Online:
gswn, gsvp, gselnt, gqcntn, gqmntn, getset, gsclip, gqclip
.sp
Hardcopy:
"User's Guide for NCAR GKS-0A Graphics"
.SH COPYRIGHT
(c) Copyright 1987, 1988, 1989, 1991, 1993 University Corporation
for Atmospheric Research
.br

