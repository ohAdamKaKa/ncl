C
C $Id: e2fndp.f,v 1.1 1999-04-19 22:09:43 kennison Exp $
C
      DOUBLE PRECISION FUNCTION E2FNDP (ECCNTS)
C
C This function computes the constant E2.
C
      IMPLICIT DOUBLE PRECISION (A-Z)
      DATA CON1,CON2 /0.05859375D0,0.75D0/
      DATA ONE /1.0D0/
C
      E2FNDP = CON1 * ECCNTS * ECCNTS * (ONE + CON2 * ECCNTS)
C
      RETURN
      END
