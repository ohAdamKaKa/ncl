/*
 *      $Id: goP.h,v 1.2 1996-10-16 16:21:18 boote Exp $
 */
/************************************************************************
*									*
*			     Copyright (C)  1996			*
*	     University Corporation for Atmospheric Research		*
*			     All Rights Reserved			*
*									*
************************************************************************/
/*
 *	File:		goP.h
 *
 *	Author:		Jeff W. Boote
 *			National Center for Atmospheric Research
 *			PO 3000, Boulder, Colorado
 *
 *	Date:		Thu Sep 19 13:35:57 MDT 1996
 *
 *	Description:	
 */
#ifndef	_NG_GOP_H_
#define	_NG_GOP_H_

#include <ncarg/hlu/BaseP.h>

#include <ncarg/ngo/ngoP.h>
#include <ncarg/ngo/go.h>

#include <ncarg/ngo/xapp.h>

typedef struct _NgGOClassRec *NgGOClass;
typedef struct _NgGORec *NgGO;

typedef struct _NgGOPart {
/* resources */
	NhlString	title;
	NhlBoolean	sensitive;

/* private fields */
	int		appmgr;

	NhlBoolean	x_sensitive;
	NhlBoolean	i_sensitive;
	_NhlCB		appdestroy_cb;

	NgXAppExport	x;

	Window		iowin;

	NhlBoolean	subshell;
	NhlBoolean	pup;
	Widget		pshell;

	NhlBoolean	up;
	Widget		shell;
	Widget		manager;	/* subclasses must use this container */

	XtTranslations	global_trans;

} NgGOPart;

typedef struct _NgGORec {
	NhlObjLayerPart	base;
	NgGOPart	go;
} NgGORec;

typedef NhlBoolean (*_NgGOFunc)(
	NgGO	go
);

typedef struct _NgGOClassPart {
	/*
	 * These three widgetclasses are settable in sub-classes in
	 * their ClassPartInitialize procedure.  The following defaults
	 * are set by the go class.  The first two must be sub-classes
	 * of the vendorShellWidget, and the manager must be a subclass
	 * of xmManager.  These constraints are not checked, but the
	 * go class will set resources to the objects as if it were one
	 * of these.
	 */
	WidgetClass	dialog;		/* transientShellWidgetClass	*/
	WidgetClass	toplevel;	/* applicationShellWidgetClass	*/
	WidgetClass	manager;	/* xmFormWidgetClass		*/

	NhlBoolean	top_win_chain;
	_NgGOFunc	create_win;		/* D chained	*/
	_NgGOFunc	create_win_hook;	/* U chained	*/

} NgGOClassPart;

typedef struct _NgGOClassRec {
	NhlObjClassPart		base_class;
	NgGOClassPart		go_class;
} NgGOClassRec;

extern NgGOClassRec	NggOClassRec;

extern void _NgIGOSensitive(
	NgGO		go,
	NhlBoolean	sensitive
);

/*
 * Convenience functions to register a callback that will automatically
 * call NgGOPop{up,down}.  udata is goid.
 */
extern void _NgGOPopdownCB(
	Widget		w,
	XtPointer	udata,
	XtPointer	cbdata
);

extern void _NgGOPopdownCB(
	Widget		w,
	XtPointer	udata,
	XtPointer	cbdata
);

/*
 * Automatic action calling routines.  This callback should be registered
 * on all menu buttons that call the standard actions:
 *	closeWindow
 *	quitApplication
 *
 * The buttons must be given the same name as the action.  If you want to
 * send parameters to the action routine, that is done by setting the
 * udata parameter of the CB to a NULL terminated string array.
 */
extern void _NgGODefActionCB(
	Widget		w,
	XtPointer	udata,
	XtPointer	cbdata
);

#endif	/* _NG_GOP_H_ */
