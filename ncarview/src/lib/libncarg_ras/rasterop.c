#include <stdio.h>
#include "ncarg_ras.h"

static int	OptionCenter = True;

void	RasterCopy(src, dst, src_x, src_y, src_nx, src_ny)
	Raster	*src;
	Raster	*dst;
	int	src_x, src_y, src_nx, src_ny;
{
	int	x, y;
	int	r, g, b;
	int	x1, y1, x2, y2;

	x1 = src_x;
	y1 = src_y;
	x2 = src_x + src_nx - 1;
	y2 = src_y + src_ny - 1;

	if (src->type == RAS_INDEXED)
		RasterCopyColormap(src, dst);
	
	for(y=y1; y<=y2; y++)
	for(x=x1; x<=x2; x++)
	{
		if (src->type == RAS_DIRECT) {
			r = DIRECT_RED(src, x, y);
			g = DIRECT_GREEN(src, x, y);
			b = DIRECT_BLUE(src, x, y);
			DIRECT_RED(dst, x, y) = r;
			DIRECT_GREEN(dst, x, y) = g;
			DIRECT_BLUE(dst, x, y) = b;
		}
		else if (src->type == RAS_INDEXED) {
			INDEXED_PIXEL(dst, x, y) = INDEXED_PIXEL(src, x, y);
		}
	}
}

/* ARGSUSED */
void	RasterOp(src, dst, src_x, src_y, src_nx, src_ny, dst_x, dst_y, op)
	Raster	*src;
	Raster	*dst;
	int	src_x, src_y, src_nx, src_ny, dst_x, dst_y;
	int	op;
{
	int	r, g, b;
	int	sx, sy, dx, dy;
	int	sx1, sx2, sy1, sy2;

#ifdef DEAD
	if (src->type == RAS_INDEXED) {
		RasterCopyColormap(src, dst);
	}
#endif /* DEAD */

	sx1 = src_x;
	sx2 = src_x + src_nx - 1;
	sy1 = src_y;
	sy2 = src_y + src_ny - 1;
	
	for(sy=sy1, dy=dst_y; sy<=sy2; sy++, dy++)
	for(sx=sx1, dx=dst_x; sx<=sx2; sx++, dx++)
	{
		if (src->type == RAS_DIRECT) {
			r = DIRECT_RED(src, sx, sy);
			g = DIRECT_GREEN(src, sx, sy);
			b = DIRECT_BLUE(src, sx, sy);
			DIRECT_RED(dst, dx, dy) = r;
			DIRECT_GREEN(dst, dx, dy) = g;
			DIRECT_BLUE(dst, dx, dy) = b;
		}
		else if (src->type == RAS_INDEXED) {
			INDEXED_PIXEL(dst, dx, dy) = INDEXED_PIXEL(src, sx, sy);
		}
	}
}

int
RasterCenterCrop(src, dst)
	Raster		*src;
	Raster		*dst;
{
	char			*errmsg = "RasterCenterCrop(\"%s\",\"%s\")";
	int			sx, sy, dy;	/* source and dest indices */
	int			src_x, src_y;	/* source upper-left corner */
	int			src_nx, src_ny;	/* source extent */
	int			dst_x, dst_y;	/* dest upper-left corner */
	unsigned char		pixel, *src_ptr, *dst_ptr;

	/* Check for incompatible encodings. */

	if (src->type == RAS_DIRECT && dst->type == RAS_INDEXED) {
		(void) ESprintf(RAS_E_PROGRAMMING,errmsg,src->name,dst->name);
		return(RAS_ERROR);
	}

	/* Set defaults for image positioning. */

	src_x = 0; src_y = 0;
	src_nx = src->nx; src_ny = src->ny;
	dst_x = 0; dst_y = 0;

	/* Calculate X mapping */

	if (src->nx > dst->nx) {
		dst_x = 0;
		src_nx = dst->nx;
		if (OptionCenter)
			src_x = (src->nx - dst->nx) / 2;
		else
			src_x = 0;
	}
	else {
		src_x = 0;
		src_nx = src->nx;
		if (OptionCenter)
			dst_x = (dst->nx - src_nx) / 2;
		else
			dst_x = 0;
	}

	/* Calculate Y mapping */

	if (src->ny >= dst->ny) {
		dst_y = 0;
		src_ny = dst->ny;
		if (OptionCenter)
			src_y = (src->ny - dst->ny) / 2;
		else
			src_y = 0;
	}
	else {
		src_y = 0;
		src_ny = src->ny;
		if (OptionCenter)
			dst_y = (dst->ny - src_ny) / 2;
		else
			dst_y = 0;
	}

	/* Copy colormaps for all-indexed encodings. */

	if (src->type == RAS_INDEXED && dst->type == RAS_INDEXED) {
		(void) RasterCopyColormap(src, dst);
	}

	/*
	In order to avoid repetitive and costly address arithmetic,
	this loop works with pointers more than would be ideal.
	*/

	for(sy=src_y, dy=dst_y; sy<src_y+src_ny; sy++, dy++) {

		if (src->type == RAS_INDEXED) {
			src_ptr = &INDEXED_PIXEL(src, src_x, sy);
		}
		else if (src->type == RAS_DIRECT) {
			src_ptr = &DIRECT_RED(src, src_x, sy);
		}

		if (dst->type == RAS_INDEXED) {
			dst_ptr = &INDEXED_PIXEL(dst, dst_x, dy);
		}
		else if (dst->type == RAS_DIRECT) {
			dst_ptr = &DIRECT_RED(dst, dst_x, dy);
		}

		for(sx=src_x; sx<src_x+src_nx; sx++) {
			if (src->type  == RAS_INDEXED) {
				pixel = *src_ptr++;
				if (dst->type == RAS_INDEXED) {
					*dst_ptr++ = pixel;
				}
				else if (dst->type == RAS_DIRECT) {
					*dst_ptr++ = src->red[pixel];
					*dst_ptr++ = src->green[pixel];
					*dst_ptr++ = src->blue[pixel];
				}
			}
			else if (src->type == RAS_DIRECT) {
				if (dst->type == RAS_DIRECT) {
					*dst_ptr++ = *src_ptr++;
					*dst_ptr++ = *src_ptr++;
					*dst_ptr++ = *src_ptr++;
				}
			}
		}
	}

	return(RAS_OK);
}
