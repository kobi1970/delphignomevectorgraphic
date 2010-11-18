unit pangocairolib;

{$IFDEF FPC}
  {$MODE OBJFPC}{$H+}
  {$PACKRECORDS C}
{$ELSE}
  {$ALIGN ON}
  {$MINENUMSIZE 4}
{$ENDIF}

// SVN: 2830
// pangocairo.h

interface
uses cairolib, pangolib;

(* Pango
 * pangocairo.h:
 *
 * Copyright (C) 1999, 2004 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 *)

(**
 * PangoCairoFont:
 *
 * #PangoCairoFont is an interface exported by fonts for
 * use with Cairo. The actual type of the font will depend
 * on the particular font technology Cairo was compiled to use.
 *
 * Since: 1.18
 **)
type
  PPangoCairoFont = ^PangoCairoFont;
  _PangoCairoFont = record
  end;
  PangoCairoFont = _PangoCairoFont;

//#define PANGO_TYPE_CAIRO_FONT       (pango_cairo_font_get_type ())
//#define PANGO_CAIRO_FONT(object)    (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_CAIRO_FONT, PangoCairoFont))
//#define PANGO_IS_CAIRO_FONT(object) (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_CAIRO_FONT))

(**
 * PangoCairoFontMap:
 *
 * #PangoCairoFontMap is an interface exported by font maps for
 * use with Cairo. The actual type of the font map will depend
 * on the particular font technology Cairo was compiled to use.
 *
 * Since: 1.10
 **)

  PPangoCairoFontMap = ^PangoCairoFontMap;
  _PangoCairoFontMap = record
  end;
  PangoCairoFontMap = _PangoCairoFontMap;
//#define PANGO_TYPE_CAIRO_FONT_MAP       (pango_cairo_font_map_get_type ())
//#define PANGO_CAIRO_FONT_MAP(object)    (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_CAIRO_FONT_MAP, PangoCairoFontMap))
//#define PANGO_IS_CAIRO_FONT_MAP(object) (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_CAIRO_FONT_MAP))

  PangoCairoShapeRendererFunc = procedure(cr: PCairo; attr: PPangoAttrShape; do_path: LongBool; data: Pointer); cdecl;

(*
 * PangoCairoFontMap
 *)
function pango_cairo_font_map_get_type: Cardinal; cdecl;
function pango_cairo_font_map_new: PPangoFontMap; cdecl;
function pango_cairo_font_map_new_for_font_type(fonttype: cairo_font_type_t): PPangoFontMap; cdecl;
function pango_cairo_font_map_get_default: PPangoFontMap; cdecl;
procedure pango_cairo_font_map_set_default(fontmap: PPangoCairoFontMap); cdecl;
function pango_cairo_font_map_get_font_type(fontmap: PPangoCairoFontMap): TCairoFontType; cdecl;
procedure pango_cairo_font_map_set_resolution(fontmap: PPangoCairoFontMap; dpi: double); cdecl;
function pango_cairo_font_map_get_resolution(fontmap: PPangoCairoFontMap): double; cdecl;
//#ifndef PANGO_DISABLE_DEPRECATED
function pango_cairo_font_map_create_context(fontmap: PPangoCairoFontMap): PPangoContext; cdecl;
//#endif

(*
 * PangoCairoFont
 *)
function pango_cairo_font_get_type: Cardinal; cdecl;
function pango_cairo_font_get_scaled_font(font: PPangoCairoFont): PCairoScaledFont; cdecl;

(* Update a Pango context for the current state of a cairo context
 *)
procedure pango_cairo_update_context(cr: PCairo; context: PPangoContext); cdecl;

procedure pango_cairo_context_set_font_options(context: PPangoContext; const options: PCairoFontOptions); cdecl;
function pango_cairo_context_get_font_options(context: PPangoContext): PCairoFontOptions; cdecl;
procedure pango_cairo_context_set_resolution(context: PPangoContext; dpi: double); cdecl;
function pango_cairo_context_get_resolution(context: PPangoContext): double; cdecl;
procedure pango_cairo_context_set_shape_renderer(context: PPangoContext; func: PangoCairoShapeRendererFunc; data: Pointer; dnotify: GDestroyNotify); cdecl;
function pango_cairo_context_get_shape_renderer(context: PPangoContext; data: PPointer): PangoCairoShapeRendererFunc; cdecl;

(* Convenience
 *)
function pango_cairo_create_context(cr: PCairo): PPangoContext; cdecl;
function pango_cairo_create_layout(cr: PCairo): PPangoLayout; cdecl;
procedure pango_cairo_update_layout(cr: PCairo; layout: PPangoLayout); cdecl;

(*
 * Rendering
 *)
procedure pango_cairo_show_glyph_string(cr: PCairo; font: PPangoFont; glyphs: PPangoGlyphString); cdecl;
procedure pango_cairo_show_glyph_item(cr: PCairo; const text: PAnsiChar; glyph_item: PPangoGlyphItem); cdecl;
procedure pango_cairo_show_layout_line(cr: PCairo; line: PPangoLayoutLine); cdecl;
procedure pango_cairo_show_layout(cr: PCairo; layout: PPangoLayout); cdecl;
procedure pango_cairo_show_error_underline(cr: PCairo; x: double; y: double; width: double; height: double); cdecl;

(*
 * Rendering to a path
 *)
procedure pango_cairo_glyph_string_path(cr: PCairo; font: PPangoFont; glyphs: PPangoGlyphString); cdecl;
procedure pango_cairo_layout_line_path(cr: PCairo; line: PPangoLayoutLine); cdecl;
procedure pango_cairo_layout_path(cr: PCairo; layout: PPangoLayout); cdecl;
procedure pango_cairo_error_underline_path(cr: PCairo; x: double; y: double; width: double; height: double); cdecl;

implementation
const
  PANGO_CAIRO_LIB = 'libpangocairo-1.0-0.dll';

function pango_cairo_font_map_get_type: Cardinal; cdecl; external PANGO_CAIRO_LIB;
function pango_cairo_font_map_new: PPangoFontMap; cdecl; external PANGO_CAIRO_LIB;
function pango_cairo_font_map_new_for_font_type(fonttype: cairo_font_type_t): PPangoFontMap; cdecl; external PANGO_CAIRO_LIB;
function pango_cairo_font_map_get_default: PPangoFontMap; cdecl; external PANGO_CAIRO_LIB;
procedure pango_cairo_font_map_set_default(fontmap: PPangoCairoFontMap); cdecl; external PANGO_CAIRO_LIB;
function pango_cairo_font_map_get_font_type(fontmap: PPangoCairoFontMap): TCairoFontType; cdecl; external PANGO_CAIRO_LIB;
procedure pango_cairo_font_map_set_resolution(fontmap: PPangoCairoFontMap; dpi: double); cdecl; external PANGO_CAIRO_LIB;
function pango_cairo_font_map_get_resolution(fontmap: PPangoCairoFontMap): double; cdecl; external PANGO_CAIRO_LIB;
function pango_cairo_font_map_create_context(fontmap: PPangoCairoFontMap): PPangoContext; cdecl; external PANGO_CAIRO_LIB;
function pango_cairo_font_get_type: Cardinal; cdecl; external PANGO_CAIRO_LIB;
function pango_cairo_font_get_scaled_font(font: PPangoCairoFont): PCairoScaledFont; cdecl; external PANGO_CAIRO_LIB;
procedure pango_cairo_update_context(cr: PCairo; context: PPangoContext); cdecl; external PANGO_CAIRO_LIB;
procedure pango_cairo_context_set_font_options(context: PPangoContext; const options: PCairoFontOptions); cdecl; external PANGO_CAIRO_LIB;
function pango_cairo_context_get_font_options(context: PPangoContext): PCairoFontOptions; cdecl; external PANGO_CAIRO_LIB;
procedure pango_cairo_context_set_resolution(context: PPangoContext; dpi: double); cdecl; external PANGO_CAIRO_LIB;
function pango_cairo_context_get_resolution(context: PPangoContext): double; cdecl; external PANGO_CAIRO_LIB;
procedure pango_cairo_context_set_shape_renderer(context: PPangoContext; func: PangoCairoShapeRendererFunc; data: Pointer; dnotify: GDestroyNotify); cdecl; external PANGO_CAIRO_LIB;
function pango_cairo_context_get_shape_renderer(context: PPangoContext; data: PPointer): PangoCairoShapeRendererFunc; cdecl; external PANGO_CAIRO_LIB;
function pango_cairo_create_context(cr: PCairo): PPangoContext; cdecl; external PANGO_CAIRO_LIB;
function pango_cairo_create_layout(cr: PCairo): PPangoLayout; cdecl; external PANGO_CAIRO_LIB;
procedure pango_cairo_update_layout(cr: PCairo; layout: PPangoLayout); cdecl; external PANGO_CAIRO_LIB;
procedure pango_cairo_show_glyph_string(cr: PCairo; font: PPangoFont; glyphs: PPangoGlyphString); cdecl; external PANGO_CAIRO_LIB;
procedure pango_cairo_show_glyph_item(cr: PCairo; const text: PAnsiChar; glyph_item: PPangoGlyphItem); cdecl; external PANGO_CAIRO_LIB;
procedure pango_cairo_show_layout_line(cr: PCairo; line: PPangoLayoutLine); cdecl; external PANGO_CAIRO_LIB;
procedure pango_cairo_show_layout(cr: PCairo; layout: PPangoLayout); cdecl; external PANGO_CAIRO_LIB;
procedure pango_cairo_show_error_underline(cr: PCairo; x: double; y: double; width: double; height: double); cdecl; external PANGO_CAIRO_LIB;
procedure pango_cairo_glyph_string_path(cr: PCairo; font: PPangoFont; glyphs: PPangoGlyphString); cdecl; external PANGO_CAIRO_LIB;
procedure pango_cairo_layout_line_path(cr: PCairo; line: PPangoLayoutLine); cdecl; external PANGO_CAIRO_LIB;
procedure pango_cairo_layout_path(cr: PCairo; layout: PPangoLayout); cdecl; external PANGO_CAIRO_LIB;
procedure pango_cairo_error_underline_path(cr: PCairo; x: double; y: double; width: double; height: double); cdecl; external PANGO_CAIRO_LIB;

end.