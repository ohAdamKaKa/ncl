C
C $Id: mlfndp.f,v 1.1 1999-04-19 22:09:49 kennison Exp $
C
      DOUBLE PRECISION FUNCTION MLFNDP (E0,E1,E2,E3,PHI)
C
C This function computes the constant M.
C
      IMPLICIT DOUBLE PRECISION (A-Z)
      DATA TWO,FOUR,SIX /2.0D0,4.0D0,6.0D0/
C
      MLFNDP = E0 * PHI - E1 * SIN (TWO * PHI) + E2 * SIN (FOUR * PHI)
     * - E3 * SIN (SIX * PHI)
C
      RETURN
      END
