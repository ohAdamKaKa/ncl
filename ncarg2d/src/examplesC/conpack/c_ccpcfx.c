/*
 * $Id: c_ccpcfx.c,v 1.2 1994-06-21 14:59:06 haley Exp $
 */

#include <stdio.h>
#include <math.h>

#include <ncarg/ncargC.h>
#include <ncarg/gks.h>

#define   M   40
#define   N   40
#define   LRWK   3500
#define   LIWK   4000

#define WSTYPE SED_WSTYPE
#define WKID   1

main()
{
	float z[N][M], rwrk[LRWK];
	int icff, iwrk[LIWK];
	extern void getdat();

	getdat (z, N, M);
/*
 * Open GKS
 */
	gopen_gks ("stdout",0);
	gopen_ws (WKID, NULL, WSTYPE);
	gactivate_ws(WKID);
	gset_clip_ind (GIND_NO_CLIP);
/*
 * Initialize Conpack
 */
	c_cpsetr("CFX - CONSTANT FIELD LABEL X",0.);
	c_cpsetr("CFY - CONSTANT FIELD LABEL Y",1.);
	c_cpseti("CFP - CONSTANT FIELD POSITION FLAG",2);
	c_cprect((float *)z, M, M, N, rwrk, LRWK, iwrk, LIWK);
/*
 * Draw Perimeter
 */
	c_cpback((float *)z, rwrk, iwrk);
/*
 * Draw Contours
 */
	c_cplbdr((float *)z,rwrk,iwrk);
	c_cpcldr((float *)z,rwrk,iwrk);
/*
 * Close frame and close GKS
 */
	c_frame();
	gdeactivate_ws(WKID);
	gclose_ws(WKID);
	gclose_gks();
}
void getdat (z, m, n)
float *z;
int m, n;
{
	int i;
	for( i = 0; i < n*m; i++ ) {
		z[i] = 13.0;
	}
	return;
}

