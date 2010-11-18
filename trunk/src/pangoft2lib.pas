unit pangoft2lib;

interface
uses glib, pangolib, fontconfiglib, freetypelib;

(* Pango
 * pangofc-font.h: Base fontmap type for fontconfig-based backends
 *
 * Copyright (C) 2003 Red Hat Software
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 *)

//#define PANGO_TYPE_FC_FONT              (pango_fc_font_get_type ())
//#define PANGO_FC_FONT(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_FC_FONT, PangoFcFont))
//#define PANGO_IS_FC_FONT(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_FC_FONT))

//#if defined(PANGO_ENABLE_ENGINE) || defined(PANGO_ENABLE_BACKEND)

(**
 * PANGO_RENDER_TYPE_FC:
 *
 * A string constant used to identify shape engines that work
 * with the fontconfig based backends. See the @engine_type field
 * of #PangoEngineInfo.
 **)
const
  PANGO_RENDER_TYPE_FC = 'PangoRenderFc';

//#ifdef PANGO_ENABLE_BACKEND

//#define PANGO_FC_FONT_CLASS(klass)      (G_TYPE_CHECK_CLASS_CAST ((klass), PANGO_TYPE_FC_FONT, PangoFcFontClass))
//#define PANGO_IS_FC_FONT_CLASS(klass)   (G_TYPE_CHECK_CLASS_TYPE ((klass), PANGO_TYPE_FC_FONT))
//#define PANGO_FC_FONT_GET_CLASS(obj)    (G_TYPE_INSTANCE_GET_CLASS ((obj), PANGO_TYPE_FC_FONT, PangoFcFontClass))

type
(**
 * PangoFcFont:
 *
 * #PangoFcFont is a base class for font implementations
 * using the Fontconfig and FreeType libraries and is used in
 * conjunction with #PangoFcFontMap. When deriving from this
 * class, you need to implement all of its virtual functions
 * other than shutdown() along with the get_glyph_extents()
 * virtual function from #PangoFont.
 **)

  PPangoFcFont = ^PangoFcFont;
  _PangoFcFont = record
    parent_instance: PangoFont;

    font_pattern: PFcPattern; (* fully resolved pattern *)
    fontmap: PPangoFontMap;   (* associated map *)
    priv: gpointer;      (* used internally *)
    matrix: TPangoMatrix;      (* used internally *)
    description: PPangoFontDescription;

    metrics_by_lang: PGSList;

    is_hinted: guint; // : 1; todo
    is_transformed: guint;// : 1; todo
  end;
  PangoFcFont = _PangoFcFont;

(**
 * PangoFcFontClass:
 * @lock_face: Returns the FT_Face of the font and increases
 *  the reference count for the face by one.
 * @unlock_face: Decreases the reference count for the
 *  FT_Face of the font by one. When the count is zero,
 *  the #PangoFcFont subclass is allowed to free the
 *  FT_Face.
 * @has_char: Return %TRUE if the the font contains a glyph
 *   corresponding to the specified character.
 * @get_glyph: Gets the glyph that corresponds to the given
 *   Unicode character.
 * @get_unknown_glyph: Gets the glyph that should be used to
 *   display an unknown-glyph indication for the specified
 *   Unicode character.
 *   May be %NULL.
 * @shutdown: Performs any font-specific shutdown code that
 *   needs to be done when pango_fc_font_map_shutdown is called.
 *   May be %NULL.
 *
 * Class structure for #PangoFcFont.
 **)
  PPangoFcFontClass = ^PangoFcFontClass;
  _PangoFcFontClass = record
    (*< private >*)
    parent_class: PangoFontClass;

    (*< public >*)
    lock_face: function(font: PPangoFcFont): FT_Face; cdecl;
    unlock_face: procedure(font: PPangoFcFont); cdecl;
    has_char: function(font: PPangoFcFont; wc: gunichar): gboolean; cdecl;
    get_glyph: function(font: PPangoFcFont; wc: gunichar): guint; cdecl;
    get_unknown_glyph: function(font: PPangoFcFont; wc: gunichar): PangoGlyph; cdecl;
    shutdown: procedure(font: PPangoFcFont); cdecl;
    (*< private >*)

    (* Padding for future expansion *)
    _pango_reserved1: procedure;
    _pango_reserved2: procedure;
    _pango_reserved3: procedure;
    _pango_reserved4: procedure;
  end;
  PangoFcFontClass = _PangoFcFontClass;


//#endif (* PANGO_ENABLE_BACKEND *)

function pango_fc_font_has_char(font: PPangoFcFont; wc: gunichar): gboolean; cdecl;
function pango_fc_font_get_glyph(font: PPangoFcFont; wc: gunichar): guint; cdecl;
//#ifndef PANGO_DISABLE_DEPRECATED
function pango_fc_font_get_unknown_glyph(font: PPangoFcFont; wc: gunichar): PangoGlyph; cdecl;
//#endif (* PANGO_DISABLE_DEPRECATED *)
procedure pango_fc_font_kern_glyphs(font: PPangoFcFont; glyphs: PPangoGlyphString); cdecl;

//#endif (* PANGO_ENABLE_ENGINE || PANGO_ENABLE_BACKEND *)

function pango_fc_font_get_type: GType; cdecl;

function pango_fc_font_lock_face(font: PPangoFcFont): FT_Face; cdecl;
procedure pango_fc_font_unlock_face(font: PPangoFcFont); cdecl;


(* Pango
 * pangofc-decoder.h: Custom encoders/decoders on a per-font basis.
 *
 * Copyright (C) 2004 Red Hat Software
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 *)

//#define PANGO_TYPE_FC_DECODER       (pango_fc_decoder_get_type())
//#define PANGO_FC_DECODER(object)    (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_FC_DECODER, PangoFcDecoder))
//#define PANGO_IS_FC_DECODER(object) (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_FC_DECODER))

type
(**
 * PangoFcDecoder:
 *
 * #PangoFcDecoder is a virtual base class that implementations will
 * inherit from.  It's the interface that is used to define a custom
 * encoding for a font.  These objects are created in your code from a
 * function callback that was originally registered with
 * pango_fc_font_map_add_decoder_find_func().  Pango requires
 * information about the supported charset for a font as well as the
 * individual character to glyph conversions.  Pango gets that
 * information via the #get_charset and #get_glyph callbacks into your
 * object implementation.
 *
 * Since: 1.6
 **)

  PPangoFcDecoder = ^PangoFcDecoder;
  _PangoFcDecoder = record
    (*< private >*)
    parent_instance: GObject;
  end;
  PangoFcDecoder = _PangoFcDecoder;

(**
 * PangoFcDecoderClass:
 * @get_charset: This returns an #FcCharset given a #PangoFcFont that
 *  includes a list of supported characters in the font.  The
 *  #FcCharSet that is returned should be an internal reference to your
 *  code.  Pango will not free this structure.  It is important that
 *  you make this callback fast because this callback is called
 *  separately for each character to determine Unicode coverage.
 * @get_glyph: This returns a single #PangoGlyph for a given Unicode
 *  code point.
 *
 * Class structure for #PangoFcDecoder.
 *
 * Since: 1.6
 **)

  PPangoFcDecoderClass = ^PangoFcDecoderClass;
  _PangoFcDecoderClass = record
    (*< private >*)
    parent_class: GObjectClass;

    (* vtable - not signals *)
    (*< public >*)
    get_charset: function(decoder: PPangoFcDecoder; fcfont: PPangoFcFont): PFcCharSet; cdecl;
    get_glyph: function(decoder: PPangoFcDecoder; fcfont: PPangoFcFont; wc: guint32): PangoGlyph; cdecl;

    (*< private >*)

    (* Padding for future expansion *)
    _pango_reserved1: procedure;
    _pango_reserved2: procedure;
    _pango_reserved3: procedure;
    _pango_reserved4: procedure;
  end;
  PangoFcDecoderClass = _PangoFcDecoderClass;


//#define PANGO_FC_DECODER_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), PANGO_TYPE_FC_DECODER, PangoFcDecoderClass))
//#define PANGO_IS_FC_DECODER_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), PANGO_TYPE_FC_DECODER))
//#define PANGO_FC_DECODER_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), PANGO_TYPE_FC_DECODER, PangoFcDecoderClass))

function pango_fc_decoder_get_type: GType; cdecl;
function pango_fc_decoder_get_charset(decoder: PPangoFcDecoder; fcfont: PPangoFcFont): PFcCharSet; cdecl;
function pango_fc_decoder_get_glyph(decoder: PPangoFcDecoder; fcfont: PPangoFcFont; wc: guint32): PangoGlyph; cdecl;


(* Pango
 * pangofc-fontmap.h: Base fontmap type for fontconfig-based backends
 *
 * Copyright (C) 2003 Red Hat Software
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 *)


//#ifdef PANGO_ENABLE_BACKEND

(**
 * PangoFcFontsetKey:
 *
 * An opaque structure containing all the information needed for
 * loading a fontset with the PangoFc fontmap.
 *
 * Since: 1.24
 **)
type
  PPangoFcFontsetKey = ^PangoFcFontsetKey;
  _PangoFcFontsetKey = record

  end;
  PangoFcFontsetKey = _PangoFcFontsetKey;

function pango_fc_fontset_key_get_language(const key: PPangoFcFontsetKey): PPangoLanguage; cdecl;
function pango_fc_fontset_key_get_description(const key: PPangoFcFontsetKey): PPangoFontDescription; cdecl;
function pango_fc_fontset_key_get_matrix(const key: PPangoFcFontsetKey): PPangoMatrix; cdecl;
function pango_fc_fontset_key_get_absolute_size(const key: PPangoFcFontsetKey): double; cdecl;
function pango_fc_fontset_key_get_resolution(const key: PPangoFcFontsetKey): double; cdecl;
function pango_fc_fontset_key_get_context_key(const key: PPangoFcFontsetKey): gpointer; cdecl;

(**
 * PangoFcFontKey:
 *
 * An opaque structure containing all the information needed for
 * loading a font with the PangoFc fontmap.
 *
 * Since: 1.24
 **)
type
  PPangoFcFontKey = ^PangoFcFontKey;
  _PangoFcFontKey = record

  end;
  PangoFcFontKey = _PangoFcFontKey;

function pango_fc_font_key_get_pattern(const key: PPangoFcFontKey): PFcPattern; cdecl;
function pango_fc_font_key_get_matrix(const key: PPangoFcFontKey): PPangoMatrix; cdecl;
function pango_fc_font_key_get_context_key(const key: PPangoFcFontKey): gpointer; cdecl;


(*
 * PangoFcFontMap
 *)

//#define PANGO_TYPE_FC_FONT_MAP              (pango_fc_font_map_get_type ())
//#define PANGO_FC_FONT_MAP(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_FC_FONT_MAP, PangoFcFontMap))
//#define PANGO_IS_FC_FONT_MAP(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_FC_FONT_MAP))

type
  PPangoFcFontMapPrivate = ^PangoFcFontMapPrivate;
  _PangoFcFontMapPrivate = record end;
  PangoFcFontMapPrivate = _PangoFcFontMapPrivate;
(**
 * PangoFcFontMap:
 *
 * #PangoFcFontMap is a base class for font map implementations
 * using the Fontconfig and FreeType libraries. To create a new
 * backend using Fontconfig and FreeType, you derive from this class
 * and implement a new_font() virtual function that creates an
 * instance deriving from #PangoFcFont.
 **)
  PPangoFcFontMap = ^PangoFcFontMap;
  _PangoFcFontMap = record
    parent_instance: PangoFontMap;
    priv: PPangoFcFontMapPrivate;
  end;
  PangoFcFontMap = _PangoFcFontMap;

(**
 * PangoFcFontMapClass:
 * @default_substitute: Substitutes in default values for
 *  unspecified fields in a #FcPattern. This will be called
 *  prior to creating a font for the pattern. May be %NULL.
 *  Deprecated in favor of @font_key_substitute().
 * @new_font: Creates a new #PangoFcFont for the specified
 *  pattern of the appropriate type for this font map. The
 *  @pattern argument must be passed to the "pattern" property
 *  of #PangoFcFont when you call g_object_new(). Deprecated
 *  in favor of @create_font().
 * @get_resolution: Gets the resolution (the scale factor
 *  between logical and absolute font sizes) that the backend
 *  will use for a particular fontmap and context. @context
 *  may be null.
 * @context_key_get: Gets an opaque key holding backend
 *  specific options for the context that will affect
 *  fonts created by create_font(). The result must point to
 *  persistant storage owned by the fontmap. This key
 *  is used to index hash tables used to look up fontsets
 *  and fonts.
 * @context_key_copy: Copies a context key. Pango uses this
 *  to make a persistant copy of the value returned from
 *  @context_key_get.
 * @context_key_free: Frees a context key copied with
 *  @context_key_copy.
 * @context_key_hash: Gets a hash value for a context key
 * @context_key_equal: Compares two context keys for equality.
 * @fontset_key_substitute: Substitutes in default values for
 *  unspecified fields in a #FcPattern. This will be called
 *  prior to creating a font for the pattern. May be %NULL.
 *  (Since: 1.24)
 * @create_font: Creates a new #PangoFcFont for the specified
 *  pattern of the appropriate type for this font map using
 *  information from the font key that is passed in. The
 *  @pattern member of @font_key can be retrieved using
 *  pango_fc_font_key_get_pattern() and must be passed to
 *  the "pattern" property of #PangoFcFont when you call
 *  g_object_new().  If %NULL, new_font() is used.
 *  (Since: 1.24)
 *
 * Class structure for #PangoFcFontMap.
 **)  PPangoFcFontMapClass = ^PangoFcFontMapClass;
  _PangoFcFontMapClass = record
    (*< private >*)
    parent_class: PangoFontMapClass;

    (*< public >*)
    (* Deprecated in favor of fontset_key_substitute *)
    default_substitute: procedure(fontmap: PPangoFcFontMap; pattern: PFcPattern); cdecl;
    (* Deprecated in favor of create_font *)
    new_font: function(fontmap: PPangoFcFontMap; pattern: PFcPattern): PPangoFcFont; cdecl;
    get_resolution: function(fcfontmap: PPangoFcFontMap; context: PPangoContext): double; cdecl;
    context_key_get: function(fcfontmap: PPangoFcFontMap; context: PPangoContext): gconstpointer; cdecl;
    context_key_copy: function(fcfontmap: PPangoFcFontMap; key: gconstpointer): gpointer; cdecl;
    context_key_free: procedure(fcfontmap: PPangoFcFontMap; key: gpointer); cdecl;
    context_key_hash: function(fcfontmap: PPangoFcFontMap; key: gconstpointer): guint32; cdecl;
    context_key_equal: function(fcfontmap: PPangoFcFontMap; key_a: gconstpointer; key_b: gconstpointer): gboolean; cdecl;
    fontset_key_substitute: procedure(fontmap: PPangoFcFontMap; fontsetkey: PPangoFcFontsetKey; pattern: PFcPattern); cdecl;
    create_font: function(fontmap: PPangoFcFontMap; fontkey: PPangoFcFontKey): PPangoFcFont; cdecl;
    (*< private >*)

    (* Padding for future expansion *)
    _pango_reserved1: procedure;
    _pango_reserved2: procedure;
    _pango_reserved3: procedure;
    _pango_reserved4: procedure;
  end;
  PangoFcFontMapClass = _PangoFcFontMapClass;

//#ifdef PANGO_ENABLE_BACKEND

//#define PANGO_FC_FONT_MAP_CLASS(klass)      (G_TYPE_CHECK_CLASS_CAST ((klass), PANGO_TYPE_FC_FONT_MAP, PangoFcFontMapClass))
//#define PANGO_IS_FC_FONT_MAP_CLASS(klass)   (G_TYPE_CHECK_CLASS_TYPE ((klass), PANGO_TYPE_FC_FONT_MAP))
//#define PANGO_FC_FONT_MAP_GET_CLASS(obj)    (G_TYPE_INSTANCE_GET_CLASS ((obj), PANGO_TYPE_FC_FONT_MAP, PangoFcFontMapClass))


function pango_fc_font_map_create_context(fcfontmap: PPangoFcFontMap): PPangoContext; cdecl;
procedure pango_fc_font_map_shutdown(fcfontmap: PPangoFcFontMap); cdecl;
function pango_fc_font_map_get_type: GType; cdecl;
procedure pango_fc_font_map_cache_clear(fcfontmap: PPangoFcFontMap); cdecl;

(**
 * PangoFcDecoderFindFunc:
 * @pattern: a fully resolved #FcPattern specifying the font on the system
 * @user_data: user data passed to pango_fc_font_map_add_decoder_find_func()
 *
 * Callback function passed to pango_fc_font_map_add_decoder_find_func().
 *
 * Return value: a new reference to a custom decoder for this pattern,
 *  or %NULL if the default decoder handling should be used.
 **)
type
  PangoFcDecoderFindFunc = function(pattern: PFcPattern; user_data: gpointer): PPangoFcDecoder; cdecl;

procedure pango_fc_font_map_add_decoder_find_func(fcfontmap: PPangoFcFontMap; findfunc: PangoFcDecoderFindFunc; user_data: gpointer; dnotify: GDestroyNotify); cdecl;
function pango_fc_font_description_from_pattern(pattern: PFcPattern; include_size: gboolean): PPangoFontDescription; cdecl;

(**
 * PANGO_FC_GRAVITY:
 *
 * String representing a fontconfig property name that Pango sets on any
 * fontconfig pattern it passes to fontconfig if a #PangoGravity other
 * than %PangoGravitySouth is desired.
 *
 * The property will have a #PangoGravity value as a string, like "east".
 * This can be used to write fontconfig configuration rules to choose
 * different fonts for horizontal and vertical writing directions.
 *
 * Since: 1.20
 *)
const
  PANGO_FC_GRAVITY = 'pangogravity';

(**
 * PANGO_FC_VERSION:
 *
 * String representing a fontconfig property name that Pango sets on any
 * fontconfig pattern it passes to fontconfig.
 *
 * The property will have an integer value equal to what
 * pango_version() returns.
 * This can be used to write fontconfig configuration rules that only affect
 * certain pango versions (or only pango-using applications, or only
 * non-pango-using applications).
 *
 * Since: 1.20
 *)
  PANGO_FC_VERSION = 'pangoversion';

(**
 * PANGO_FC_PRGNAME:
 *
 * String representing a fontconfig property name that Pango sets on any
 * fontconfig pattern it passes to fontconfig.
 *
 * The property will have a string equal to what
 * g_get_prgname() returns.
 * This can be used to write fontconfig configuration rules that only affect
 * certain applications.
 *
 * Since: 1.24
 *)
  PANGO_FC_PRGNAME = 'pangoprgname';


(* Pango
 * pangoft2.h:
 *
 * Copyright (C) 1999 Red Hat Software
 * Copyright (C) 2000 Tor Lillqvist
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 *)


//#ifndef PANGO_DISABLE_DEPRECATED
  PANGO_RENDER_TYPE_FT2 = 'PangoRenderFT2';
//#endif

//#define PANGO_TYPE_FT2_FONT_MAP              (pango_ft2_font_map_get_type ())
//#define PANGO_FT2_FONT_MAP(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_FT2_FONT_MAP, PangoFT2FontMap))
//#define PANGO_FT2_IS_FONT_MAP(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_FT2_FONT_MAP))
type
  PPangoFT2FontMap = ^PangoFT2FontMap;
  _PangoFT2FontMap = record end;
  PangoFT2FontMap = _PangoFT2FontMap;


  PangoFT2SubstituteFunc = procedure(pattern: PFcPattern; data: gpointer); cdecl;

(* Calls for applications *)

procedure pango_ft2_render(bitmap: PFT_Bitmap; font: PPangoFont; glyphs: PPangoGlyphString; x: gint; y: gint); cdecl;
procedure pango_ft2_render_transformed(bitmap: PFT_Bitmap; const matrix: PPangoMatrix; font: PPangoFont; glyphs: PPangoGlyphString; x: Integer; y: Integer); cdecl;
procedure pango_ft2_render_layout_line(bitmap: PFT_Bitmap; line: PPangoLayoutLine; x: Integer; y: Integer); cdecl;
procedure pango_ft2_render_layout_line_subpixel(bitmap: PFT_Bitmap; line: PPangoLayoutLine; x: Integer; y: Integer); cdecl;
procedure pango_ft2_render_layout(bitmap: PFT_Bitmap; layout: PPangoLayout; x: Integer; y: Integer); cdecl;
procedure pango_ft2_render_layout_subpixel(bitmap: PFT_Bitmap; layout: PPangoLayout; x: Integer; y: Integer); cdecl;

function pango_ft2_font_map_get_type: GType; cdecl;
function pango_ft2_font_map_new: PPangoFontMap; cdecl;
procedure pango_ft2_font_map_set_resolution(fontmap: PPangoFT2FontMap; dpi_x: double; dpi_y: double); cdecl;
procedure pango_ft2_font_map_set_default_substitute(fontmap: PPangoFT2FontMap; func: PangoFT2SubstituteFunc; data: gpointer; notify: GDestroyNotify); cdecl;
procedure pango_ft2_font_map_substitute_changed(fontmap: PPangoFT2FontMap); cdecl;
//#ifndef PANGO_DISABLE_DEPRECATED
function pango_ft2_font_map_create_context(fontmap: PPangoFT2FontMap): PPangoContext; cdecl;
//#endif


(* API for rendering modules
 *)
//#ifndef PANGO_DISABLE_DEPRECATED
function pango_ft2_get_context(dpi_x: double; dpi_y: double): PPangoContext ; cdecl;
function pango_ft2_font_map_for_display: PPangoFontMap; cdecl;
procedure pango_ft2_shutdown_display; cdecl;
function pango_ft2_get_unknown_glyph(font: PPangoFont): PangoGlyph; cdecl;
function pango_ft2_font_get_kerning(font: PPangoFont;  left: PangoGlyph; right: PangoGlyph): Integer; cdecl;
function pango_ft2_font_get_face(font: PPangoFont): FT_Face; cdecl;
function pango_ft2_font_get_coverage(font: PPangoFont; language: PPangoLanguage): PPangoCoverage; cdecl;
//#endif (* PANGO_DISABLE_DEPRECATED *)


(* Pango
 * pango-ot.h:
 *
 * Copyright (C) 2000,2007 Red Hat Software
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 *)


type
  PPangoOTTag = ^PangoOTTag;
  PangoOTTag = guint32;

//#define PANGO_OT_TAG_MAKE(c1,c2,c3,c4)  ((PangoOTTag) FT_MAKE_TAG (c1, c2, c3, c4))
//#define PANGO_OT_TAG_MAKE_FROM_STRING(s) (PANGO_OT_TAG_MAKE(((const char *) s)[0], \
//           ((const char *) s)[1], \
//           ((const char *) s)[2], \
//           ((const char *) s)[3]))

  PPangoOTInfo = ^PangoOTInfo;
  _PangoOTInfo = record end;
  PangoOTInfo = _PangoOTInfo;

  PPangoOTBuffer = ^PangoOTBuffer;
  _PangoOTBuffer = record end;
  PangoOTBuffer = _PangoOTBuffer;

  (* Note that this must match HB_GlyphItem *)
  PPangoOTGlyph = ^PangoOTGlyph;
  _PangoOTGlyph = record
    glyph: guint;
    properties: guint;
    cluster: guint;
    component: gushort;
    ligID: gushort;
    property_cache: gushort;    (* Internal *)
  end;
  PangoOTGlyph = _PangoOTGlyph;

  PPangoOTRuleset = ^PangoOTRuleset;
  _PangoOTRuleset = record end;
  PangoOTRuleset = _PangoOTRuleset;

  PPangoOTFeatureMap = ^PangoOTFeatureMap;
  _PangoOTFeatureMap = record
    feature_name: array[0..4] of AnsiChar;
    property_bit: gulong;
  end;
  PangoOTFeatureMap = _PangoOTFeatureMap;

  PPangoOTRulesetDescription = ^PangoOTRulesetDescription;
  _PangoOTRulesetDescription = record
    script: PangoScript;
    language: PPangoLanguage;
    static_gsub_features: PPangoOTFeatureMap;
    n_static_gsub_features: guint;
    static_gpos_features: PPangoOTFeatureMap;
    n_static_gpos_features: guint;
    other_features: PPangoOTFeatureMap;
    n_other_features: guint;
  end;
  PangoOTRulesetDescription = _PangoOTRulesetDescription;


  PangoOTTableType = (
    PANGO_OT_TABLE_GSUB,
    PANGO_OT_TABLE_GPOS
  );

const
  PANGO_OT_ALL_GLYPHS      : guint = $FFFF;
  PANGO_OT_NO_FEATURE      : guint = $FFFF;
  PANGO_OT_NO_SCRIPT       : guint = $FFFF;
  PANGO_OT_DEFAULT_LANGUAGE: guint = $FFFF;

//#define PANGO_OT_TAG_DEFAULT_SCRIPT  PANGO_OT_TAG_MAKE ('D', 'F', 'L', 'T')
//#define PANGO_OT_TAG_DEFAULT_LANGUAGE  PANGO_OT_TAG_MAKE ('d', 'f', 'l', 't')

//#define PANGO_TYPE_OT_INFO              (pango_ot_info_get_type ())
//#define PANGO_OT_INFO(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_OT_INFO, PangoOTInfo))
//#define PANGO_IS_OT_INFO(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_OT_INFO))
function pango_ot_info_get_type: GType; cdecl;

//#define PANGO_TYPE_OT_RULESET           (pango_ot_ruleset_get_type ())
//#define PANGO_OT_RULESET(object)        (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_OT_RULESET, PangoOTRuleset))
//#define PANGO_IS_OT_RULESET(object)     (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_OT_RULESET))
function pango_ot_ruleset_get_type: GType; cdecl;


function pango_ot_info_get(face: FT_Face): PPangoOTInfo; cdecl;
function pango_ot_info_find_script(info: PPangoOTInfo; table_type: PangoOTTableType; script_tag: PangoOTTag; script_index: Pguint): gboolean; cdecl;
function pango_ot_info_find_language(info: PPangoOTInfo; table_type: PangoOTTableType; script_index: guint; language_tag: PangoOTTag; language_index: Pguint; required_feature_index: Pguint): gboolean; cdecl;
function pango_ot_info_find_feature(info: PPangoOTInfo; table_type: PangoOTTableType; feature_tag: PangoOTTag; script_index: guint; language_index: guint; feature_index: Pguint): gboolean; cdecl;
function pango_ot_info_list_scripts(info: PPangoOTInfo; table_type: PangoOTTableType): PPangoOTTag; cdecl;
function pango_ot_info_list_languages(info: PPangoOTInfo; table_type: PangoOTTableType; script_index: guint; language_tag: PangoOTTag): PPangoOTTag; cdecl;
function pango_ot_info_list_features(info: PPangoOTInfo; table_type: PangoOTTableType; tag: PangoOTTag; script_index: guint; language_index: guint): PPangoOTTag; cdecl;

function pango_ot_buffer_new(font: PPangoFcFont): PPangoOTBuffer; cdecl;
procedure pango_ot_buffer_destroy(buffer: PPangoOTBuffer); cdecl;
procedure pango_ot_buffer_clear(buffer: PPangoOTBuffer); cdecl;
procedure pango_ot_buffer_set_rtl(buffer: PPangoOTBuffer; rtl: gboolean); cdecl;
procedure pango_ot_buffer_add_glyph(buffer: PPangoOTBuffer; glyph: guint; properties: guint; cluster: guint); cdecl;
procedure pango_ot_buffer_get_glyphs(const buffer: PPangoOTBuffer; var glyphs: PPangoOTGlyph; var n_glyphs: Integer); cdecl;
procedure pango_ot_buffer_output(const buffer: PPangoOTBuffer; glyphs: PPangoGlyphString); cdecl;
procedure pango_ot_buffer_set_zero_width_marks(buffer: PPangoOTBuffer; zero_width_marks: gboolean); cdecl;

function pango_ot_ruleset_get_for_description(info: PPangoOTInfo; const desc: PPangoOTRulesetDescription): PPangoOTRuleset; cdecl;
function pango_ot_ruleset_new(info: PPangoOTInfo): PPangoOTRuleset; cdecl;
function pango_ot_ruleset_new_for(info: PPangoOTInfo; script: PangoScript; language: PPangoLanguage): PPangoOTRuleset; cdecl;
function pango_ot_ruleset_new_from_description(info: PPangoOTInfo; const desc: PPangoOTRulesetDescription): PPangoOTRuleset; cdecl;

procedure pango_ot_ruleset_add_feature(ruleset: PPangoOTRuleset; table_type: PangoOTTableType; feature_index: guint; property_bit: gulong); cdecl;
function pango_ot_ruleset_maybe_add_feature(ruleset: PPangoOTRuleset; table_type: PangoOTTableType; feature_tag: PangoOTTag; property_bit: gulong): gboolean; cdecl;
function pango_ot_ruleset_maybe_add_features(ruleset: PPangoOTRuleset; table_type: PangoOTTableType; const features: PPangoOTFeatureMap; n_features: guint): guint; cdecl;
function pango_ot_ruleset_get_feature_count(const ruleset: PPangoOTRuleset; n_gsub_features: Pguint; n_gpos_features: Pguint): guint; cdecl;
procedure pango_ot_ruleset_substitute(const ruleset: PPangoOTRuleset; buffer: PPangoOTBuffer); cdecl;
procedure pango_ot_ruleset_position(const ruleset: PPangoOTRuleset; buffer: PPangoOTBuffer); cdecl;

function pango_ot_tag_to_script(script_tag: PangoOTTag): PangoScript; cdecl;
function pango_ot_tag_from_script(script: PangoScript): PangoOTTag; cdecl;
function pango_ot_tag_to_language(language_tag: PangoOTTag): PPangoLanguage; cdecl;
function pango_ot_tag_from_language(language: PPangoLanguage): PangoOTTag; cdecl;

function pango_ot_ruleset_description_hash(const desc: PPangoOTRulesetDescription): guint; cdecl;
function pango_ot_ruleset_description_equal(const desc1: PPangoOTRulesetDescription; const desc2: PPangoOTRulesetDescription): gboolean; cdecl;
function pango_ot_ruleset_description_copy(const desc: PPangoOTRulesetDescription): PPangoOTRulesetDescription; cdecl;
procedure  pango_ot_ruleset_description_free(desc: PPangoOTRulesetDescription); cdecl;

//#endif (* PANGO_ENABLE_ENGINE *)

implementation
const
  PANGO_FT_LIB = 'libpangoft2-1.0-0.dll';

function pango_fc_font_has_char(font: PPangoFcFont; wc: gunichar): gboolean; cdecl; external PANGO_FT_LIB;
function pango_fc_font_get_glyph(font: PPangoFcFont; wc: gunichar): guint; cdecl; external PANGO_FT_LIB;
function pango_fc_font_get_unknown_glyph(font: PPangoFcFont; wc: gunichar): PangoGlyph; cdecl; external PANGO_FT_LIB;
procedure pango_fc_font_kern_glyphs(font: PPangoFcFont; glyphs: PPangoGlyphString); cdecl; external PANGO_FT_LIB;
function pango_fc_font_get_type: GType; cdecl; external PANGO_FT_LIB;
function pango_fc_font_lock_face(font: PPangoFcFont): FT_Face; cdecl; external PANGO_FT_LIB;
procedure pango_fc_font_unlock_face(font: PPangoFcFont); cdecl; external PANGO_FT_LIB;
function pango_fc_decoder_get_type: GType; cdecl; external PANGO_FT_LIB;
function pango_fc_decoder_get_charset(decoder: PPangoFcDecoder; fcfont: PPangoFcFont): PFcCharSet; cdecl; external PANGO_FT_LIB;
function pango_fc_decoder_get_glyph(decoder: PPangoFcDecoder; fcfont: PPangoFcFont; wc: guint32): PangoGlyph; cdecl; external PANGO_FT_LIB;
function pango_fc_fontset_key_get_language(const key: PPangoFcFontsetKey): PPangoLanguage; cdecl; external PANGO_FT_LIB;
function pango_fc_fontset_key_get_description(const key: PPangoFcFontsetKey): PPangoFontDescription; cdecl; external PANGO_FT_LIB;
function pango_fc_fontset_key_get_matrix(const key: PPangoFcFontsetKey): PPangoMatrix; cdecl; external PANGO_FT_LIB;
function pango_fc_fontset_key_get_absolute_size(const key: PPangoFcFontsetKey): double; cdecl; external PANGO_FT_LIB;
function pango_fc_fontset_key_get_resolution(const key: PPangoFcFontsetKey): double; cdecl; external PANGO_FT_LIB;
function pango_fc_fontset_key_get_context_key(const key: PPangoFcFontsetKey): gpointer; cdecl; external PANGO_FT_LIB;
function pango_fc_font_key_get_pattern(const key: PPangoFcFontKey): PFcPattern; cdecl; external PANGO_FT_LIB;
function pango_fc_font_key_get_matrix(const key: PPangoFcFontKey): PPangoMatrix; cdecl; external PANGO_FT_LIB;
function pango_fc_font_key_get_context_key(const key: PPangoFcFontKey): gpointer; cdecl; external PANGO_FT_LIB;
function pango_fc_font_map_create_context(fcfontmap: PPangoFcFontMap): PPangoContext; cdecl; external PANGO_FT_LIB;
procedure pango_fc_font_map_shutdown(fcfontmap: PPangoFcFontMap); cdecl; external PANGO_FT_LIB;
function pango_fc_font_map_get_type: GType; cdecl; external PANGO_FT_LIB;
procedure pango_fc_font_map_cache_clear(fcfontmap: PPangoFcFontMap); cdecl; external PANGO_FT_LIB;
procedure pango_fc_font_map_add_decoder_find_func(fcfontmap: PPangoFcFontMap; findfunc: PangoFcDecoderFindFunc; user_data: gpointer; dnotify: GDestroyNotify); cdecl; external PANGO_FT_LIB;
function pango_fc_font_description_from_pattern(pattern: PFcPattern; include_size: gboolean): PPangoFontDescription; cdecl; external PANGO_FT_LIB;
procedure pango_ft2_render(bitmap: PFT_Bitmap; font: PPangoFont; glyphs: PPangoGlyphString; x: gint; y: gint); cdecl; external PANGO_FT_LIB;
procedure pango_ft2_render_transformed(bitmap: PFT_Bitmap; const matrix: PPangoMatrix; font: PPangoFont; glyphs: PPangoGlyphString; x: Integer; y: Integer); cdecl; external PANGO_FT_LIB;
procedure pango_ft2_render_layout_line(bitmap: PFT_Bitmap; line: PPangoLayoutLine; x: Integer; y: Integer); cdecl; external PANGO_FT_LIB;
procedure pango_ft2_render_layout_line_subpixel(bitmap: PFT_Bitmap; line: PPangoLayoutLine; x: Integer; y: Integer); cdecl; external PANGO_FT_LIB;
procedure pango_ft2_render_layout(bitmap: PFT_Bitmap; layout: PPangoLayout; x: Integer; y: Integer); cdecl; external PANGO_FT_LIB;
procedure pango_ft2_render_layout_subpixel(bitmap: PFT_Bitmap; layout: PPangoLayout; x: Integer; y: Integer); cdecl; external PANGO_FT_LIB;
function pango_ft2_font_map_get_type: GType; cdecl; external PANGO_FT_LIB;
function pango_ft2_font_map_new: PPangoFontMap; cdecl; external PANGO_FT_LIB;
procedure pango_ft2_font_map_set_resolution(fontmap: PPangoFT2FontMap; dpi_x: double; dpi_y: double); cdecl; external PANGO_FT_LIB;
procedure pango_ft2_font_map_set_default_substitute(fontmap: PPangoFT2FontMap; func: PangoFT2SubstituteFunc; data: gpointer; notify: GDestroyNotify); cdecl; external PANGO_FT_LIB;
procedure pango_ft2_font_map_substitute_changed(fontmap: PPangoFT2FontMap); cdecl; external PANGO_FT_LIB;
function pango_ft2_font_map_create_context(fontmap: PPangoFT2FontMap): PPangoContext; cdecl; external PANGO_FT_LIB;
function pango_ft2_get_context(dpi_x: double; dpi_y: double): PPangoContext ; cdecl; external PANGO_FT_LIB;
function pango_ft2_font_map_for_display: PPangoFontMap; cdecl; external PANGO_FT_LIB;
procedure pango_ft2_shutdown_display; cdecl; external PANGO_FT_LIB;
function pango_ft2_get_unknown_glyph(font: PPangoFont): PangoGlyph; cdecl; external PANGO_FT_LIB;
function pango_ft2_font_get_kerning(font: PPangoFont;  left: PangoGlyph; right: PangoGlyph): Integer; cdecl; external PANGO_FT_LIB;
function pango_ft2_font_get_face(font: PPangoFont): FT_Face; cdecl; external PANGO_FT_LIB;
function pango_ft2_font_get_coverage(font: PPangoFont; language: PPangoLanguage): PPangoCoverage; cdecl; external PANGO_FT_LIB;
function pango_ot_info_get_type: GType; cdecl; external PANGO_FT_LIB;
function pango_ot_ruleset_get_type: GType; cdecl; external PANGO_FT_LIB;
function pango_ot_info_get(face: FT_Face): PPangoOTInfo; cdecl; external PANGO_FT_LIB;
function pango_ot_info_find_script(info: PPangoOTInfo; table_type: PangoOTTableType; script_tag: PangoOTTag; script_index: Pguint): gboolean; cdecl; external PANGO_FT_LIB;
function pango_ot_info_find_language(info: PPangoOTInfo; table_type: PangoOTTableType; script_index: guint; language_tag: PangoOTTag; language_index: Pguint; required_feature_index: Pguint): gboolean; cdecl; external PANGO_FT_LIB;
function pango_ot_info_find_feature(info: PPangoOTInfo; table_type: PangoOTTableType; feature_tag: PangoOTTag; script_index: guint; language_index: guint; feature_index: Pguint): gboolean; cdecl; external PANGO_FT_LIB;
function pango_ot_info_list_scripts(info: PPangoOTInfo; table_type: PangoOTTableType): PPangoOTTag; cdecl; external PANGO_FT_LIB;
function pango_ot_info_list_languages(info: PPangoOTInfo; table_type: PangoOTTableType; script_index: guint; language_tag: PangoOTTag): PPangoOTTag; cdecl; external PANGO_FT_LIB;
function pango_ot_info_list_features(info: PPangoOTInfo; table_type: PangoOTTableType; tag: PangoOTTag; script_index: guint; language_index: guint): PPangoOTTag; cdecl; external PANGO_FT_LIB;
function pango_ot_buffer_new(font: PPangoFcFont): PPangoOTBuffer; cdecl; external PANGO_FT_LIB;
procedure pango_ot_buffer_destroy(buffer: PPangoOTBuffer); cdecl; external PANGO_FT_LIB;
procedure pango_ot_buffer_clear(buffer: PPangoOTBuffer); cdecl; external PANGO_FT_LIB;
procedure pango_ot_buffer_set_rtl(buffer: PPangoOTBuffer; rtl: gboolean); cdecl; external PANGO_FT_LIB;
procedure pango_ot_buffer_add_glyph(buffer: PPangoOTBuffer; glyph: guint; properties: guint; cluster: guint); cdecl; external PANGO_FT_LIB;
procedure pango_ot_buffer_get_glyphs(const buffer: PPangoOTBuffer; var glyphs: PPangoOTGlyph; var n_glyphs: Integer); cdecl; external PANGO_FT_LIB;
procedure pango_ot_buffer_output(const buffer: PPangoOTBuffer; glyphs: PPangoGlyphString); cdecl; external PANGO_FT_LIB;
procedure pango_ot_buffer_set_zero_width_marks(buffer: PPangoOTBuffer; zero_width_marks: gboolean); cdecl; external PANGO_FT_LIB;
function pango_ot_ruleset_get_for_description(info: PPangoOTInfo; const desc: PPangoOTRulesetDescription): PPangoOTRuleset; cdecl; external PANGO_FT_LIB;
function pango_ot_ruleset_new(info: PPangoOTInfo): PPangoOTRuleset; cdecl; external PANGO_FT_LIB;
function pango_ot_ruleset_new_for(info: PPangoOTInfo; script: PangoScript; language: PPangoLanguage): PPangoOTRuleset; cdecl; external PANGO_FT_LIB;
function pango_ot_ruleset_new_from_description(info: PPangoOTInfo; const desc: PPangoOTRulesetDescription): PPangoOTRuleset; cdecl; external PANGO_FT_LIB;
procedure pango_ot_ruleset_add_feature(ruleset: PPangoOTRuleset; table_type: PangoOTTableType; feature_index: guint; property_bit: gulong); cdecl; external PANGO_FT_LIB;
function pango_ot_ruleset_maybe_add_feature(ruleset: PPangoOTRuleset; table_type: PangoOTTableType; feature_tag: PangoOTTag; property_bit: gulong): gboolean; cdecl; external PANGO_FT_LIB;
function pango_ot_ruleset_maybe_add_features(ruleset: PPangoOTRuleset; table_type: PangoOTTableType; const features: PPangoOTFeatureMap; n_features: guint): guint; cdecl; external PANGO_FT_LIB;
function pango_ot_ruleset_get_feature_count(const ruleset: PPangoOTRuleset; n_gsub_features: Pguint; n_gpos_features: Pguint): guint; cdecl; external PANGO_FT_LIB;
procedure pango_ot_ruleset_substitute(const ruleset: PPangoOTRuleset; buffer: PPangoOTBuffer); cdecl; external PANGO_FT_LIB;
procedure pango_ot_ruleset_position(const ruleset: PPangoOTRuleset; buffer: PPangoOTBuffer); cdecl; external PANGO_FT_LIB;
function pango_ot_tag_to_script(script_tag: PangoOTTag): PangoScript; cdecl; external PANGO_FT_LIB;
function pango_ot_tag_from_script(script: PangoScript): PangoOTTag; cdecl; external PANGO_FT_LIB;
function pango_ot_tag_to_language(language_tag: PangoOTTag): PPangoLanguage; cdecl; external PANGO_FT_LIB;
function pango_ot_tag_from_language(language: PPangoLanguage): PangoOTTag; cdecl; external PANGO_FT_LIB;
function pango_ot_ruleset_description_hash(const desc: PPangoOTRulesetDescription): guint; cdecl; external PANGO_FT_LIB;
function pango_ot_ruleset_description_equal(const desc1: PPangoOTRulesetDescription; const desc2: PPangoOTRulesetDescription): gboolean; cdecl; external PANGO_FT_LIB;
function pango_ot_ruleset_description_copy(const desc: PPangoOTRulesetDescription): PPangoOTRulesetDescription; cdecl; external PANGO_FT_LIB;
procedure  pango_ot_ruleset_description_free(desc: PPangoOTRulesetDescription); cdecl; external PANGO_FT_LIB;


end.