.\"
.\"     $Id: nngeti.m,v 1.2 1997-05-06 23:37:53 fred Exp $
.\"
.TH NNGETI 3NCARG "March 1997" UNIX "NCAR GRAPHICS"
.na
.nh
.SH NAME
NNGETI - Retrieves the value of an internal parameter of type
INTEGER.
.SH SYNOPSIS
CALL NNGETI (PNAM,IVAL)
.SH DESCRIPTION 
.IP PNAM 12
A character string that specifies the name of the
parameter to get. The name must appear as the first three
characters of the string.
.IP IVAL 12
An INTEGER variable that is the name of the variable
into which the value of the internal parameter specified by PNAM
is to be retrieved.
.SH USAGE
This routine allows you to retrieve the current value of
Natgrid parameters.  For a complete list of parameters available
in this utility, see the natgrid_params man page.
.SH ACCESS
To use NNGETI, load the NCAR Graphics library ngmath.
.SH SEE ALSO
natgrid,
natgrid_params,
natgrids,
nnseti.
.sp
Complete documentation for Natgrid is available at URL
.br
http://ngwww.ucar.edu/ngdoc/ng/ngmath/natgrid/nnhome.html
.SH COPYRIGHT
Copyright (C) 1997
.br
University Corporation for Atmospheric Research
.br
The use of this Software is governed by a License Agreement.
