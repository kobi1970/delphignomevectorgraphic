unit pangowin32lib;

interface
uses glib, pangolib, windows;

(* Pango
 * pangowin32.h:
 *
 * Copyright (C) 1999 Red Hat Software
 * Copyright (C) 2000 Tor Lillqvist
 * Copyright (C) 2001 Alexander Larsson
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

const
  PANGO_RENDER_TYPE_WIN32 = 'PangoRenderWin32';

(* Calls for applications
 *)

function pango_win32_get_context: PPangoContext; cdecl;
procedure pango_win32_render(hdc: HDC; font: PPangoFont; glyphs: PPangoGlyphString; x: gint; y: gint); cdecl;
procedure pango_win32_render_layout_line(hdc: HDC; line: PPangoLayoutLine; x: Integer; y: Integer); cdecl;
procedure pango_win32_render_layout(hdc: HDC; layout: PPangoLayout; x: Integer; y: Integer); cdecl;
procedure pango_win32_render_transformed(hdc: HDC; const matrix: PPangoMatrix; font: PPangoFont; glyphs: PPangoGlyphString; x: Integer; y: Integer); cdecl;

(* For shape engines
 *)

function pango_win32_get_unknown_glyph(font: PPangoFont; wc: gunichar): PangoGlyph; cdecl;
function pango_win32_font_get_glyph_index(font: PPangoFont; wc: gunichar): gint; cdecl;
function pango_win32_get_dc: HDC; cdecl;
function pango_win32_get_debug_flag: gboolean; cdecl;
function pango_win32_font_select_font(font: PPangoFont; hdc: HDC): gboolean; cdecl;
procedure pango_win32_font_done_font(font: PPangoFont); cdecl;
function pango_win32_font_get_metrics_factor(font: PPangoFont): double; cdecl;

(* API for libraries that want to use PangoWin32 mixed with classic
 * Win32 fonts.
 *)

type
  PPangoWin32FontCache = ^PangoWin32FontCache;
  _PangoWin32FontCache = record

  end;
  PangoWin32FontCache = _PangoWin32FontCache;

function pango_win32_font_cache_new: PPangoWin32FontCache; cdecl;
procedure pango_win32_font_cache_free(cache: PPangoWin32FontCache); cdecl;
function pango_win32_font_cache_load(cache: PPangoWin32FontCache; const logfont: PLOGFONTA): HFONT; cdecl;
function pango_win32_font_cache_loadw(cache: PPangoWin32FontCache; const logfont: PLOGFONTW): HFONT; cdecl;
procedure pango_win32_font_cache_unload(cache: PPangoWin32FontCache; hfont: HFONT); cdecl;

function pango_win32_font_map_for_display: PPangoFontMap ; cdecl;

procedure pango_win32_shutdown_display; cdecl;
function pango_win32_font_map_get_font_cache(font_map: PPangoFontMap): PPangoWin32FontCache; cdecl;
function pango_win32_font_logfont(font: PPangoFont): PLOGFONTA; cdecl;
function pango_win32_font_logfontw(font: PPangoFont): PLOGFONTW; cdecl;
function pango_win32_font_description_from_logfont(const lfp: PLOGFONTA): PPangoFontDescription; cdecl;
function pango_win32_font_description_from_logfontw(const lfp: PLOGFONTW): PPangoFontDescription; cdecl;

implementation

const
  PANGO_WIN32_LIB = 'libpangowin32-1.0-0.dll';

function pango_win32_get_context: PPangoContext; cdecl; external PANGO_WIN32_LIB;
procedure pango_win32_render (hdc: HDC; font: PPangoFont; glyphs: PPangoGlyphString; x: gint; y: gint); cdecl; external PANGO_WIN32_LIB;
procedure pango_win32_render_layout_line (hdc: HDC; line: PPangoLayoutLine; x: Integer; y: Integer); cdecl; external PANGO_WIN32_LIB;
procedure pango_win32_render_layout (hdc: HDC; layout: PPangoLayout; x: Integer; y: Integer); cdecl; external PANGO_WIN32_LIB;
procedure pango_win32_render_transformed (hdc: HDC; const matrix: PPangoMatrix; font: PPangoFont; glyphs: PPangoGlyphString; x: Integer; y: Integer); cdecl; external PANGO_WIN32_LIB;
function pango_win32_get_unknown_glyph (font: PPangoFont; wc: gunichar): PangoGlyph; cdecl; external PANGO_WIN32_LIB;
function pango_win32_font_get_glyph_index(font: PPangoFont; wc: gunichar): gint; cdecl; external PANGO_WIN32_LIB;
function pango_win32_get_dc: HDC; cdecl; external PANGO_WIN32_LIB;
function pango_win32_get_debug_flag: gboolean; cdecl; external PANGO_WIN32_LIB;
function pango_win32_font_select_font (font: PPangoFont; hdc: HDC): gboolean; cdecl; external PANGO_WIN32_LIB;
procedure pango_win32_font_done_font (font: PPangoFont); cdecl; external PANGO_WIN32_LIB;
function pango_win32_font_get_metrics_factor (font: PPangoFont): double; cdecl; external PANGO_WIN32_LIB;
function pango_win32_font_cache_new: PPangoWin32FontCache; cdecl; external PANGO_WIN32_LIB;
procedure pango_win32_font_cache_free (cache: PPangoWin32FontCache); cdecl; external PANGO_WIN32_LIB;
function pango_win32_font_cache_load (cache: PPangoWin32FontCache; const logfont: PLOGFONTA): HFONT; cdecl; external PANGO_WIN32_LIB;
function pango_win32_font_cache_loadw (cache: PPangoWin32FontCache; const logfont: PLOGFONTW): HFONT; cdecl; external PANGO_WIN32_LIB;
procedure pango_win32_font_cache_unload (cache: PPangoWin32FontCache; hfont: HFONT); cdecl; external PANGO_WIN32_LIB;
function pango_win32_font_map_for_display: PPangoFontMap ; cdecl; external PANGO_WIN32_LIB;
procedure pango_win32_shutdown_display; cdecl; external PANGO_WIN32_LIB;
function pango_win32_font_map_get_font_cache (font_map: PPangoFontMap): PPangoWin32FontCache; cdecl; external PANGO_WIN32_LIB;
function pango_win32_font_logfont (font: PPangoFont): PLOGFONTA; cdecl; external PANGO_WIN32_LIB;
function pango_win32_font_logfontw (font: PPangoFont): PLOGFONTW; cdecl; external PANGO_WIN32_LIB;
function pango_win32_font_description_from_logfont (const lfp: PLOGFONTA): PPangoFontDescription; cdecl; external PANGO_WIN32_LIB;
function pango_win32_font_description_from_logfontw (const lfp: PLOGFONTW): PPangoFontDescription; cdecl; external PANGO_WIN32_LIB;


end.