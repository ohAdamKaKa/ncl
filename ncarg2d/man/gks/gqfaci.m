.\"
.\"	$Id: gqfaci.m,v 1.1 1993-03-11 16:22:48 haley Exp $
.\"
.TH GQFACI 3NCARG "March 1993" UNIX "NCAR GRAPHICS"
.SH NAME
GQFACI (Inquire fill area color index) - retrieves the current fill
area color index.
.SH SYNOPSIS
CALL GQFACI (ERRIND, COLI)
.SH DESCRIPTION
.IP ERRIND 12
(Integer, Output) - If the inquired value cannot be returned correctly,
a non-zero error indicator is returned in ERRIND, otherwise a zero is returned.
Consult "User's Guide for NCAR GKS-0A Graphics" for a description of the
meaning of the error indicators.
.IP COLI 12
(Integer, Output) - Returns the current fill area color index as set by
default or by a call to GSFACI.
.SH ACCESS
To use GKS routines, load the NCAR GKS-0A library 
ncarg_gks.
.SH SEE ALSO
Online: 
gfa, gsfais, gsfasi, gscr, gsfaci, gqfais, gqfasi, 
areas
.sp
Hardcopy: 
"User's Guide for NCAR GKS-0A Graphics"
.SH COPYRIGHT
(c) Copyright 1987, 1988, 1989, 1991, 1993 University Corporation
for Atmospheric Research
.br
All Rights Reserved
