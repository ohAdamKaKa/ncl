C
C $Id: pj10sp.f,v 1.1 1999-04-19 22:10:19 kennison Exp $
C
      SUBROUTINE PJ10SP (COORD,CRDIO,INDIC)
C
C -- S T E R E O G R A P H I C
C
      IMPLICIT REAL (A-Z)
      INTEGER INDIC
      DIMENSION GEOG(2),PROJ(2),COORD(2),CRDIO(2)
C **** PARAMETERS **** A,LON0,LAT0,X0,Y0,SINPH0,COSPH0 *****************
      COMMON /ERRMZ0/ IERR
        INTEGER IERR
      SAVE   /ERRMZ0/
      COMMON /PRINZ0/ IPEMSG,IPELUN,IPPARM,IPPLUN
        INTEGER IPEMSG,IPELUN,IPPARM,IPPLUN
      SAVE   /PRINZ0/
      COMMON /PC10SP/ A,LON0,X0,Y0,COSPH0,LAT0,SINPH0
      DATA HALFPI /1.5707963267948966E0/
      DATA EPSLN /1.0E-10/
      DATA ZERO,ONE,TWO /0.0E0,1.0E0,2.0E0/
C
C -- F O R W A R D   . . .
C
      IF (INDIC .EQ. 0) THEN
C
         GEOG(1) = COORD(1)
         GEOG(2) = COORD(2)
         IERR = 0
         LON = ADJLSP (GEOG(1) - LON0)
         SINPHI = SIN (GEOG(2))
         COSPHI = COS (GEOG(2))
         COSLON = COS (LON)
         G = SINPH0 * SINPHI + COSPH0 * COSPHI * COSLON
         IF (ABS(G + ONE) .GT. EPSLN) GO TO 140
         IF (IPEMSG .EQ. 0) WRITE (IPELUN,2020)
 2020    FORMAT (/' ERROR PJ10SP'/
     .            ' POINT PROJECTS INTO INFINITY')
         IERR = 103
         RETURN
  140    KSP = TWO / (ONE + G)
         PROJ(1) = X0 + A * KSP * COSPHI * SIN (LON)
         PROJ(2) = Y0 + A * KSP * (COSPH0 * SINPHI - SINPH0 * COSPHI *
     .             COSLON)
         CRDIO(1) = PROJ(1)
         CRDIO(2) = PROJ(2)
         RETURN
      END IF
C
C -- I N V E R S E   . . .
C
      IF (INDIC .EQ. 1) THEN
C
         PROJ(1) = COORD(1)
         PROJ(2) = COORD(2)
         IERR = 0
         X = PROJ(1) - X0
         Y = PROJ(2) - Y0
         RH = SQRT (X * X + Y * Y)
         Z = TWO * ATAN (RH / (TWO * A))
         SINZ = SIN (Z)
         COSZ = COS (Z)
         GEOG(1) = LON0
         IF (ABS(RH) .GT. EPSLN) GO TO 240
         GEOG(2) = LAT0
         CRDIO(1) = GEOG(1)
         CRDIO(2) = GEOG(2)
         RETURN
  240    GEOG(2) = ASINSP (COSZ * SINPH0 + Y * SINZ * COSPH0 / RH)
         CON = ABS (LAT0) - HALFPI
         IF (ABS (CON) .GT. EPSLN) GO TO 260
         IF (LAT0 .LT. ZERO) GO TO 250
         GEOG(1) = ADJLSP (LON0 + ATAN2 (X , -Y))
         CRDIO(1) = GEOG(1)
         CRDIO(2) = GEOG(2)
         RETURN
  250    GEOG(1) = ADJLSP (LON0 - ATAN2 (-X , Y))
         CRDIO(1) = GEOG(1)
         CRDIO(2) = GEOG(2)
         RETURN
  260    CON = COSZ - SINPH0 * SIN (GEOG(2))
         IF (ABS(CON).LT.EPSLN.AND.ABS(X).LT.EPSLN) RETURN
         GEOG(1) = ADJLSP (LON0 + ATAN2 ((X*SINZ*COSPH0) , (CON*RH)))
         CRDIO(1) = GEOG(1)
         CRDIO(2) = GEOG(2)
         RETURN
      END IF
C
      END
