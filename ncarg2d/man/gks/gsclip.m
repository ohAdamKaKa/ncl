.\"
.\"	$Id: gsclip.m,v 1.1 1993-03-11 16:23:46 haley Exp $
.\"
.TH GSCLIP 3NCARG "March 1993" UNIX "NCAR GRAPHICS"
.SH NAME
GSCLIP (Set clipping indicator) - controls whether data are
displayed outside the boundaries of the world coordinate window
of the current normalization transformation.
.SH SYNOPSIS
CALL GSCLIP (ICLIP)
.SH DESCRIPTION
.IP ICLIP 12
(Integer, Input) - A flag to turn clipping on or off.
.RS
.IP 0 
Clipping is off. Data outside of the window will be plotted.
.IP 1 
Clipping is on. Data outside of the window will not be  plotted.
This is the default.
.RE
.SH USAGE
If the clipping indicator is off, 
and you make GKS output calls to plot world coordinate 
data outside your defined world coordinate window (and 
your viewport is smaller than the full plotting 
surface), those data will appear with your plot. If 
the clipping indicator is on, the data will be clipped 
to fit your window.
.SH ACCESS
To use GKS routines, load the NCAR GKS-0A library 
ncarg_gks.
.SH SEE ALSO
Online: 
set, gsup, gswn, gselnt, gqclip
.sp
Hardcopy: 
"User's Guide for NCAR GKS-0A Graphics"
.SH COPYRIGHT
(c) Copyright 1987, 1988, 1989, 1991, 1993 University Corporation
for Atmospheric Research
.br
All Rights Reserved
