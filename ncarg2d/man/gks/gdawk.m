.\"
.\"	$Id: gdawk.m,v 1.1 1993-03-11 16:22:01 haley Exp $
.\"
.TH GDAWK 3NCARG "March 1993" UNIX "NCAR GRAPHICS"
.SH NAME
GDAWK (Deactivate workstation) - deactivates a workstation.
.SH SYNOPSIS
CALL GDAWK (WKID)
.SH DESCRIPTION
.IP WKID 12
(Integer, Input) - A number identifying the workstation to be deactivated.
WKID must be the same as that used in some previous GACWK call.
.SH USAGE
The specified workstation is removed from the set of active
workstations.  GKS output primitives are not sent to workstations
that are not active.
.SH ACCESS
To use GKS routines, load the NCAR GKS-0A library 
ncarg_gks.
.SH SEE ALSO
Online: 
gopks, gopwk, gacwk, gclwk, gclks, opngks, 
clsgks
.sp
Hardcopy: 
"User's Guide for NCAR GKS-0A Graphics"
.SH COPYRIGHT
(c) Copyright 1987, 1988, 1989, 1991, 1993 University Corporation
for Atmospheric Research
.br
All Rights Reserved
