C
C	$Id: cmpsup.f,v 1.1 1992-09-29 16:10:20 ncargd Exp $
C
	PROGRAM CMPSUP

	REAL PLIM1(2),PLIM2(2),PLIM3(2),PLIM4(2)
	DATA PLIM1 /0.0, 0.0/
	DATA PLIM2 /0.0, 0.0/
	DATA PLIM3 /0.0, 0.0/
	DATA PLIM4 /0.0, 0.0/

	CALL OPNGKS
	CALL SUPMAP(7,0.,0.,0.,PLIM1,PLIM2,PLIM3,PLIM4,1,5,0,0,IERR)
	CALL FRAME
	CALL CLSGKS

	STOP
	END
