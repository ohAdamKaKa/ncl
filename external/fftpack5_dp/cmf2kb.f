CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C
C   FFTPACK 5.0
C   Copyright (C) 1995-2004, Scientific Computing Division,
C   University Corporation for Atmospheric Research
C   Licensed under the GNU General Public License (GPL)
C
C   Authors:  Paul N. Swarztrauber and Richard A. Valent
C
C   $Id: cmf2kb.f,v 1.2 2006-11-21 01:10:16 haley Exp $
C
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

      SUBROUTINE DCMF2KB(LOT,IDO,L1,NA,CC,IM1,IN1,CH,IM2,IN2,WA)
      DOUBLE PRECISION CHOLD1
      DOUBLE PRECISION CHOLD2
      DOUBLE PRECISION TR2
      DOUBLE PRECISION TI2
      DOUBLE PRECISION CC(2,IN1,L1,IDO,2),CH(2,IN2,L1,2,IDO),WA(IDO,1,2)
C
      M1D = (LOT-1)*IM1 + 1
      M2S = 1 - IM2
      IF (IDO.GT.1 .OR. NA.EQ.1) GO TO 102
      DO 101 K = 1,L1
          DO 101 M1 = 1,M1D,IM1
              CHOLD1 = CC(1,M1,K,1,1) + CC(1,M1,K,1,2)
              CC(1,M1,K,1,2) = CC(1,M1,K,1,1) - CC(1,M1,K,1,2)
              CC(1,M1,K,1,1) = CHOLD1
              CHOLD2 = CC(2,M1,K,1,1) + CC(2,M1,K,1,2)
              CC(2,M1,K,1,2) = CC(2,M1,K,1,1) - CC(2,M1,K,1,2)
              CC(2,M1,K,1,1) = CHOLD2
  101 CONTINUE
      RETURN
  102 DO 103 K = 1,L1
          M2 = M2S
          DO 103 M1 = 1,M1D,IM1
              M2 = M2 + IM2
              CH(1,M2,K,1,1) = CC(1,M1,K,1,1) + CC(1,M1,K,1,2)
              CH(1,M2,K,2,1) = CC(1,M1,K,1,1) - CC(1,M1,K,1,2)
              CH(2,M2,K,1,1) = CC(2,M1,K,1,1) + CC(2,M1,K,1,2)
              CH(2,M2,K,2,1) = CC(2,M1,K,1,1) - CC(2,M1,K,1,2)
  103 CONTINUE
      IF (IDO.EQ.1) RETURN
      DO 105 I = 2,IDO
          DO 104 K = 1,L1
              M2 = M2S
              DO 104 M1 = 1,M1D,IM1
                  M2 = M2 + IM2
                  CH(1,M2,K,1,I) = CC(1,M1,K,I,1) + CC(1,M1,K,I,2)
                  TR2 = CC(1,M1,K,I,1) - CC(1,M1,K,I,2)
                  CH(2,M2,K,1,I) = CC(2,M1,K,I,1) + CC(2,M1,K,I,2)
                  TI2 = CC(2,M1,K,I,1) - CC(2,M1,K,I,2)
                  CH(2,M2,K,2,I) = WA(I,1,1)*TI2 + WA(I,1,2)*TR2
                  CH(1,M2,K,2,I) = WA(I,1,1)*TR2 - WA(I,1,2)*TI2
  104     CONTINUE
  105 CONTINUE
      RETURN
      END
