      PROGRAM FAGOVRVW
C
C  Define error file, Fortran unit number, and workstation type,
C  and workstation ID.
C
      PARAMETER (IERRF=6, LUNIT=2, IWTYPE=1, IWKID=1)
      PARAMETER (NPTS=200)
      PARAMETER (NCURVE=4)
      REAL YDRA(NPTS,NCURVE),XDRA(NPTS)

      DO 10 I=1,NPTS
        XDRA(I  )=I*0.1
        DO 10 J=1,NCURVE
            YDRA(I,J)=SIN(XDRA(I)+0.2*J)*EXP(-0.01*XDRA(I)*J**2)
  10  CONTINUE

C
C  Open GKS, open and activate a workstation.
C
      CALL GOPKS (IERRF, ISZDM)
      CALL GOPWK (IWKID, LUNIT, IWTYPE)
      CALL GACWK (IWKID)

      CALL DEFCLR (IWKID)

      CALL AGSETF('DASH/SELECTOR.',-1.0)

      CALL AGSETC('LABEL/NAME.','B')
      CALL AGSETI('LINE/NUMBER.',-100)
      CALL AGSETC('LINE/TEXT.','TIME (SECONDS)$')

      CALL AGSETC('LABEL/NAME.','L')
      CALL AGSETI('LINE/NUMBER.',100)
      CALL AGSETC('LINE/TEXT.','POSITION (METERS)$')

      CALL AGSETF('Y/MINIMUM.',-1.4)
      CALL AGSETF('Y/MAXIMUM.', 1.4)
      CALL AGSETF('Y/NICE.',    0.0)

      CALL EZMXY (XDRA,YDRA,NPTS,NCURVE,NPTS,'X-Y PLOT CAPABILITIES$')

C
C  Deactivate and close the workstation, close GKS.
C
      CALL GDAWK (IWKID)
      CALL GCLWK (IWKID)
      CALL GCLKS

      STOP
      END

      SUBROUTINE DEFCLR (IWKID)
      CALL GSCR(IWKID, 0, 0.0, 0.0, 0.0)
      CALL GSCR(IWKID, 1, 1.0, 1.0, 1.0)
      CALL GSCR(IWKID, 2, 1.0, 0.0, 0.0)
      CALL GSCR(IWKID, 3, 0.0, 1.0, 0.0)
      CALL GSCR(IWKID, 4, 0.4, 0.7, 0.9)
      CALL GSCR(IWKID, 5, 0.7, 0.4, 0.7)
      CALL GSCR(IWKID, 6, 0.9, 0.7, 0.4)
      CALL GSCR(IWKID, 7, 0.4, 0.9, 0.7)
      RETURN
      END

      SUBROUTINE AGCHAX(IFLG,IAXS,IPRT,VILS)
      CALL PLOTIF (0.,0.,2)
      IF (IFLG .EQ. 0) THEN
        CALL GSPLCI( 2 )
        CALL GSTXCI( 3 )
      ELSE
        CALL GSPLCI(1)
        CALL GSTXCI(1)
      ENDIF
      RETURN
      END

      SUBROUTINE AGCHCU(IFLG,KDSH)
      CALL PLOTIF (0.,0.,2)
      IF (IFLG .EQ. 0) THEN
         CALL GSPLCI( ABS(KDSH)+3 )
         CALL GSTXCI( ABS(KDSH)+3 )
      ELSE
         CALL GSPLCI(1)
         CALL GSTXCI(1)
      ENDIF
      RETURN
      END

      SUBROUTINE AGCHIL(IFLG,LBNM,LNNO)
      CALL PLOTIF (0.,0.,2)
      IF (IFLG .EQ. 0) THEN
         CALL GSTXCI( 4 )
      ELSE
         CALL GSTXCI( 1 )
      ENDIF
      RETURN
      END

