/*
 *      $Id: nclstateP.h,v 1.1 1996-10-10 18:55:26 boote Exp $
 */
/************************************************************************
*									*
*			     Copyright (C)  1996			*
*	     University Corporation for Atmospheric Research		*
*			     All Rights Reserved			*
*									*
************************************************************************/
/*
 *	File:		nclstateP.h
 *
 *	Author:		Jeff W. Boote
 *			National Center for Atmospheric Research
 *			PO 3000, Boulder, Colorado
 *
 *	Date:		Fri Aug 30 10:58:46 MDT 1996
 *
 *	Description:	
 */
#ifndef	_NG_NCLSTATEP_H_
#define	_NG_NCLSTATEP_H_

#include <ncarg/hlu/BaseP.h>
#include <ncarg/hlu/Callbacks.h>

#include <ncarg/ngo/ngoP.h>
#include <ncarg/ngo/nclstate.h>

typedef struct _NgNclStateClassRec *NgNclStateClass;
typedef struct _NgNclStateRec *NgNclState;

typedef struct _NgNclStatePart {
/* required fields */
	int		appmgr;

/* submission state */
	NhlBoolean	istate;
	NhlBoolean	defining_proc;
	NhlBoolean	err;
	int		line;

	/*
	 * Ncl Event Queue
	 */
	NhlBoolean	obj_pending;

	NgNclObj	hluobj_pending;
	NgNclObj	hluvar_pending;
	NgNclObj	var_pending;
	NgNclObj	filevar_pending;

	NhlBoolean	func_pending;


	/*
	 * Current Ncl State
	 */
	NgNclObj	hluobj_tree;
	NgNclObj	hluvar_tree;
	NgNclObj	var_tree;
	NgNclObj	filevar_tree;

	NgNclObj	func_tree;

	_NhlCBList	object;
	_NhlCBList	outputcb;
	_NhlCBList	erroutputcb;
	_NhlCBList	submitcb;
	_NhlCBList	promptcb;
	_NhlCBList	resetcb;

	_NhlCB		appdestroy_cb;

} NgNclStatePart;

typedef struct _NgNclStateRec {
	NhlObjLayerPart	base;
	NgNclStatePart	nclstate;
} NgNclStateRec;

typedef struct _NgNclStateClassPart {
	int		num;
} NgNclStateClassPart;

typedef struct _NgNclStateClassRec {
	NhlObjClassPart		base_class;
	NgNclStateClassPart	nclstate_class;
} NgNclStateClassRec;

extern NgNclStateClassRec	NgnclStateClassRec;

#endif	/* _NG_NCLSTATEP_H_ */
