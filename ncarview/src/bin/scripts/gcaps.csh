#!/bin/csh -f
#
#	$Id: gcaps.csh,v 1.4 1992-02-14 12:56:13 clyne Exp $
#
#
#	Name		gcaps
#
#	Author		John Clyne
#
#	Date		Wed Jun 27 13:23:39 MDT 1990
#
#	Desc.		Report all the graphcaps installed in the graphcap 
#			directory.
# 

set version = VERSION
set dir = `ncargpar GRAPHCAPDIR`
if ($status != 0) then
	exit 1
endif

foreach arg ($argv)
	switch ($arg)
	case "-V"
		echo "${0}: Version $version"
		exit 0
	default:
		echo "Usage: $0 [-V]"
		exit 1
	endsw
end

if (! -d "$dir") then
  echo "Graphcap directory <$dir> does not exist."
  exit 1
endif

cd $dir
echo "The following graphcaps are installed in ${dir}:"
foreach gcap ("" *)
	echo "	$gcap"
end

echo ""
echo "The following device specifiers are also valid:"
foreach device ("" DEVICES)
	echo "	$device"
end
