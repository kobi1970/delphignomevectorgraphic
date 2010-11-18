unit pangolib;

// SVN: 2830
// pango-script.h
// pango-matrix.h
// pango-language.h
// pango-gravity.h
// pango-bidi-type.h
// pango-types.h
// pango-coverage.h
// pango-font.h
// pango-attributes.h
// pango-fontset.h
// pango-fontmap.h
// pango-context.h
// pango-item.h
// pango-glyph.h
// pango-break.h
// pango-tabs.h
// pango-glyph-item.h
// pango-layout.h
// pango-engine.h
// pango-renderer.h
// pango-utils.h
// pangowin32.h

{$IFDEF FPC}
  {$MODE OBJFPC}{$H+}
  {$PACKRECORDS C}
{$ELSE}
  {$ALIGN ON}
  {$MINENUMSIZE 4}
{$ENDIF}

interface
uses glib;

(* Pango
 * pango-script.h: Script tag handling
 *
 * Copyright (C) 2002 Red Hat Software
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

(**
 * PangoScriptIter:
 *
 * A #PangoScriptIter is used to iterate through a string
 * and identify ranges in different scripts.
 **)
type
  PPangoScriptIter = ^PangoScriptIter;
  _PangoScriptIter = record
  end;
  PangoScriptIter = _PangoScriptIter;

  PPangoScript = ^PangoScript;
  PangoScript = (                      (* ISO 15924 code *)
      PANGO_SCRIPT_INVALID_CODE = -1,
      PANGO_SCRIPT_COMMON       = 0,   (* Zyyy *)
      PANGO_SCRIPT_INHERITED,          (* Qaai *)
      PANGO_SCRIPT_ARABIC,             (* Arab *)
      PANGO_SCRIPT_ARMENIAN,           (* Armn *)
      PANGO_SCRIPT_BENGALI,            (* Beng *)
      PANGO_SCRIPT_BOPOMOFO,           (* Bopo *)
      PANGO_SCRIPT_CHEROKEE,           (* Cher *)
      PANGO_SCRIPT_COPTIC,             (* Qaac *)
      PANGO_SCRIPT_CYRILLIC,           (* Cyrl (Cyrs) *)
      PANGO_SCRIPT_DESERET,            (* Dsrt *)
      PANGO_SCRIPT_DEVANAGARI,         (* Deva *)
      PANGO_SCRIPT_ETHIOPIC,           (* Ethi *)
      PANGO_SCRIPT_GEORGIAN,           (* Geor (Geon, Geoa) *)
      PANGO_SCRIPT_GOTHIC,             (* Goth *)
      PANGO_SCRIPT_GREEK,              (* Grek *)
      PANGO_SCRIPT_GUJARATI,           (* Gujr *)
      PANGO_SCRIPT_GURMUKHI,           (* Guru *)
      PANGO_SCRIPT_HAN,                (* Hani *)
      PANGO_SCRIPT_HANGUL,             (* Hang *)
      PANGO_SCRIPT_HEBREW,             (* Hebr *)
      PANGO_SCRIPT_HIRAGANA,           (* Hira *)
      PANGO_SCRIPT_KANNADA,            (* Knda *)
      PANGO_SCRIPT_KATAKANA,           (* Kana *)
      PANGO_SCRIPT_KHMER,              (* Khmr *)
      PANGO_SCRIPT_LAO,                (* Laoo *)
      PANGO_SCRIPT_LATIN,              (* Latn (Latf, Latg) *)
      PANGO_SCRIPT_MALAYALAM,          (* Mlym *)
      PANGO_SCRIPT_MONGOLIAN,          (* Mong *)
      PANGO_SCRIPT_MYANMAR,            (* Mymr *)
      PANGO_SCRIPT_OGHAM,              (* Ogam *)
      PANGO_SCRIPT_OLD_ITALIC,         (* Ital *)
      PANGO_SCRIPT_ORIYA,              (* Orya *)
      PANGO_SCRIPT_RUNIC,              (* Runr *)
      PANGO_SCRIPT_SINHALA,            (* Sinh *)
      PANGO_SCRIPT_SYRIAC,             (* Syrc (Syrj, Syrn, Syre) *)
      PANGO_SCRIPT_TAMIL,              (* Taml *)
      PANGO_SCRIPT_TELUGU,             (* Telu *)
      PANGO_SCRIPT_THAANA,             (* Thaa *)
      PANGO_SCRIPT_THAI,               (* Thai *)
      PANGO_SCRIPT_TIBETAN,            (* Tibt *)
      PANGO_SCRIPT_CANADIAN_ABORIGINAL, (* Cans *)
      PANGO_SCRIPT_YI,                 (* Yiii *)
      PANGO_SCRIPT_TAGALOG,            (* Tglg *)
      PANGO_SCRIPT_HANUNOO,            (* Hano *)
      PANGO_SCRIPT_BUHID,              (* Buhd *)
      PANGO_SCRIPT_TAGBANWA,           (* Tagb *)

      (* Unicode-4.0 additions *)
      PANGO_SCRIPT_BRAILLE,            (* Brai *)
      PANGO_SCRIPT_CYPRIOT,            (* Cprt *)
      PANGO_SCRIPT_LIMBU,              (* Limb *)
      PANGO_SCRIPT_OSMANYA,            (* Osma *)
      PANGO_SCRIPT_SHAVIAN,            (* Shaw *)
      PANGO_SCRIPT_LINEAR_B,           (* Linb *)
      PANGO_SCRIPT_TAI_LE,             (* Tale *)
      PANGO_SCRIPT_UGARITIC,           (* Ugar *)

      (* Unicode-4.1 additions *)
      PANGO_SCRIPT_NEW_TAI_LUE,        (* Talu *)
      PANGO_SCRIPT_BUGINESE,           (* Bugi *)
      PANGO_SCRIPT_GLAGOLITIC,         (* Glag *)
      PANGO_SCRIPT_TIFINAGH,           (* Tfng *)
      PANGO_SCRIPT_SYLOTI_NAGRI,       (* Sylo *)
      PANGO_SCRIPT_OLD_PERSIAN,        (* Xpeo *)
      PANGO_SCRIPT_KHAROSHTHI,         (* Khar *)

      (* Unicode-5.0 additions *)
      PANGO_SCRIPT_UNKNOWN,            (* Zzzz *)
      PANGO_SCRIPT_BALINESE,           (* Bali *)
      PANGO_SCRIPT_CUNEIFORM,          (* Xsux *)
      PANGO_SCRIPT_PHOENICIAN,         (* Phnx *)
      PANGO_SCRIPT_PHAGS_PA,           (* Phag *)
      PANGO_SCRIPT_NKO,                (* Nkoo *)

      (* Unicode-5.1 additions *)
      PANGO_SCRIPT_KAYAH_LI,           (* Kali *)
      PANGO_SCRIPT_LEPCHA,             (* Lepc *)
      PANGO_SCRIPT_REJANG,             (* Rjng *)
      PANGO_SCRIPT_SUNDANESE,          (* Sund *)
      PANGO_SCRIPT_SAURASHTRA,         (* Saur *)
      PANGO_SCRIPT_CHAM,               (* Cham *)
      PANGO_SCRIPT_OL_CHIKI,           (* Olck *)
      PANGO_SCRIPT_VAI,                (* Vaii *)
      PANGO_SCRIPT_CARIAN,             (* Cari *)
      PANGO_SCRIPT_LYCIAN,             (* Lyci *)
      PANGO_SCRIPT_LYDIAN              (* Lydi *)
  );

function pango_script_for_unichar(ch: WideChar): PangoScript; cdecl;
function pango_script_iter_new(const text: PAnsiChar; length: Integer): PPangoScriptIter; cdecl;
procedure pango_script_iter_get_range(iter: PPangoScriptIter; start, end_: PPAnsiChar; script: PPangoScript); cdecl;
function pango_script_iter_next(iter: PPangoScriptIter): gboolean; cdecl;
procedure pango_script_iter_free(iter: PPangoScriptIter); cdecl;

(* Pango
 * pango-matrix.h: Matrix manipulation routines
 *
 * Copyright (C) 2002, 2006 Red Hat Software
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

(* A rectangle. Used to store logical and physical extents of glyphs,
 * runs, strings, etc.
 *)
type
  PPangoRectangle = ^TPangoRectangle;
  TPangoRectangle = record
    x: Integer;
    y: Integer;
    width: Integer;
    height: Integer;
  end;

(**
 * PangoMatrix:
 * @xx: 1st component of the transformation matrix
 * @xy: 2nd component of the transformation matrix
 * @yx: 3rd component of the transformation matrix
 * @yy: 4th component of the transformation matrix
 * @x0: x translation
 * @y0: y translation
 *
 * A structure specifying a transformation between user-space
 * coordinates and device coordinates. The transformation
 * is given by
 *
 * <programlisting>
 * x_device = x_user * matrix->xx + y_user * matrix->xy + matrix->x0;
 * y_device = x_user * matrix->yx + y_user * matrix->yy + matrix->y0;
 * </programlisting>
 *
 * Since: 1.6
 **)

  PPangoMatrix = ^TPangoMatrix;
  TPangoMatrix = object
    xx: double;
    xy: double;
    yx: double;
    yy: double;
    x0: double;
    y0: double;
    procedure Init(axx, ayx, axy, ayy, ax0, ay0: Double);
    procedure InitIdentity;
    procedure Translate(tx, ty: Double);
    procedure Scale(scaleX, scaleY: Double);
    procedure Rotate(degrees: Double);
    procedure Concat(newMatrix: PPangoMatrix);
    procedure TransformPoint(x, y: PDouble);
    procedure TransformDistance(dx, dy: PDouble);
    procedure TransformRectangle(rect: PPangoRectangle);
    procedure TransformPixelRectangle(rect: PPangoRectangle);
    function GetFontScaleFactor: Double;
  end;

(**
 * PANGO_TYPE_MATRIX
 *
 * The GObject type for #PangoMatrix
 **)
//#define PANGO_TYPE_MATRIX (pango_matrix_get_type ())

(**
 * PANGO_MATRIX_INIT
 *
 * Constant that can be used to initialize a PangoMatrix to
 * the identity transform.
 *
 * <informalexample><programlisting>
 * PangoMatrix matrix = PANGO_MATRIX_INIT;
 * pango_matrix_rotate (&amp;matrix, 45.);
 * </programlisting></informalexample>
 *
 * Since: 1.6
 **)
const
  PANGO_MATRIX_INIT: TPangoMatrix = (xx: 1; xy: 0; yx: 0; yy: 1; x0: 0; y0: 0);

function pango_matrix_get_type: GType; cdecl;
function pango_matrix_copy(matrix: PPangoMatrix): PPangoMatrix; cdecl;
procedure pango_matrix_free(matrix: PPangoMatrix); cdecl;
procedure pango_matrix_translate(matrix: PPangoMatrix; tx, ty: Double); cdecl;
procedure pango_matrix_scale(matrix: PPangoMatrix; scale_x, scale_y: Double); cdecl;
procedure pango_matrix_rotate(matrix: PPangoMatrix; degrees: Double); cdecl;
procedure pango_matrix_concat(matrix, new_matrix: PPangoMatrix); cdecl;
procedure pango_matrix_transform_point(matrix: PPangoMatrix; x, y: PDouble); cdecl;
procedure pango_matrix_transform_distance(matrix: PPangoMatrix; dx, dy: PDouble); cdecl;
procedure pango_matrix_transform_rectangle (matrix: PPangoMatrix; rect: PPangoRectangle); cdecl;
procedure pango_matrix_transform_pixel_rectangle(matrix: PPangoMatrix; rect: PPangoRectangle); cdecl;
function pango_matrix_get_font_scale_factor(matrix: PPangoMatrix): double; cdecl;

(* Pango
 * pango-language.h: Language handling routines
 *
 * Copyright (C) 1999 Red Hat Software
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

//#include <glib.h>
//#include <glib-object.h>
//
//G_BEGIN_DECLS
type
  PPPangoLanguage = ^PPangoLanguage;
  PPangoLanguage = ^PangoLanguage;
  _PangoLanguage = record
  end;
  PangoLanguage = _PangoLanguage;

// from pango-script
function pango_script_get_sample_language(script: PangoScript): PPangoLanguage; cdecl;

//#define PANGO_TYPE_LANGUAGE (pango_language_get_type ())

function pango_language_get_type: GType; cdecl;
function pango_language_from_string(const language: PAnsiChar): PPangoLanguage; cdecl;

function pango_language_to_string(language: PPangoLanguage): PAnsiChar; cdecl;
(* For back compat.  Will have to keep indefinitely. *)
//#define pango_language_to_string(language) ((const PAnsiChar )language)

function pango_language_get_sample_string(language: PPangoLanguage): PAnsiChar;  cdecl;
function pango_language_get_default: PPangoLanguage; cdecl;

function pango_language_matches(language: PPangoLanguage; const range_list: PAnsiChar): gboolean; cdecl;

function pango_language_includes_script(language: PPangoLanguage; script: PangoScript): gboolean; cdecl;
function pango_language_get_scripts(language: PPangoLanguage; num_scripts: PInteger): PPangoScript; cdecl;

(* Pango
 * pango-gravity.h: Gravity routines
 *
 * Copyright (C) 2006, 2007 Red Hat Software
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

//#include <glib.h>

(**
 * PangoGravity:
 * @PANGO_GRAVITY_SOUTH: Glyphs stand upright (default)
 * @PANGO_GRAVITY_EAST: Glyphs are rotated 90 degrees clockwise
 * @PANGO_GRAVITY_NORTH: Glyphs are upside-down
 * @PANGO_GRAVITY_WEST: Glyphs are rotated 90 degrees counter-clockwise
 * @PANGO_GRAVITY_AUTO: Gravity is resolved from the context matrix
 *
 * The #PangoGravity type represents the orientation of glyphs in a segment
 * of text.  This is useful when rendering vertical text layouts.  In
 * those situations, the layout is rotated using a non-identity PangoMatrix,
 * and then glyph orientation is controlled using #PangoGravity.
 * Not every value in this enumeration makes sense for every usage of
 * #PangoGravity; for example, %PANGO_GRAVITY_AUTO only can be passed to
 * pango_context_set_base_gravity() and can only be returned by
 * pango_context_get_base_gravity().
 *
 * See also: #PangoGravityHint
 *
 * Since: 1.16
 **)
type
  PangoGravity = (
    PANGO_GRAVITY_SOUTH,
    PANGO_GRAVITY_EAST,
    PANGO_GRAVITY_NORTH,
    PANGO_GRAVITY_WEST,
    PANGO_GRAVITY_AUTO
  );

(**
 * PangoGravityHint:
 * @PANGO_GRAVITY_HINT_NATURAL: scripts will take their natural gravity based
 * on the base gravity and the script.  This is the default.
 * @PANGO_GRAVITY_HINT_STRONG: always use the base gravity set, regardless of
 * the script.
 * @PANGO_GRAVITY_HINT_LINE: for scripts not in their natural direction (eg.
 * Latin in East gravity), choose per-script gravity such that every script
 * respects the line progression.  This means, Latin and Arabic will take
 * opposite gravities and both flow top-to-bottom for example.
 *
 * The #PangoGravityHint defines how horizontal scripts should behave in a
 * vertical context.  That is, English excerpt in a vertical paragraph for
 * example.
 *
 * See #PangoGravity.
 *
 * Since: 1.16
 **)
  PangoGravityHint = (
    PANGO_GRAVITY_HINT_NATURAL,
    PANGO_GRAVITY_HINT_STRONG,
    PANGO_GRAVITY_HINT_LINE
  );

(**
 * PANGO_GRAVITY_IS_VERTICAL:
 * @gravity: the #PangoGravity to check
 *
 * Whether a #PangoGravity represents vertical writing directions.
 *
 * Returns: %TRUE if @gravity is %PANGO_GRAVITY_EAST or %PANGO_GRAVITY_WEST,
 *          %FALSE otherwise.
 *
 * Since: 1.16
 **)
//#define PANGO_GRAVITY_IS_VERTICAL(gravity) \
// ((gravity) == PANGO_GRAVITY_EAST || (gravity) == PANGO_GRAVITY_WEST)

function pango_gravity_to_rotation(gravity: PangoGravity): double; cdecl;
function pango_gravity_get_for_matrix (const matrix: PPangoMatrix): PangoGravity; cdecl;
function pango_gravity_get_for_script (script: PangoScript; base_gravity: PangoGravity; hint: PangoGravityHint): PangoGravity; cdecl;

(* Pango
 * pango-bidi-type.h: Bidirectional Character Types
 *
 * Copyright (C) 2008 Jürg Billeter <j@bitron.ch>
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

(**
 * PangoBidiType:
 * @PANGO_BIDI_TYPE_L: Left-to-Right
 * @PANGO_BIDI_TYPE_LRE: Left-to-Right Embedding
 * @PANGO_BIDI_TYPE_LRO: Left-to-Right Override
 * @PANGO_BIDI_TYPE_R: Right-to-Left
 * @PANGO_BIDI_TYPE_AL: Right-to-Left Arabic
 * @PANGO_BIDI_TYPE_RLE: Right-to-Left Embedding
 * @PANGO_BIDI_TYPE_RLO: Right-to-Left Override
 * @PANGO_BIDI_TYPE_PDF: Pop Directional Format
 * @PANGO_BIDI_TYPE_EN: European Number
 * @PANGO_BIDI_TYPE_ES: European Number Separator
 * @PANGO_BIDI_TYPE_ET: European Number Terminator
 * @PANGO_BIDI_TYPE_AN: Arabic Number
 * @PANGO_BIDI_TYPE_CS: Common Number Separator
 * @PANGO_BIDI_TYPE_NSM: Nonspacing Mark
 * @PANGO_BIDI_TYPE_BN: Boundary Neutral
 * @PANGO_BIDI_TYPE_B: Paragraph Separator
 * @PANGO_BIDI_TYPE_S: Segment Separator
 * @PANGO_BIDI_TYPE_WS: Whitespace
 * @PANGO_BIDI_TYPE_ON: Other Neutrals
 *
 * The #PangoBidiType type represents the bidirectional character
 * type of a Unicode character as specified by the
 * <ulink url="http://www.unicode.org/reports/tr9/">Unicode bidirectional algorithm</ulink>.
 *
 * Since: 1.22
 **)
type
  PangoBidiType = (
    (* Strong types *)
    PANGO_BIDI_TYPE_L,
    PANGO_BIDI_TYPE_LRE,
    PANGO_BIDI_TYPE_LRO,
    PANGO_BIDI_TYPE_R,
    PANGO_BIDI_TYPE_AL,
    PANGO_BIDI_TYPE_RLE,
    PANGO_BIDI_TYPE_RLO,

    (* Weak types *)
    PANGO_BIDI_TYPE_PDF,
    PANGO_BIDI_TYPE_EN,
    PANGO_BIDI_TYPE_ES,
    PANGO_BIDI_TYPE_ET,
    PANGO_BIDI_TYPE_AN,
    PANGO_BIDI_TYPE_CS,
    PANGO_BIDI_TYPE_NSM,
    PANGO_BIDI_TYPE_BN,

    (* Neutral types *)
    PANGO_BIDI_TYPE_B,
    PANGO_BIDI_TYPE_S,
    PANGO_BIDI_TYPE_WS,
    PANGO_BIDI_TYPE_ON
  );

function pango_bidi_type_for_unichar (ch: WideChar): PangoBidiType; cdecl;

(**
 * PangoDirection:
 * @PANGO_DIRECTION_LTR: A strong left-to-right direction
 * @PANGO_DIRECTION_RTL: A strong right-to-left direction
 * @PANGO_DIRECTION_TTB_LTR: Deprecated value; treated the
 *   same as %PANGO_DIRECTION_RTL.
 * @PANGO_DIRECTION_TTB_RTL: Deprecated value; treated the
 *   same as %PANGO_DIRECTION_LTR
 * @PANGO_DIRECTION_WEAK_LTR: A weak left-to-right direction
 * @PANGO_DIRECTION_WEAK_RTL: A weak right-to-left direction
 * @PANGO_DIRECTION_NEUTRAL: No direction specified
 *
 * The #PangoDirection type represents a direction in the
 * Unicode bidirectional algorithm; not every value in this
 * enumeration makes sense for every usage of #PangoDirection;
 * for example, the return value of pango_unichar_direction()
 * and pango_find_base_dir() cannot be %PANGO_DIRECTION_WEAK_LTR
 * or %PANGO_DIRECTION_WEAK_RTL, since every character is either
 * neutral or has a strong direction; on the other hand
 * %PANGO_DIRECTION_NEUTRAL doesn't make sense to pass
 * to pango_itemize_with_base_dir().
 *
 * The %PANGO_DIRECTION_TTB_LTR, %PANGO_DIRECTION_TTB_RTL
 * values come from an earlier interpretation of this
 * enumeration as the writing direction of a block of
 * text and are no longer used; See #PangoGravity for how
 * vertical text is handled in Pango.
 **)

type
  PPangoDirection = ^PangoDirection;
  PangoDirection = (
    PANGO_DIRECTION_LTR,
    PANGO_DIRECTION_RTL,
    PANGO_DIRECTION_TTB_LTR,
    PANGO_DIRECTION_TTB_RTL,
    PANGO_DIRECTION_WEAK_LTR,
    PANGO_DIRECTION_WEAK_RTL,
    PANGO_DIRECTION_NEUTRAL
  );

function pango_unichar_direction(ch: WideChar): PangoDirection; cdecl;
function pango_find_base_dir(const text: PAnsiChar; length: Integer): PangoDirection; cdecl;

//#ifndef PANGO_DISABLE_DEPRECATED
 function pango_get_mirror_char(ch: WideChar; mirrored_ch: PWideChar): gboolean; cdecl;
//#endif

(* Pango
 * pango-types.h:
 *
 * Copyright (C) 1999 Red Hat Software
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
(* Logical attributes of a character.
 *)
  PPangoLogAttr = ^PangoLogAttr;
  _PangoLogAttr = (
    is_line_break,       (* Can break line in front of character *)
    is_mandatory_break,  (* Must break line in front of character *)
    is_char_break,       (* Can break here when doing char wrap *)
    is_white,            (* Whitespace character *)
    (* Cursor can appear in front of character (i.e. this is a grapheme
     * boundary, or the first character in the text).
     *)
    is_cursor_position,
    (* Note that in degenerate cases, you could have both start/end set on
     * some text, most likely for sentences (e.g. no space after a period, so
     * the next sentence starts right away).
     *)
    is_word_start,      (* first character in a word *)
    is_word_end,      (* is first non-word char after a word *)
    (* There are two ways to divide sentences. The first assigns all
     * intersentence whitespace/control/format chars to some sentence,
     * so all chars are in some sentence; is_sentence_boundary denotes
     * the boundaries there. The second way doesn't assign
     * between-sentence spaces, etc. to any sentence, so
     * is_sentence_start/is_sentence_end mark the boundaries of those
     * sentences.
     *)
    is_sentence_boundary,
    is_sentence_start,  (* first character in a sentence *)
    is_sentence_end,    (* first non-sentence char after a sentence *)
    (* If set, backspace deletes one character rather than
     * the entire grapheme cluster.
     *)
    backspace_deletes_character,
    (* Only few space variants (U+0020 and U+00A0) have variable
     * width during justification.
     *)
    is_expandable_space,
    (* Word boundary as defined by UAX#29 *)
    is_word_boundary (* is NOT in the middle of a word *)
  );
  PangoLogAttr = set of _PangoLogAttr;


(**
 * PangoEngine:
 *
 * #PangoEngine is the base class for all types of language and
 * script specific engines. It has no functionality by itself.
 **)
  PPangoEngine = ^PangoEngine;
  _PangoEngine = record
    parent_instance: GObject;
  end;
  PangoEngine = _PangoEngine;

(**
 * PangoEngineLang:
 *
 * The #PangoEngineLang class is implemented by engines that
 * customize the rendering-system independent part of the
 * Pango pipeline for a particular script or language. For
 * instance, a custom #PangoEngineLang could be provided for
 * Thai to implement the dictionary-based word boundary
 * lookups needed for that language.
 **)
  PPangoEngineLang = ^PangoEngineLang;
  _PangoEngineLang = record
    parent_instance: PangoEngine;
  end;
  PangoEngineLang = _PangoEngineLang;


(**
 * PangoEngineShape
 *
 * The #PangoEngineShape class is implemented by engines that
 * customize the rendering-system dependent part of the
 * Pango pipeline for a particular script or language.
 * A #PangoEngineShape implementation is then specific to both
 * a particular rendering system or group of rendering systems
 * and to a particular script. For instance, there is one
 * #PangoEngineShape implementation to handle shaping Arabic
 * for Fontconfig-based backends.
 **)
  PPangoEngineShape = ^PangoEngineShape;
  _PangoEngineShape = record
    parent_instance: PangoEngine;
  end;
  PangoEngineShape = _PangoEngineShape;


  PPangoFont = ^PangoFont;
  _PangoFont = record
    parent_instance: GObject;
  end;
  PangoFont = _PangoFont;

  PPangoFontMap = ^PangoFontMap;
  _PangoFontMap = record end;
  PangoFontMap = _PangoFontMap;

(* A index of a glyph into a font. Rendering system dependent *)
  PangoGlyph = type Cardinal;

const
  PANGO_SCALE = 1024;
//#define PANGO_PIXELS(d) (((int)(d) + 512) >> 10)
//#define PANGO_PIXELS_FLOOR(d) (((int)(d)) >> 10)
//#define PANGO_PIXELS_CEIL(d) (((int)(d) + 1023) >> 10)

(* The above expressions are just slightly wrong for floating point d;
 * For example we'd expect PANGO_PIXELS(-512.5) => -1 but instead we get 0.
 * That's unlikely to matter for practical use and the expression is much
 * more compact and faster than alternatives that work exactly for both
 * integers and floating point.
 *
 * PANGO_PIXELS also behaves differently for +512 and -512.
 *)

//#define PANGO_UNITS_ROUND(d)    \
//  (((d) + (PANGO_SCALE >> 1)) & ~(PANGO_SCALE - 1))

function pango_units_from_double(d: Double): Integer; cdecl;
function pango_units_to_double(i: Integer): Double; cdecl;

(* Macros to translate from extents rectangles to ascent/descent/lbearing/rbearing
 *)
//#define PANGO_ASCENT(rect) (-(rect).y)
//#define PANGO_DESCENT(rect) ((rect).y + (rect).height)
//#define PANGO_LBEARING(rect) ((rect).x)
//#define PANGO_RBEARING(rect) ((rect).x + (rect).width)

procedure pango_extents_to_pixels (inclusive, nearest: PPangoRectangle); cdecl;

(* Pango
 * pango-coverage.h: Coverage sets for fonts
 *
 * Copyright (C) 2000 Red Hat Software
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
  PPangoCoverage = ^PangoCoverage;
  _PangoCoverage = record end;
  PangoCoverage = _PangoCoverage;

 PangoCoverageLevel = (
    PANGO_COVERAGE_NONE,
    PANGO_COVERAGE_FALLBACK,
    PANGO_COVERAGE_APPROXIMATE,
    PANGO_COVERAGE_EXACT
  );

function pango_coverage_new: PPangoCoverage; cdecl;
function pango_coverage_ref(coverage: PPangoCoverage): PPangoCoverage; cdecl;
procedure pango_coverage_unref(coverage: PPangoCoverage); cdecl;
function pango_coverage_copy(coverage: PPangoCoverage): PPangoCoverage; cdecl
function pango_coverage_get(coverage: PPangoCoverage; index_: Integer): PangoCoverageLevel; cdecl;
procedure pango_coverage_set(coverage: PPangoCoverage; index_: Integer; level: PangoCoverageLevel); cdecl;
procedure pango_coverage_max(coverage, other: PPangoCoverage); cdecl;
procedure pango_coverage_to_bytes(coverage: PPangoCoverage; bytes: PPointer; n_bytes: PInteger);  cdecl;
function pango_coverage_from_bytes(bytes: PByte; n_bytes: Integer): PPangoCoverage;  cdecl;

(* Pango
 * pango-font.h: Font handling
 *
 * Copyright (C) 2000 Red Hat Software
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
  PPPangoFontDescription = ^PPangoFontDescription;
  PPangoFontDescription = ^PangoFontDescription;
  _PangoFontDescription = record end;
  PangoFontDescription = _PangoFontDescription;

  PPangoFontMetrics = ^PangoFontMetrics;
  _PangoFontMetrics = record
    ref_count: Cardinal;
    ascent: Integer;
    descent: Integer;
    approximate_char_width: Integer;
    approximate_digit_width: Integer;
    underline_position: Integer;
    underline_thickness: Integer;
    strikethrough_position: Integer;
    strikethrough_thickness: Integer;
  end;
  PangoFontMetrics = _PangoFontMetrics;

(**
 * PangoStyle:
 * @PANGO_STYLE_NORMAL: the font is upright.
 * @PANGO_STYLE_OBLIQUE: the font is slanted, but in a roman style.
 * @PANGO_STYLE_ITALIC: the font is slanted in an italic style.
 *
 * An enumeration specifying the various slant styles possible for a font.
 **)
  PPangoStyle = ^PangoStyle;
  PangoStyle = (
    PANGO_STYLE_NORMAL,
    PANGO_STYLE_OBLIQUE,
    PANGO_STYLE_ITALIC
  );

  PPangoVariant = ^PangoVariant;
  PangoVariant = (
    PANGO_VARIANT_NORMAL,
    PANGO_VARIANT_SMALL_CAPS
  );

  PPangoWeight = ^PangoWeight;
  PangoWeight = (
    PANGO_WEIGHT_THIN = 100,
    PANGO_WEIGHT_ULTRALIGHT = 200,
    PANGO_WEIGHT_LIGHT = 300,
    PANGO_WEIGHT_BOOK = 380,
    PANGO_WEIGHT_NORMAL = 400,
    PANGO_WEIGHT_MEDIUM = 500,
    PANGO_WEIGHT_SEMIBOLD = 600,
    PANGO_WEIGHT_BOLD = 700,
    PANGO_WEIGHT_ULTRABOLD = 800,
    PANGO_WEIGHT_HEAVY = 900,
    PANGO_WEIGHT_ULTRAHEAVY = 1000
   );

  PPangoStretch = ^PangoStretch;
  PangoStretch = (
    PANGO_STRETCH_ULTRA_CONDENSED,
    PANGO_STRETCH_EXTRA_CONDENSED,
    PANGO_STRETCH_CONDENSED,
    PANGO_STRETCH_SEMI_CONDENSED,
    PANGO_STRETCH_NORMAL,
    PANGO_STRETCH_SEMI_EXPANDED,
    PANGO_STRETCH_EXPANDED,
    PANGO_STRETCH_EXTRA_EXPANDED,
    PANGO_STRETCH_ULTRA_EXPANDED
  );

  PangoFontMask = (
    PANGO_FONT_MASK_FAMILY  = 1 shl 0,
    PANGO_FONT_MASK_STYLE   = 1 shl 1,
    PANGO_FONT_MASK_VARIANT = 1 shl 2,
    PANGO_FONT_MASK_WEIGHT  = 1 shl 3,
    PANGO_FONT_MASK_STRETCH = 1 shl 4,
    PANGO_FONT_MASK_SIZE    = 1 shl 5,
    PANGO_FONT_MASK_GRAVITY = 1 shl 6
  );

(* CSS scale factors (1.2 factor between each size) *)
const
  PANGO_SCALE_XX_SMALL : double = 0.5787037037037;
  PANGO_SCALE_X_SMALL  : double = 0.6444444444444;
  PANGO_SCALE_SMALL    : double = 0.8333333333333;
  PANGO_SCALE_MEDIUM   : double = 1.0;
  PANGO_SCALE_LARGE    : double = 1.2;
  PANGO_SCALE_X_LARGE  : double = 1.4399999999999;
  PANGO_SCALE_XX_LARGE : double = 1.728;

(*
 * PangoFontDescription
 *)

//#define PANGO_TYPE_FONT_DESCRIPTION (pango_font_description_get_type ())

function pango_font_description_get_type: GType; cdecl;
function pango_font_description_new: PPangoFontDescription; cdecl;
function pango_font_description_copy(const desc: PPangoFontDescription): PPangoFontDescription; cdecl;
function pango_font_description_copy_static(const desc: PPangoFontDescription): PPangoFontDescription; cdecl;
function pango_font_description_hash(const desc: PPangoFontDescription): Cardinal; cdecl;
function pango_font_description_equal(const desc1, desc2: PPangoFontDescription): gboolean; cdecl;
procedure pango_font_description_free(desc: PPangoFontDescription); cdecl;
procedure pango_font_descriptions_free(descs: PPPangoFontDescription; n_descs: Integer); cdecl;
procedure pango_font_description_set_family(desc: PPangoFontDescription; const family: PAnsiChar); cdecl;
procedure pango_font_description_set_family_static(desc: PPangoFontDescription; const family: PAnsiChar); cdecl;
function pango_font_description_get_family(const desc: PPangoFontDescription): PAnsiChar; cdecl;
procedure pango_font_description_set_style(desc: PPangoFontDescription; style: PangoStyle); cdecl;
function pango_font_description_get_style(const desc: PPangoFontDescription): PangoStyle; cdecl;
procedure pango_font_description_set_variant(desc: PPangoFontDescription; variant: PangoVariant); cdecl;
function pango_font_description_get_variant(const desc: PPangoFontDescription): PangoVariant; cdecl;
procedure pango_font_description_set_weight(desc: PPangoFontDescription; weight: PangoWeight); cdecl;
function pango_font_description_get_weight(const desc: PPangoFontDescription): PangoWeight; cdecl;
procedure pango_font_description_set_stretch(desc: PPangoFontDescription; stretch: PangoStretch); cdecl;
function pango_font_description_get_stretch(const desc: PPangoFontDescription): PangoStretch; cdecl;
procedure pango_font_description_set_size(desc: PPangoFontDescription; size: Integer); cdecl;
function pango_font_description_get_size(const desc: PPangoFontDescription): Integer; cdecl;
procedure pango_font_description_set_absolute_size(desc: PPangoFontDescription; size: Double); cdecl;
function pango_font_description_get_size_is_absolute(const desc: PPangoFontDescription): gboolean; cdecl;
procedure pango_font_description_set_gravity(desc: PPangoFontDescription; gravity: PangoGravity); cdecl;
function pango_font_description_get_gravity(const desc: PPangoFontDescription): PangoGravity; cdecl;
function pango_font_description_get_set_fields(const desc: PPangoFontDescription): PangoFontMask; cdecl;
procedure pango_font_description_unset_fields(desc: PPangoFontDescription; to_unset: PangoFontMask); cdecl;
procedure pango_font_description_merge(desc: PPangoFontDescription; const desc_to_merge: PPangoFontDescription; replace_existing: gboolean); cdecl;
procedure pango_font_description_merge_static(desc: PPangoFontDescription; const desc_to_merge: PPangoFontDescription; replace_existing: gboolean); cdecl;
function pango_font_description_better_match(const desc: PPangoFontDescription; const old_match: PPangoFontDescription; const new_match: PPangoFontDescription): gboolean; cdecl;
function pango_font_description_from_string(const str: PAnsiChar): PPangoFontDescription; cdecl;
function pango_font_description_to_string(const desc: PPangoFontDescription): PAnsiChar; cdecl;
function pango_font_description_to_filename(const desc: PPangoFontDescription): PAnsiChar; cdecl;

(*
 * PangoFontMetrics
 *)

//#define PANGO_TYPE_FONT_METRICS  (pango_font_metrics_get_type ())
function pango_font_metrics_get_type: GType; cdecl;
function pango_font_metrics_ref(metrics: PPangoFontMetrics): PPangoFontMetrics; cdecl;
procedure pango_font_metrics_unref(metrics: PPangoFontMetrics); cdecl;
function pango_font_metrics_get_ascent(metrics: PPangoFontMetrics): Integer; cdecl;
function pango_font_metrics_get_descent(metrics: PPangoFontMetrics): Integer; cdecl;
function pango_font_metrics_get_approximate_char_width(metrics: PPangoFontMetrics): Integer; cdecl;
function pango_font_metrics_get_approximate_digit_width(metrics: PPangoFontMetrics): Integer; cdecl;
function pango_font_metrics_get_underline_position(metrics: PPangoFontMetrics): Integer; cdecl;
function pango_font_metrics_get_underline_thickness(metrics: PPangoFontMetrics): Integer; cdecl;
function pango_font_metrics_get_strikethrough_position(metrics: PPangoFontMetrics): Integer; cdecl;
function pango_font_metrics_get_strikethrough_thickness(metrics: PPangoFontMetrics): Integer; cdecl;

//#ifdef PANGO_ENABLE_BACKEND

function pango_font_metrics_new: PPangoFontMetrics; cdecl;

//#endif (* PANGO_ENABLE_BACKEND *)

(*
 * PangoFontFamily
 *)

//#define PANGO_TYPE_FONT_FAMILY              (pango_font_family_get_type ())
//#define PANGO_FONT_FAMILY(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_FONT_FAMILY, PangoFontFamily))
//#define PANGO_IS_FONT_FAMILY(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_FONT_FAMILY))

type
  PPPPangoFontFamily = ^PPPangoFontFamily;
  PPPangoFontFamily = ^PPangoFontFamily;
  PPangoFontFamily = ^PangoFontFamily;
  _PangoFontFamily = record
    parent_instance: GObject;
  end;
  PangoFontFamily = _PangoFontFamily;

  PPPPangoFontFace = ^PPPangoFontFace;
  PPPangoFontFace = ^PPangoFontFace;
  PPangoFontFace = ^PangoFontFace;
  _PangoFontFace = record
    parent_instance: GObject;
  end;
  PangoFontFace = _PangoFontFace;


function pango_font_family_get_type: GType; cdecl;
procedure pango_font_family_list_faces(family: PPangoFontFamily; faces: PPPPangoFontFace; n_faces: PInteger); cdecl;
function pango_font_family_get_name(family: PPangoFontFamily): PAnsiChar; cdecl;
function pango_font_family_is_monospace(family: PPangoFontFamily): gboolean; cdecl;

//#ifdef PANGO_ENABLE_BACKEND

//#define PANGO_FONT_FAMILY_CLASS(klass)      (G_TYPE_CHECK_CLASS_CAST ((klass), PANGO_TYPE_FONT_FAMILY, PangoFontFamilyClass))
//#define PANGO_IS_FONT_FAMILY_CLASS(klass)   (G_TYPE_CHECK_CLASS_TYPE ((klass), PANGO_TYPE_FONT_FAMILY))
//#define PANGO_FONT_FAMILY_GET_CLASS(obj)    (G_TYPE_INSTANCE_GET_CLASS ((obj), PANGO_TYPE_FONT_FAMILY, PangoFontFamilyClass))

type
  PPangoFontFamilyClass = ^PangoFontFamilyClass;
  _PangoFontFamilyClass = record
    parent_class: GObjectClass;

    (*< public >*)

    list_faces: procedure(family: PPangoFontFamily; faces: PPPPangoFontFace; n_faces: PInteger);  cdecl;
    get_name: function(family: PPangoFontFamily): PAnsiChar; cdecl;
    is_monospace: function(family: PPangoFontFamily): gboolean; cdecl;

    (*< private >*)

    (* Padding for future expansion *)
    _pango_reserved2: procedure;
    _pango_reserved3: procedure;
    _pango_reserved4: procedure;
  end;
  PangoFontFamilyClass = _PangoFontFamilyClass;

//#endif (* PANGO_ENABLE_BACKEND *)

(*
 * PangoFontFace
 *)

//#define PANGO_TYPE_FONT_FACE              (pango_font_face_get_type ())
//#define PANGO_FONT_FACE(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_FONT_FACE, PangoFontFace))
//#define PANGO_IS_FONT_FACE(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_FONT_FACE))

function pango_font_face_get_type: GType; cdecl;

function pango_font_face_describe(face: PPangoFontFace): PPangoFontDescription; cdecl;
function pango_font_face_get_face_name(face: PPangoFontFace): PAnsiChar; cdecl;
procedure pango_font_face_list_sizes(face: PPangoFontFace; var sizes: Pinteger; var n_sizes: Integer); cdecl;
function pango_font_face_is_synthesized(face: PPangoFontFace): gboolean; cdecl;

//#ifdef PANGO_ENABLE_BACKEND

//#define PANGO_FONT_FACE_CLASS(klass)      (G_TYPE_CHECK_CLASS_CAST ((klass), PANGO_TYPE_FONT_FACE, PangoFontFaceClass))
//#define PANGO_IS_FONT_FACE_CLASS(klass)   (G_TYPE_CHECK_CLASS_TYPE ((klass), PANGO_TYPE_FONT_FACE))
//#define PANGO_FONT_FACE_GET_CLASS(obj)    (G_TYPE_INSTANCE_GET_CLASS ((obj), PANGO_TYPE_FONT_FACE, PangoFontFaceClass))

type
  PPangoFontFaceClass = ^PangoFontFaceClass;
  _PangoFontFaceClass = record
    parent_class: GObjectClass;

    (*< public >*)

    get_face_name: function (face: PPangoFontFace): PAnsiChar; cdecl;
    describe: function(face: PPangoFontFace): PPangoFontDescription; cdecl;
    list_sizes: procedure(face: PPangoFontFace; var sizes: PInteger; n_sizes: PInteger); cdecl;
    is_synthesized: function(face: PPangoFontFace): gboolean; cdecl;

    (*< private >*)

    (* Padding for future expansion *)
    _pango_reserved3: procedure;
    _pango_reserved4: procedure;
  end;
  PangoFontFaceClass = _PangoFontFaceClass;

//#endif (* PANGO_ENABLE_BACKEND *)

(*
 * PangoFont
 *)

//#define PANGO_TYPE_FONT              (pango_font_get_type ())
//#define PANGO_FONT(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_FONT, PangoFont))
//#define PANGO_IS_FONT(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_FONT))

function pango_font_get_type: GType; cdecl;
function pango_font_describe(font: PPangoFont): PPangoFontDescription; cdecl;
function pango_font_describe_with_absolute_size(font: PPangoFont): PPangoFontDescription; cdecl;
function pango_font_get_coverage(font: PPangoFont; language: PPangoLanguage): PPangoCoverage; cdecl;
function pango_font_find_shaper(font: PPangoFont; language: PPangoLanguage; ch: Cardinal): PPangoEngineShape; cdecl;
function pango_font_get_metrics(font: PPangoFont; language: PPangoLanguage): PPangoFontMetrics; cdecl;
procedure pango_font_get_glyph_extents(font: PPangoFont; glyph: PangoGlyph; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl;
function pango_font_get_font_map(font: PPangoFont): PPangoFontMap; cdecl;

//#ifdef PANGO_ENABLE_BACKEND

//#define PANGO_FONT_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), PANGO_TYPE_FONT, PangoFontClass))
//#define PANGO_IS_FONT_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), PANGO_TYPE_FONT))
//#define PANGO_FONT_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), PANGO_TYPE_FONT, PangoFontClass))

type
  PPangoFontClass = ^PangoFontClass;
  _PangoFontClass = record
    parent_class: GObjectClass;

    (*< public >*)

    describe: function(font: PPangoFont): PPangoFontDescription; cdecl;
    get_coverage: function(font: PPangoFont; lang: PPangoLanguage): PPangoCoverage; cdecl;
    find_shaper: function(font: PPangoFont; lang: PPangoLanguage; ch: Cardinal): PPangoEngineShape; cdecl;
    get_glyph_extents: procedure(font: PPangoFont; glyph: PangoGlyph; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl;
    get_metrics: function(font: PPangoFont; language: PPangoLanguage): PPangoFontMetrics; cdecl;
    get_font_map: function(font: PPangoFont): PPangoFontMap; cdecl;
    describe_absolute: function(font: PPangoFont): PPangoFontDescription; cdecl;

    (*< private >*)

    (* Padding for future expansion *)
    _pango_reserved1: procedure;
    _pango_reserved2: procedure;
  end;
  PangoFontClass = _PangoFontClass;

(* used for very rare and miserable situtations that we cannot even
 * draw a hexbox
 *)
const
  PANGO_UNKNOWN_GLYPH_WIDTH  = 10;
  PANGO_UNKNOWN_GLYPH_HEIGHT = 14;

//#endif (* PANGO_ENABLE_BACKEND *)

PANGO_GLYPH_EMPTY         : Cardinal = $0FFFFFFF;
PANGO_GLYPH_INVALID_INPUT : Cardinal = $FFFFFFFF;
PANGO_GLYPH_UNKNOWN_FLAG  : Cardinal = $10000000;
//PANGO_GET_UNKNOWN_GLYPH(wc) ((PangoGlyph)(wc)|PANGO_GLYPH_UNKNOWN_FLAG)

(* Pango
 * pango-attributes.h: Attributed text
 *
 * Copyright (C) 2000 Red Hat Software
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

(* PangoColor *)
type
  PPangoColor = ^TPangoColor;
  TPangoColor = object
    red: Word;
    green: Word;
    blue: Word;
    function Parse(const spec: AnsiString): Boolean;
    function ToString: string;
  end;

//#define PANGO_TYPE_COLOR pango_color_get_type ()
function pango_color_get_type: GType; cdecl;

function pango_color_copy(const src: PPangoColor ): PPangoColor; cdecl;
procedure pango_color_free(color: PPangoColor); cdecl;
function pango_color_parse(color: PPangoColor; const spec: PAnsiChar): gboolean; cdecl;
function pango_color_to_string(const color: PPangoColor): PAnsiChar; cdecl;

(* Attributes *)
type

  PangoAttrType = (
    PANGO_ATTR_INVALID,           (* 0 is an invalid attribute type *)
    PANGO_ATTR_LANGUAGE,  (* PangoAttrLanguage *)
    PANGO_ATTR_FAMILY,  (* PangoAttrString *)
    PANGO_ATTR_STYLE,  (* PangoAttrInt *)
    PANGO_ATTR_WEIGHT,  (* PangoAttrInt *)
    PANGO_ATTR_VARIANT,  (* PangoAttrInt *)
    PANGO_ATTR_STRETCH,  (* PangoAttrInt *)
    PANGO_ATTR_SIZE,  (* PangoAttrSize *)
    PANGO_ATTR_FONT_DESC,  (* PangoAttrFontDesc *)
    PANGO_ATTR_FOREGROUND, (* PangoAttrColor *)
    PANGO_ATTR_BACKGROUND, (* PangoAttrColor *)
    PANGO_ATTR_UNDERLINE,  (* PangoAttrInt *)
    PANGO_ATTR_STRIKETHROUGH, (* PangoAttrInt *)
    PANGO_ATTR_RISE,  (* PangoAttrInt *)
    PANGO_ATTR_SHAPE,  (* PangoAttrShape *)
    PANGO_ATTR_SCALE,             (* PangoAttrFloat *)
    PANGO_ATTR_FALLBACK,          (* PangoAttrInt *)
    PANGO_ATTR_LETTER_SPACING,    (* PangoAttrInt *)
    PANGO_ATTR_UNDERLINE_COLOR, (* PangoAttrColor *)
    PANGO_ATTR_STRIKETHROUGH_COLOR,(* PangoAttrColor *)
    PANGO_ATTR_ABSOLUTE_SIZE, (* PangoAttrSize *)
    PANGO_ATTR_GRAVITY,  (* PangoAttrInt *)
    PANGO_ATTR_GRAVITY_HINT (* PangoAttrInt *)
  );

  PangoUnderline = (
    PANGO_UNDERLINE_NONE,
    PANGO_UNDERLINE_SINGLE,
    PANGO_UNDERLINE_DOUBLE,
    PANGO_UNDERLINE_LOW,
    PANGO_UNDERLINE_ERROR
  );

  PPangoAttribute = ^PangoAttribute;
  PPangoAttrClass = ^PangoAttrClass;
  PPangoAttrString = ^PangoAttrString;
  PPangoAttrLanguage = ^PangoAttrLanguage;
  PPangoAttrInt = ^PangoAttrInt;
  PPangoAttrSize = ^PangoAttrSize;
  PPangoAttrFloat = ^PangoAttrFloat;
  PPangoAttrColor = ^PangoAttrColor;
  PPangoAttrFontDesc = ^PangoAttrFontDesc;
  PPangoAttrShape = ^PangoAttrShape;
  PPPangoAttrList = ^PPangoAttrList;
  PPangoAttrList = ^PangoAttrList;
  PPangoAttrIterator = ^PangoAttrIterator;

  PangoAttrFilterFunc = function(attribute: PPangoAttribute; data: Pointer): gboolean; cdecl;
  PangoAttrDataCopyFunc = function(const data: Pointer): Pointer; cdecl;
  GDestroyNotify = procedure(data: Pointer); cdecl;


  _PangoAttribute = record
    klass: PPangoAttrClass;
    start_index: Cardinal; (* in bytes *)
    end_index: Cardinal;    (* in bytes. The character at this index is not included *)
  end;
  PangoAttribute = _PangoAttribute;

  _PangoAttrClass = record
    (*< public >*)
    type_: PangoAttrType;
    copy: function(const attr: PPangoAttribute): PPangoAttribute; cdecl;
    destroy: procedure(attr: PPangoAttribute); cdecl;
    equal: function(const attr1, attr2: PPangoAttribute): gboolean; cdecl;
  end;
  PangoAttrClass = _PangoAttrClass;

  _PangoAttrString = record
    attr: PangoAttribute;
    value: PAnsiChar;
  end;
  PangoAttrString = _PangoAttrString;

  _PangoAttrLanguage = record
    attr: PangoAttribute;
    value: PPangoLanguage;
  end;
  PangoAttrLanguage = _PangoAttrLanguage;

  _PangoAttrInt = record
    attr: PangoAttribute;
    value: Integer;
  end;
  PangoAttrInt = _PangoAttrInt;

  _PangoAttrSize = record
    attr: PangoAttribute;
    size: Integer;
    absolute_: Cardinal;//  : 1; ?? todo
  end;
  PangoAttrSize = _PangoAttrSize;

  _PangoAttrFloat = record
    attr: PangoAttribute;
    value: double;
  end;
  PangoAttrFloat = _PangoAttrFloat;

  _PangoAttrColor = record
    attr: PangoAttribute;
    color: TPangoColor;
  end;
  PangoAttrColor = _PangoAttrColor;

  _PangoAttrFontDesc = record
    attr: PangoAttribute;
    desc: PPangoFontDescription;
  end;
  PangoAttrFontDesc = _PangoAttrFontDesc;

  _PangoAttrShape = record
    attr: PangoAttribute;
    ink_rect: TPangoRectangle;
    logical_rect: TPangoRectangle;
    data: Pointer;
    copy_func: PangoAttrDataCopyFunc;
    destroy_func: GDestroyNotify;
  end;
  PangoAttrShape = _PangoAttrShape;

  //#define PANGO_TYPE_ATTR_LIST pango_attr_list_get_type ()

  _PangoAttrList = record end;
  PangoAttrList = _PangoAttrList;

  _PangoAttrIterator = record end;
  PangoAttrIterator = _PangoAttrIterator;

const
  PANGO_ATTR_INDEX_FROM_TEXT_BEGINNING = 0;
  PANGO_ATTR_INDEX_TO_TEXT_END = High(Cardinal);

function pango_attr_type_register(const name: PAnsiChar): PangoAttrType; cdecl;
function pango_attr_type_get_name(type_: PangoAttrType): PAnsiChar; cdecl;

procedure pango_attribute_init(attr: PPangoAttribute; const klass: PPangoAttrClass); cdecl;
function pango_attribute_copy(const attr: PPangoAttribute): PPangoAttribute; cdecl;
procedure pango_attribute_destroy(attr: PPangoAttribute); cdecl;
function pango_attribute_equal(const attr1: PPangoAttribute; const attr2: PPangoAttribute): gboolean; cdecl;

function pango_attr_language_new(language: PPangoLanguage): PPangoAttribute; cdecl;
function pango_attr_family_new(const family: PAnsiChar): PPangoAttribute; cdecl;
function pango_attr_foreground_new(red: Word; green: Word; blue: Word): PPangoAttribute; cdecl;
function pango_attr_background_new(red: Word; green: Word; blue: Word): PPangoAttribute; cdecl;
function pango_attr_size_new(size: Integer): PPangoAttribute; cdecl;
function pango_attr_size_new_absolute(size: Integer): PPangoAttribute; cdecl;
function pango_attr_style_new(style: PangoStyle): PPangoAttribute; cdecl;
function pango_attr_weight_new(weight: PangoWeight): PPangoAttribute; cdecl;
function pango_attr_variant_new(variant: PangoVariant): PPangoAttribute; cdecl;
function pango_attr_stretch_new(stretch: PangoStretch): PPangoAttribute; cdecl;
function pango_attr_font_desc_new(const desc: PPangoFontDescription): PPangoAttribute; cdecl;
function pango_attr_underline_new(underline: PangoUnderline): PPangoAttribute; cdecl;
function pango_attr_underline_color_new(red: Word; green: Word; blue: Word): PPangoAttribute; cdecl;
function pango_attr_strikethrough_new(strikethrough: gboolean): PPangoAttribute; cdecl;
function pango_attr_strikethrough_color_new(red: Word; green: Word; blue: Word): PPangoAttribute; cdecl;
function pango_attr_rise_new(rise: Integer): PPangoAttribute; cdecl;
function pango_attr_scale_new(scale_factor: double): PPangoAttribute; cdecl;
function pango_attr_fallback_new(enable_fallback: gboolean): PPangoAttribute; cdecl;
function pango_attr_letter_spacing_new(letter_spacing: Integer): PPangoAttribute; cdecl;
function pango_attr_shape_new(const ink_rect: PPangoRectangle; const logical_rect: PPangoRectangle): PPangoAttribute; cdecl;
function pango_attr_shape_new_with_data(const ink_rect: PPangoRectangle; const logical_rect: PPangoRectangle; data: Pointer; copy_func: PangoAttrDataCopyFunc; destroy_func: GDestroyNotify): PPangoAttribute; cdecl;
function pango_attr_gravity_new(gravity: PangoGravity): PPangoAttribute; cdecl;
function pango_attr_gravity_hint_new(hint: PangoGravityHint): PPangoAttribute; cdecl;

function pango_attr_list_get_type: GType; cdecl;
function pango_attr_list_new: PPangoAttrList ; cdecl;
function pango_attr_list_ref(list: PPangoAttrList): PPangoAttrList ; cdecl;
procedure pango_attr_list_unref(list: PPangoAttrList); cdecl;
function pango_attr_list_copy(list: PPangoAttrList): PPangoAttrList ; cdecl;
procedure pango_attr_list_insert(list: PPangoAttrList; attr: PPangoAttribute); cdecl;
procedure pango_attr_list_insert_before(list: PPangoAttrList; attr: PPangoAttribute); cdecl;
procedure pango_attr_list_change(list: PPangoAttrList; attr: PPangoAttribute); cdecl;
procedure pango_attr_list_splice(list: PPangoAttrList; other: PPangoAttrList; pos: Integer; len: Integer); cdecl;
function pango_attr_list_filter(list: PPangoAttrList; func: PangoAttrFilterFunc; data: Pointer): PPangoAttrList; cdecl;
function pango_attr_list_get_iterator(list: PPangoAttrList): PPangoAttrIterator; cdecl;

procedure pango_attr_iterator_range(iterator: PPangoAttrIterator; start: PInteger; end_: PInteger); cdecl;
function pango_attr_iterator_next(iterator: PPangoAttrIterator): gboolean; cdecl;
function pango_attr_iterator_copy(iterator: PPangoAttrIterator): PPangoAttrIterator; cdecl;
procedure pango_attr_iterator_destroy(iterator: PPangoAttrIterator); cdecl;
function pango_attr_iterator_get(iterator: PPangoAttrIterator; type_: PangoAttrType): PPangoAttribute ; cdecl;
procedure pango_attr_iterator_get_font(iterator: PPangoAttrIterator; desc: PPangoFontDescription; language: PPPangoLanguage; extra_attrs: PPGSList); cdecl;
function pango_attr_iterator_get_attrs(iterator: PPangoAttrIterator): PGSList ; cdecl;

function pango_parse_markup(const markup_text: PAnsiChar; length: Integer; accel_marker: WideChar; attr_list: PPPangoAttrList; text: PPAnsiChar; accel_char: PWideChar; error: Pointer): gboolean; cdecl;

(* Pango
 * pango-fontset.h: Font set handling
 *
 * Copyright (C) 2001 Red Hat Software
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

(*
 * PangoFontset
 *)

//#define PANGO_TYPE_FONTSET              (pango_fontset_get_type ())
//#define PANGO_FONTSET(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_FONTSET, PangoFontset))
//#define PANGO_IS_FONTSET(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_FONTSET))

function pango_fontset_get_type: GType; cdecl;

type
  PPangoFontset = ^PangoFontset;
  _PangoFontset = record
   parent_instance: GObject;
  end;
  PangoFontset = _PangoFontset;

(**
 * PangoFontsetForeachFunc
 * @fontset: a #PangoFontset
 * @font: a font from @fontset
 * @data: callback data
 *
 * A callback function used by pango_fontset_foreach() when enumerating
 * the fonts in a fontset.
 *
 * Returns: if %TRUE, stop iteration and return immediately.
 *
 * Since: 1.4
 **)
type
  PangoFontsetForeachFunc = function(fontset: PPangoFontset; font: PPangoFont; data: Pointer): gboolean; cdecl;
function pango_fontset_get_font(fontset: PPangoFontset; wc: Cardinal): PPangoFont; cdecl;
function pango_fontset_get_metrics(fontset: PPangoFontset): PPangoFontMetrics; cdecl;
procedure pango_fontset_foreach(fontset: PPangoFontset; func: PangoFontsetForeachFunc; data: Pointer); cdecl;

//#ifdef PANGO_ENABLE_BACKEND
type
  PPangoFontsetClass = ^PangoFontsetClass;
  _PangoFontsetClass = record
    parent_class: GObjectClass;

    (*< public >*)

    get_font: function(fontset: PPangoFontset; wc: Cardinal): PPangoFont; cdecl;
    get_metrics: function(fontset: PPangoFontset): PPangoFontMetrics; cdecl;
    get_language: function(fontset: PPangoFontset): PPangoLanguage; cdecl;
    foreach: procedure(fontset: PPangoFontset; func: PangoFontsetForeachFunc; data: Pointer); cdecl;

    (*< private >*)

    (* Padding for future expansion *)
    _pango_reserved1: procedure;
    _pango_reserved2: procedure;
    _pango_reserved3: procedure;
    _pango_reserved4: procedure;
  end;
  PangoFontsetClass = _PangoFontsetClass;

//#define PANGO_FONTSET_CLASS(klass)      (G_TYPE_CHECK_CLASS_CAST ((klass), PANGO_TYPE_FONTSET, PangoFontsetClass))
//#define PANGO_IS_FONTSET_CLASS(klass)   (G_TYPE_CHECK_CLASS_TYPE ((klass), PANGO_TYPE_FONTSET))
//#define PANGO_FONTSET_GET_CLASS(obj)    (G_TYPE_INSTANCE_GET_CLASS ((obj), PANGO_TYPE_FONTSET, PangoFontsetClass))

(*
 * PangoFontsetSimple
 *)

//#define PANGO_TYPE_FONTSET_SIMPLE       (pango_fontset_simple_get_type ())
//#define PANGO_FONTSET_SIMPLE(object)    (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_FONTSET_SIMPLE, PangoFontsetSimple))
//#define PANGO_IS_FONTSET_SIMPLE(object) (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_FONTSET_SIMPLE))

  PPangoFontsetSimple = ^PangoFontsetSimple;
  _PangoFontsetSimple = record end;
  PangoFontsetSimple = _PangoFontsetSimple;

  PPangoFontsetSimpleClass = ^PangoFontsetSimpleClass;
  _PangoFontsetSimpleClass = record end;
  PangoFontsetSimpleClass = _PangoFontsetSimpleClass;

function pango_fontset_simple_get_type: GType; cdecl;
function pango_fontset_simple_new(language: PPangoLanguage): PPangoFontsetSimple; cdecl;
procedure pango_fontset_simple_append(fontset: PPangoFontsetSimple; font: PPangoFont); cdecl;
function pango_fontset_simple_size(fontset: PPangoFontsetSimple): Integer; cdecl;

(* Pango
 * pango-fontmap.h: Font handling
 *
 * Copyright (C) 2000 Red Hat Software
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

//#define PANGO_TYPE_FONT_MAP              (pango_font_map_get_type ())
//#define PANGO_FONT_MAP(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_FONT_MAP, PangoFontMap))
//#define PANGO_IS_FONT_MAP(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_FONT_MAP))

type
  PPangoContext = ^PangoContext;
  _PangoContext = record
    parent_instance: GObject;
  end;
  PangoContext = _PangoContext;

function pango_font_map_get_type: GType; cdecl;
function pango_font_map_create_context(fontmap: PPangoFontMap): PPangoContext; cdecl;
function pango_font_map_load_font(fontmap: PPangoFontMap; context: PPangoContext; const desc: PPangoFontDescription): PPangoFont; cdecl;
function pango_font_map_load_fontset(fontmap: PPangoFontMap; context: PPangoContext; const desc: PPangoFontDescription; language: PPangoLanguage): PPangoFontset; cdecl;
procedure pango_font_map_list_families(fontmap: PPangoFontMap; families: PPPPangoFontFamily; n_families: PInteger); cdecl;

//#ifdef PANGO_ENABLE_BACKEND

//#define PANGO_FONT_MAP_CLASS(klass)      (G_TYPE_CHECK_CLASS_CAST ((klass), PANGO_TYPE_FONT_MAP, PangoFontMapClass))
//#define PANGO_IS_FONT_MAP_CLASS(klass)   (G_TYPE_CHECK_CLASS_TYPE ((klass), PANGO_TYPE_FONT_MAP))
//#define PANGO_FONT_MAP_GET_CLASS(obj)    (G_TYPE_INSTANCE_GET_CLASS ((obj), PANGO_TYPE_FONT_MAP, PangoFontMapClass))

type
  PPangoFontMapClass = ^PangoFontMapClass;
  _PangoFontMapClass = record
    parent_class: GObjectClass;
    (*< public >*)
    load_font: function(fontmap: PPangoFontMap; context: PPangoContext; const desc: PPangoFontDescription): PPangoFont; cdecl;
    list_families: procedure(fontmap: PPangoFontMap; families: PPPPangoFontFamily; n_families: PInteger); cdecl;
    load_fontset: function(fontmap: PPangoFontMap; context: PPangoContext; const desc: PPangoFontDescription; language: PPangoLanguage): PPangoFontset; cdecl;
    shape_engine_type: PAnsiChar;

    (*< private >*)

    (* Padding for future expansion *)
    _pango_reserved1: procedure;
    _pango_reserved2: procedure;
    _pango_reserved3: procedure;
    _pango_reserved4: procedure;
  end;
  PangoFontMapClass = _PangoFontMapClass;

function pango_font_map_get_shape_engine_type(fontmap: PPangoFontMap): PAnsiChar; cdecl;

//#endif (* PANGO_ENABLE_BACKEND *)

(* Pango
 * pango-context.h: Rendering contexts
 *
 * Copyright (C) 2000 Red Hat Software
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

(* Sort of like a GC - application set information about how
 * to handle scripts
 *)

(* PangoContext typedefed in pango-fontmap.h *)
type
  PPangoContextClass = ^PangoContextClass;
  _PangoContextClass = record end;
  PangoContextClass = _PangoContextClass;

//#define PANGO_TYPE_CONTEXT              (pango_context_get_type ())
//#define PANGO_CONTEXT(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_CONTEXT, PangoContext))
//#define PANGO_CONTEXT_CLASS(klass)      (G_TYPE_CHECK_CLASS_CAST ((klass), PANGO_TYPE_CONTEXT, PangoContextClass))
//#define PANGO_IS_CONTEXT(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_CONTEXT))
//#define PANGO_IS_CONTEXT_CLASS(klass)   (G_TYPE_CHECK_CLASS_TYPE ((klass), PANGO_TYPE_CONTEXT))
//#define PANGO_CONTEXT_GET_CLASS(obj)    (G_TYPE_INSTANCE_GET_CLASS ((obj), PANGO_TYPE_CONTEXT, PangoContextClass))


(* The PangoContext and PangoContextClass structs are private; if you
 * need to create a subclass of these, file a bug.
 *)

function pango_context_get_type: GType; cdecl;
function pango_context_new: PPangoContext; cdecl;
procedure pango_context_set_font_map(context: PPangoContext; font_map: PPangoFontMap); cdecl;
function pango_context_get_font_map(context: PPangoContext): PPangoFontMap; cdecl;
procedure pango_context_list_families(context: PPangoContext; families: PPPPangoFontFamily; n_families: PInteger); cdecl;
function pango_context_load_font(context: PPangoContext; const desc: PPangoFontDescription): PPangoFont; cdecl;
function pango_context_load_fontset(context: PPangoContext; const desc: PPangoFontDescription; language: PPangoLanguage): PPangoFontset; cdecl;
function pango_context_get_metrics(context: PPangoContext; const desc: PPangoFontDescription; language: PPangoLanguage): PPangoFontMetrics; cdecl;
procedure pango_context_set_font_description(context: PPangoContext; const desc: PPangoFontDescription); cdecl;
function pango_context_get_font_description(context: PPangoContext): PPangoFontDescription; cdecl;
function pango_context_get_language(context: PPangoContext): PPangoLanguage; cdecl;
procedure pango_context_set_language(context: PPangoContext; language: PPangoLanguage); cdecl;
procedure pango_context_set_base_dir(context: PPangoContext; direction: PangoDirection); cdecl;
function pango_context_get_base_dir(context: PPangoContext): PangoDirection; cdecl;
procedure pango_context_set_base_gravity(context: PPangoContext; gravity: PangoGravity); cdecl;
function pango_context_get_base_gravity(context: PPangoContext): PangoGravity; cdecl;
function pango_context_get_gravity(context: PPangoContext): PangoGravity; cdecl;
procedure pango_context_set_gravity_hint(context: PPangoContext; hint: PangoGravityHint); cdecl;
function pango_context_get_gravity_hint(context: PPangoContext): PangoGravityHint; cdecl;
procedure pango_context_set_matrix(context: PPangoContext; const matrix: PPangoMatrix); cdecl;
function pango_context_get_matrix(context: PPangoContext): PPangoMatrix; cdecl;

(* Break a string of Unicode characters into segments with
 * consistent shaping/language engine and bidrectional level.
 * Returns a #GList of #PangoItem's
 *)
function pango_itemize(context: PPangoContext; const text: PAnsiChar; start_index: Integer; length: Integer; attrs: PPangoAttrList; cached_iter: PPangoAttrIterator): PGList; cdecl;
function pango_itemize_with_base_dir(context: PPangoContext; base_dir: PangoDirection; const text: PAnsiChar; start_index: Integer; length: Integer; attrs: PPangoAttrList; cached_iter: PPangoAttrIterator): PGList; cdecl;


(* Pango
 * pango-item.h: Structure for storing run information
 *
 * Copyright (C) 2000 Red Hat Software
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
  PPangoAnalysis = ^PangoAnalysis;
  _PangoAnalysis = record
    shape_engine: PPangoEngineShape;
    lang_engine: PPangoEngineLang;
    font: PPangoFont;

    level: Byte;
    gravity: Byte; (* PangoGravity *)
    flags: Byte;

    script: Byte; (* PangoScript *)
    language: PPangoLanguage;

    extra_attrs: PGSList;
  end;
  PangoAnalysis = _PangoAnalysis;

  PPangoItem = ^PangoItem;
  _PangoItem = record
    offset: Integer;
    length: Integer;
    num_chars: Integer;
    analysis: PangoAnalysis;
  end;
  PangoItem = _PangoItem;

(* TODO: if more flags are needed, turn this into a real PangoAnalysisFlags enum *)
const
  PANGO_ANALYSIS_FLAG_CENTERED_BASELINE = (1 shl 0);

//#define PANGO_TYPE_ITEM (pango_item_get_type ())

function pango_item_get_type: GType; cdecl;
function pango_item_new: PPangoItem; cdecl;
function pango_item_copy(item: PPangoItem): PPangoItem; cdecl;
procedure pango_item_free(item: PPangoItem); cdecl;
function pango_item_split(orig: PPangoItem; split_index: Integer; split_offset: Integer): PPangoItem; cdecl;

(* Pango
 * pango-glyph.h: Glyph storage
 *
 * Copyright (C) 2000 Red Hat Software
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
(* 1024ths of a device unit *)
  PangoGlyphUnit = type Integer;

(* Positioning information about a glyph
 *)
  PPangoGlyphGeometry = ^PangoGlyphGeometry;
  _PangoGlyphGeometry = record
    width: PangoGlyphUnit;
    x_offset: PangoGlyphUnit;
    y_offset: PangoGlyphUnit;
  end;
  PangoGlyphGeometry = _PangoGlyphGeometry;

(* Visual attributes of a glyph
 *)
  PPangoGlyphVisAttr = ^PangoGlyphVisAttr;
  _PangoGlyphVisAttr = record
    is_cluster_start: Cardinal; // : 1; todo
  end;
  PangoGlyphVisAttr = _PangoGlyphVisAttr;

(* A single glyph
 *)
  PPangoGlyphInfo = ^PangoGlyphInfo;
  _PangoGlyphInfo = record
    glyph: PangoGlyph;
    geometry: PangoGlyphGeometry;
    attr: PangoGlyphVisAttr;
  end;
  PangoGlyphInfo = _PangoGlyphInfo;

(* A string of glyphs with positional information and visual attributes -
 * ready for drawing
 *)
  PPangoGlyphString = ^PangoGlyphString;
  _PangoGlyphString = record
    num_glyphs: Integer;
    glyphs: PPangoGlyphInfo;
    (* This is a memory inefficient way of representing the information
     * here - each value gives the byte index within the text
     * corresponding to the glyph string of the start of the cluster to
     * which the glyph belongs.
     *)
    log_clusters: PInteger;
    (*< private >*)
    space: Integer;
  end;
  PangoGlyphString = _PangoGlyphString;


//#define PANGO_TYPE_GLYPH_STRING (pango_glyph_string_get_type ())

function pango_glyph_string_new: PPangoGlyphString; cdecl;
procedure pango_glyph_string_set_size(str: PPangoGlyphString; new_len: Integer); cdecl;
function pango_glyph_string_get_type: GType; cdecl;
function pango_glyph_string_copy(str: PPangoGlyphString): PPangoGlyphString; cdecl;
procedure pango_glyph_string_free(str: PPangoGlyphString); cdecl;
procedure pango_glyph_string_extents(glyphs: PPangoGlyphString; font: PPangoFont; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl;
function pango_glyph_string_get_width(glyphs: PPangoGlyphString): Integer; cdecl;
procedure pango_glyph_string_extents_range(glyphs: PPangoGlyphString; start: Integer; end_: Integer; font: PPangoFont; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl;
procedure pango_glyph_string_get_logical_widths(glyphs: PPangoGlyphString; const text: PAnsiChar; length: Integer; embedding_level: Integer; logical_widths: PInteger); cdecl;
procedure pango_glyph_string_index_to_x(glyphs: PPangoGlyphString; text: PAnsiChar; length: Integer; analysis: PPangoAnalysis; index_: Integer; trailing: gboolean; x_pos: PInteger); cdecl;
procedure pango_glyph_string_x_to_index(glyphs: PPangoGlyphString; text: PAnsiChar; length: Integer; analysis: PPangoAnalysis; x_pos: Integer; index_: PInteger; trailing: PInteger); cdecl;
(* Turn a string of characters into a string of glyphs
 *)
procedure pango_shape(const text: PAnsiChar; length: Integer; const analysis: PPangoAnalysis; glyphs: PPangoGlyphString); cdecl;
function pango_reorder_items(logical_items: PGList): PGList; cdecl;

(* Pango
 * pango-break.h:
 *
 * Copyright (C) 1999 Red Hat Software
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


(* Determine information about cluster/word/line breaks in a string
 * of Unicode text.
 *)
procedure pango_break(const text: PAnsiChar; length: Integer; analysis: PPangoAnalysis; attrs: PPangoLogAttr; attrs_len: Integer); cdecl;
procedure pango_find_paragraph_boundary(const text: PAnsiChar; length: Integer; paragraph_delimiter_index: PInteger; next_paragraph_start: PInteger); cdecl;
procedure pango_get_log_attrs(const text: PAnsiChar; length: Integer; level: Integer; language: PPangoLanguage; log_attrs: PPangoLogAttr; attrs_len: Integer); cdecl;

//#ifdef PANGO_ENABLE_ENGINE

(* This is the default break algorithm, used if no language
 * engine overrides it. Normally you should use pango_break()
 * instead; this function is mostly useful for chaining up
 * from a language engine override.
 *)
procedure pango_default_break(const text: PAnsiChar; length: Integer; analysis: PPangoAnalysis; attrs: PPangoLogAttr; attrs_len: Integer); cdecl;

//#endif (* PANGO_ENABLE_ENGINE *)


(* Pango
 * pango-tabs.h: Tab-related stuff
 *
 * Copyright (C) 2000 Red Hat Software
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
  PPangoTabArray = ^PangoTabArray;
  _PangoTabArray = record end;
  PangoTabArray = _PangoTabArray;

  PPangoTabAlign = ^PangoTabAlign;
  PangoTabAlign = (
    PANGO_TAB_LEFT

    (* These are not supported now, but may be in the
     * future.
     *
     *  PANGO_TAB_RIGHT,
     *  PANGO_TAB_CENTER,
     *  PANGO_TAB_NUMERIC
     *)
  );

//#define PANGO_TYPE_TAB_ARRAY (pango_tab_array_get_type ())

function pango_tab_array_new(initial_size: Integer; positions_in_pixels: gboolean): PPangoTabArray; cdecl;
function pango_tab_array_new_with_positions(size: Integer; positions_in_pixels: gboolean; first_alignment: PangoTabAlign; first_position: Integer): PPangoTabArray; varargs; cdecl;
function pango_tab_array_get_type: GType; cdecl;
function pango_tab_array_copy(src: PPangoTabArray): PPangoTabArray; cdecl;
procedure pango_tab_array_free(tab_array: PPangoTabArray); cdecl;
function pango_tab_array_get_size(tab_array: PPangoTabArray): Integer; cdecl;
procedure pango_tab_array_resize(tab_array: PPangoTabArray; new_size: Integer); cdecl;
procedure pango_tab_array_set_tab(tab_array: PPangoTabArray; tab_index: Integer; alignment: PangoTabAlign; location: Integer); cdecl;
procedure pango_tab_array_get_tab(tab_array: PPangoTabArray; tab_index: Integer; alignment: PPangoTabAlign; location: PInteger); cdecl;
procedure pango_tab_array_get_tabs(tab_array: PPangoTabArray; var alignments: PPangoTabAlign; var locations: PInteger); cdecl;
function pango_tab_array_get_positions_in_pixels(tab_array: PPangoTabArray): gboolean; cdecl;

(* Pango
 * pango-glyph-item.h: Pair of PangoItem and a glyph string
 *
 * Copyright (C) 2002 Red Hat Software
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
  PPangoGlyphItem = ^PangoGlyphItem;
  _PangoGlyphItem = record
    item: PPangoItem;
    glyphs: PPangoGlyphString;
  end;
  PangoGlyphItem = _PangoGlyphItem;

//#define PANGO_TYPE_GLYPH_ITEM (pango_glyph_item_get_type ())

function pango_glyph_item_get_type: GType; cdecl;
function pango_glyph_item_split(orig: PPangoGlyphItem; const text: PAnsiChar; split_index: Integer): PPangoGlyphItem; cdecl;
function pango_glyph_item_copy(orig: PPangoGlyphItem): PPangoGlyphItem; cdecl;
procedure pango_glyph_item_free(glyph_item: PPangoGlyphItem); cdecl;
function pango_glyph_item_apply_attrs(glyph_item: PPangoGlyphItem; const text: PAnsiChar; list: PPangoAttrList): PGSList ; cdecl;
procedure pango_glyph_item_letter_space(glyph_item: PPangoGlyphItem; const text: PAnsiChar; log_attrs: PPangoLogAttr; letter_spacing: Integer); cdecl;

type
  PPangoGlyphItemIter = ^PangoGlyphItemIter;
  _PangoGlyphItemIter = record
    glyph_item: PPangoGlyphItem;
    text: PAnsiChar;

    start_glyph: Integer;
    start_index: Integer;
    start_char: Integer;

    end_glyph: Integer;
    end_index: Integer;
    end_char: Integer;
  end;
  PangoGlyphItemIter = _PangoGlyphItemIter;

//#define PANGO_TYPE_GLYPH_ITEM_ITER (pango_glyph_item_iter_get_type ())

function pango_glyph_item_iter_get_type: GType; cdecl;
function pango_glyph_item_iter_copy(orig: PPangoGlyphItemIter): PPangoGlyphItemIter; cdecl;
procedure pango_glyph_item_iter_free(iter: PPangoGlyphItemIter); cdecl;
function pango_glyph_item_iter_init_start(iter: PPangoGlyphItemIter; glyph_item: PPangoGlyphItem; const text: PAnsiChar ): gboolean; cdecl;
function pango_glyph_item_iter_init_end(iter: PPangoGlyphItemIter; glyph_item: PPangoGlyphItem; const text: PAnsiChar): gboolean; cdecl;
function pango_glyph_item_iter_next_cluster(iter: PPangoGlyphItemIter): gboolean; cdecl;
function pango_glyph_item_iter_prev_cluster(iter: PPangoGlyphItemIter): gboolean; cdecl;

(* Pango
 * pango-layout.h: High-level layout driver
 *
 * Copyright (C) 2000 Red Hat Software
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
  PPangoLayout = ^PangoLayout;
  _PangoLayout = record end;
  PangoLayout = _PangoLayout;

  PPangoLayoutClass = ^PangoLayoutClass;
  _PangoLayoutClass = record end;
  PangoLayoutClass = _PangoLayoutClass;

  PPangoLayoutLine = ^PangoLayoutLine;
  _PangoLayoutLine = record
    layout: PPangoLayout;
    start_index: Integer;     (* start of line as byte index into layout->text *)
    length: Integer;  (* length of line in bytes *)
    runs: PGSList;
    is_paragraph_start: Cardinal; {: 1}  (* TRUE if this is the first line of the paragraph *) // TODO
    resolved_dir: Cardinal; {: 3}  (* Resolved PangoDirection of line *) // TODO
  end;
  PangoLayoutLine = _PangoLayoutLine;

  PPangoLayoutRun = ^PangoLayoutRun;
  PangoLayoutRun = type PangoGlyphItem;

  PangoAlignment = (
    PANGO_ALIGN_LEFT,
    PANGO_ALIGN_CENTER,
    PANGO_ALIGN_RIGHT
  );

  PangoWrapMode = (
    PANGO_WRAP_WORD,
    PANGO_WRAP_CHAR,
    PANGO_WRAP_WORD_CHAR
  );

(**
 * PangoEllipsizeMode
 * @PANGO_ELLIPSIZE_NONE: No ellipsization
 * @PANGO_ELLIPSIZE_START: Omit characters at the start of the text
 * @PANGO_ELLIPSIZE_MIDDLE: Omit characters in the middle of the text
 * @PANGO_ELLIPSIZE_END: Omit characters at the end of the text
 *
 * The #PangoEllipsizeMode type describes what sort of (if any)
 * ellipsization should be applied to a line of text. In
 * the ellipsization process characters are removed from the
 * text in order to make it fit to a given width and replaced
 * with an ellipsis.
 *)
  PangoEllipsizeMode = (
    PANGO_ELLIPSIZE_NONE,
    PANGO_ELLIPSIZE_START,
    PANGO_ELLIPSIZE_MIDDLE,
    PANGO_ELLIPSIZE_END
  );

//#define PANGO_TYPE_LAYOUT              (pango_layout_get_type ())
//#define PANGO_LAYOUT(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_LAYOUT, PangoLayout))
//#define PANGO_LAYOUT_CLASS(klass)      (G_TYPE_CHECK_CLASS_CAST ((klass), PANGO_TYPE_LAYOUT, PangoLayoutClass))
//#define PANGO_IS_LAYOUT(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_LAYOUT))
//#define PANGO_IS_LAYOUT_CLASS(klass)   (G_TYPE_CHECK_CLASS_TYPE ((klass), PANGO_TYPE_LAYOUT))
//#define PANGO_LAYOUT_GET_CLASS(obj)    (G_TYPE_INSTANCE_GET_CLASS ((obj), PANGO_TYPE_LAYOUT, PangoLayoutClass))

(* The PangoLayout and PangoLayoutClass structs are private; if you
 * need to create a subclass of these, file a bug.
 *)

function pango_layout_get_type: GType; cdecl;
function pango_layout_new(context: PPangoContext): PPangoLayout; cdecl;
function pango_layout_copy(src: PPangoLayout): PPangoLayout; cdecl;
function pango_layout_get_context(layout: PPangoLayout): PPangoContext; cdecl;
procedure pango_layout_set_attributes(layout: PPangoLayout; attrs: PPangoAttrList); cdecl;
function pango_layout_get_attributes(layout: PPangoLayout): PPangoAttrList; cdecl;
procedure pango_layout_set_text(layout: PPangoLayout; const text: PAnsiChar; length: Integer); cdecl;
function pango_layout_get_text(layout: PPangoLayout): PAnsiChar; cdecl;
procedure pango_layout_set_markup(layout: PPangoLayout; const markup: PAnsiChar; length: Integer); cdecl;
procedure pango_layout_set_markup_with_accel(layout: PPangoLayout; const markup: PAnsiChar; length: Integer; accel_marker: WideChar; accel_char: PWideChar); cdecl;
procedure pango_layout_set_font_description(layout: PPangoLayout; const desc: PPangoFontDescription); cdecl;
function pango_layout_get_font_description(layout: PPangoLayout): PPangoFontDescription; cdecl;
procedure pango_layout_set_width(layout: PPangoLayout; width: Integer); cdecl;
function pango_layout_get_width(layout: PPangoLayout): Integer; cdecl;
procedure pango_layout_set_height(layout: PPangoLayout; height: Integer); cdecl;
function pango_layout_get_height(layout: PPangoLayout): Integer; cdecl;
procedure pango_layout_set_wrap(layout: PPangoLayout; wrap: PangoWrapMode); cdecl;
function pango_layout_get_wrap(layout: PPangoLayout): PangoWrapMode; cdecl;
function pango_layout_is_wrapped(layout: PPangoLayout): gboolean; cdecl;
procedure pango_layout_set_indent(layout: PPangoLayout; indent: Integer); cdecl;
function pango_layout_get_indent(layout: PPangoLayout): Integer; cdecl;
procedure pango_layout_set_spacing(layout: PPangoLayout; spacing: Integer); cdecl;
function pango_layout_get_spacing(layout: PPangoLayout): Integer; cdecl;
procedure pango_layout_set_justify(layout: PPangoLayout; justify: gboolean); cdecl;
function pango_layout_get_justify(layout: PPangoLayout): gboolean; cdecl;
procedure pango_layout_set_auto_dir(layout: PPangoLayout; auto_dir: gboolean); cdecl;
function pango_layout_get_auto_dir(layout: PPangoLayout): gboolean; cdecl;
procedure pango_layout_set_alignment(layout: PPangoLayout; alignment: PangoAlignment); cdecl;
function pango_layout_get_alignment(layout: PPangoLayout): PangoAlignment; cdecl;
procedure pango_layout_set_tabs(layout: PPangoLayout; tabs: PPangoTabArray); cdecl;
function pango_layout_get_tabs(layout: PPangoLayout): PPangoTabArray; cdecl;
procedure pango_layout_set_single_paragraph_mode(layout: PPangoLayout; setting: gboolean); cdecl;
function pango_layout_get_single_paragraph_mode(layout: PPangoLayout): gboolean; cdecl;
procedure pango_layout_set_ellipsize(layout: PPangoLayout; ellipsize: PangoEllipsizeMode); cdecl;
function pango_layout_get_ellipsize(layout: PPangoLayout): PangoEllipsizeMode; cdecl;
function pango_layout_is_ellipsized(layout: PPangoLayout): gboolean; cdecl;
function pango_layout_get_unknown_glyphs_count(layout: PPangoLayout): Integer; cdecl;
procedure pango_layout_context_changed(layout: PPangoLayout); cdecl;
procedure pango_layout_get_log_attrs(layout: PPangoLayout; var attrs: PPangoLogAttr; var n_attrs: Integer); cdecl;
procedure pango_layout_index_to_pos(layout: PPangoLayout; index_: Integer; pos: PPangoRectangle); cdecl;
procedure pango_layout_index_to_line_x(layout: PPangoLayout; index_: Integer; trailing: gboolean; line: PInteger; x_pos: PInteger); cdecl;
procedure pango_layout_get_cursor_pos(layout: PPangoLayout; index_: Integer; strong_pos: PPangoRectangle; weak_pos: PPangoRectangle); cdecl;
procedure pango_layout_move_cursor_visually(layout: PPangoLayout; strong: gboolean; old_index: Integer; old_trailing: Integer; direction: Integer; new_index: PInteger; new_trailing: PInteger); cdecl;
function pango_layout_xy_to_index(layout: PPangoLayout; x: Integer; y: Integer; index_: PInteger; trailing: PInteger): gboolean; cdecl;
procedure pango_layout_get_extents(layout: PPangoLayout; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl;
procedure pango_layout_get_pixel_extents(layout: PPangoLayout; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl;
procedure pango_layout_get_size(layout: PPangoLayout; width: PInteger; height: PInteger); cdecl;
procedure pango_layout_get_pixel_size(layout: PPangoLayout; width: PInteger; height: PInteger); cdecl;
function pango_layout_get_baseline(layout: PPangoLayout): Integer; cdecl;
function pango_layout_get_line_count(layout: PPangoLayout): Integer; cdecl;
function pango_layout_get_line(layout: PPangoLayout; line: Integer): PPangoLayoutLine; cdecl;
function pango_layout_get_line_readonly(layout: PPangoLayout; line: Integer): PPangoLayoutLine; cdecl;
function pango_layout_get_lines(layout: PPangoLayout): PGSList; cdecl;
function pango_layout_get_lines_readonly(layout: PPangoLayout): PGSList; cdecl;

//#define PANGO_TYPE_LAYOUT_LINE (pango_layout_line_get_type ())

function pango_layout_line_get_type: GType; cdecl;
function pango_layout_line_ref(line: PPangoLayoutLine): PPangoLayoutLine; cdecl;
procedure pango_layout_line_unref(line: PPangoLayoutLine); cdecl;
function pango_layout_line_x_to_index(line: PPangoLayoutLine; x_pos: Integer; index_: PInteger ; trailing: PInteger): gboolean; cdecl;
procedure pango_layout_line_index_to_x(line: PPangoLayoutLine; index_: Integer; trailing: gboolean; x_pos: PInteger); cdecl;
procedure pango_layout_line_get_x_ranges(line: PPangoLayoutLine; start_index: Integer; end_index: Integer; var ranges: PInteger; n_ranges: PInteger); cdecl;
procedure pango_layout_line_get_extents(line: PPangoLayoutLine; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl;
procedure pango_layout_line_get_pixel_extents(layout_line: PPangoLayoutLine; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl;

type
  PPangoLayoutIter = ^PangoLayoutIter;
  _PangoLayoutIter = record end;
  PangoLayoutIter = _PangoLayoutIter;


//#define PANGO_TYPE_LAYOUT_ITER       (pango_layout_iter_get_type ())

function pango_layout_iter_get_type: GType; cdecl;
function pango_layout_get_iter(layout: PPangoLayout): PPangoLayoutIter; cdecl;
function pango_layout_iter_copy(iter: PPangoLayoutIter): PPangoLayoutIter; cdecl;
procedure pango_layout_iter_free(iter: PPangoLayoutIter); cdecl;
function pango_layout_iter_get_index(iter: PPangoLayoutIter): Integer; cdecl;
function pango_layout_iter_get_run(iter: PPangoLayoutIter): PPangoLayoutRun; cdecl;
function pango_layout_iter_get_run_readonly(iter: PPangoLayoutIter): PPangoLayoutRun; cdecl;
function pango_layout_iter_get_line(iter: PPangoLayoutIter): PPangoLayoutLine; cdecl;
function pango_layout_iter_get_line_readonly(iter: PPangoLayoutIter): PPangoLayoutLine; cdecl;
function pango_layout_iter_at_last_line(iter: PPangoLayoutIter): gboolean; cdecl;
function pango_layout_iter_get_layout(iter: PPangoLayoutIter): PPangoLayout; cdecl;
function pango_layout_iter_next_char(iter: PPangoLayoutIter): gboolean; cdecl;
function pango_layout_iter_next_cluster(iter: PPangoLayoutIter): gboolean; cdecl;
function pango_layout_iter_next_run(iter: PPangoLayoutIter): gboolean; cdecl;
function pango_layout_iter_next_line(iter: PPangoLayoutIter): gboolean; cdecl;
procedure pango_layout_iter_get_char_extents(iter: PPangoLayoutIter; logical_rect: PPangoRectangle); cdecl;
procedure pango_layout_iter_get_cluster_extents(iter: PPangoLayoutIter; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl;
procedure pango_layout_iter_get_run_extents(iter: PPangoLayoutIter; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl;
procedure pango_layout_iter_get_line_extents(iter: PPangoLayoutIter; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl;

(* All the meet: yranges; unlike the logical_rect's (i.e. the yranges
 * assign between-line spacing to the nearest line)
 *)
procedure pango_layout_iter_get_line_yrange(iter: PPangoLayoutIter; y0_: PInteger; y1_: PInteger); cdecl;
procedure pango_layout_iter_get_layout_extents(iter: PPangoLayoutIter; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl;
function pango_layout_iter_get_baseline(iter: PPangoLayoutIter): Integer; cdecl;


(* Pango
 * pango-engine.h: Engines for script and language specific processing
 *
 * Copyright (C) 2000,2003 Red Hat Software
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

(* Module API *)

const
  PANGO_RENDER_TYPE_NONE = 'PangoRenderNone';

//#define PANGO_TYPE_ENGINE              (pango_engine_get_type ())
//#define PANGO_ENGINE(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_ENGINE, PangoEngine))
//#define PANGO_IS_ENGINE(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_ENGINE))
//#define PANGO_ENGINE_CLASS(klass)      (G_TYPE_CHECK_CLASS_CAST ((klass), PANGO_TYPE_ENGINE, PangoEngineClass))
//#define PANGO_IS_ENGINE_CLASS(klass)   (G_TYPE_CHECK_CLASS_TYPE ((klass), PANGO_TYPE_ENGINE))
//#define PANGO_ENGINE_GET_CLASS(obj)    (G_TYPE_INSTANCE_GET_CLASS ((obj), PANGO_TYPE_ENGINE, PangoEngineClass))

type
(**
 * PangoEngineClass:
 *
 * Class structure for #PangoEngine
 **)
  PPangoEngineClass = ^PangoEngineClass;
  _PangoEngineClass = record
    parent_class: GObjectClass;
  end;
  PangoEngineClass = _PangoEngineClass;

function pango_engine_get_type: GType; cdecl;

const
  PANGO_ENGINE_TYPE_LANG = 'PangoEngineLang';

//#define PANGO_TYPE_ENGINE_LANG              (pango_engine_lang_get_type ())
//#define PANGO_ENGINE_LANG(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_ENGINE_LANG, PangoEngineLang))
//#define PANGO_IS_ENGINE_LANG(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_ENGINE_LANG))
//#define PANGO_ENGINE_LANG_CLASS(klass)      (G_TYPE_CHECK_CLASS_CAST ((klass), PANGO_TYPE_ENGINE_LANG, PangoEngineLangClass))
//#define PANGO_IS_ENGINE_LANG_CLASS(klass)   (G_TYPE_CHECK_CLASS_TYPE ((klass), PANGO_TYPE_ENGINE_LANG))
//#define PANGO_ENGINE_LANG_GET_CLASS(obj)    (G_TYPE_INSTANCE_GET_CLASS ((obj), PANGO_TYPE_ENGINE_LANG, PangoEngineLangClass))

type
(**
 * PangoEngineLangClass:
 * @script_break: Provides a custom implementation of pango_break().
 * If %NULL, pango_default_break() is used instead. If not %NULL, for
 * Pango versions before 1.16 (module interface version before 1.6.0),
 * this was called instead of pango_default_break(), but in newer versions,
 * pango_default_break() is always called and this is called after that to
 * allow tailoring the breaking results.
 *
 * Class structure for #PangoEngineLang
 **)
  PPangoEngineLangClass = ^PangoEngineLangClass;
  _PangoEngineLangClass = record
    (*< private >*)
    parent_class: PangoEngineClass;

    (*< public >*)
    script_break: procedure(engine: PPangoEngineLang; const text: PAnsiChar; len: Integer; analysis: PPangoAnalysis; attrs: PPangoLogAttr; attrs_len: Integer); cdecl;

  end;
  PangoEngineLangClass = _PangoEngineLangClass;

function pango_engine_lang_get_type: GType; cdecl;

const
  PANGO_ENGINE_TYPE_SHAPE = 'PangoEngineShape';

//#define PANGO_TYPE_ENGINE_SHAPE              (pango_engine_shape_get_type ())
//#define PANGO_ENGINE_SHAPE(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_ENGINE_SHAPE, PangoEngineShape))
//#define PANGO_IS_ENGINE_SHAPE(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_ENGINE_SHAPE))
//#define PANGO_ENGINE_SHAPE_CLASS(klass)      (G_TYPE_CHECK_CLASS_CAST ((klass), PANGO_TYPE_ENGINE_SHAPE, PangoEngine_ShapeClass))
//#define PANGO_IS_ENGINE_SHAPE_CLASS(klass)   (G_TYPE_CHECK_CLASS_TYPE ((klass), PANGO_TYPE_ENGINE_SHAPE))
//#define PANGO_ENGINE_SHAPE_GET_CLASS(obj)    (G_TYPE_INSTANCE_GET_CLASS ((obj), PANGO_TYPE_ENGINE_SHAPE, PangoEngineShapeClass))

type

(**
 * PangoEngineShapeClass:
 * @script_shape: Given a font, a piece of text, and a #PangoAnalysis
 *   structure, converts characters to glyphs and positions the
 *   resulting glyphs. The results are stored in the #PangoGlyphString
 *   that is passed in. (The implementation should resize it
 *   appropriately using pango_glyph_string_set_size()). All fields
 *   of the @log_clusters and @glyphs array must be filled in, with
 *   the exception that Pango will automatically generate
 *   <literal>glyphs->glyphs[i].attr.is_cluster_start</literal>
 *   using the @log_clusters array. Each input character must occur in one
 *   of the output logical clusters;
 *   if no rendering is desired for a character, this may involve
 *   inserting glyphs with the #PangoGlyph ID #PANGO_GLYPH_EMPTY, which
 *   is guaranteed never to render. If the shaping fails for any reason,
 *   the shaper should return with an empty (zero-size) glyph string.
 *   If the shaper has not set the size on the glyph string yet, simply
 *   returning signals the failure too.
 * @covers: Returns the characters that this engine can cover
 *   with a given font for a given language. If not overridden, the default
 *   implementation simply returns the coverage information for the
 *   font itself unmodified.
 *
 * Class structure for #PangoEngineShape
 **)
  PPangoEngineShapeClass = ^PangoEngineShapeClass;
  _PangoEngineShapeClass = record
    (*< private >*)
    parent_class: PangoEngineClass;

    (*< public >*)
    script_shape: procedure(engine: PPangoEngineShape; font: PPangoFont; const text: PAnsiChar; length: Integer; const analysis: PPangoAnalysis; glyphs: PPangoGlyphString); cdecl;
    covers: function(engine: PPangoEngineShape; font: PPangoFont; language: PPangoLanguage; wc: gunichar): PangoCoverageLevel; cdecl;
  end;
  PangoEngineShapeClass = _PangoEngineShapeClass;

function pango_engine_shape_get_type: GType; cdecl;

type
  PPangoEngineScriptInfo = ^PangoEngineScriptInfo;
  _PangoEngineScriptInfo = record
    script: PangoScript;
    langs: PAnsiChar;
  end;
  PangoEngineScriptInfo = _PangoEngineScriptInfo;

  PPangoEngineInfo = ^PangoEngineInfo;
  _PangoEngineInfo = record
    id: PAnsiChar;
    engine_type: PAnsiChar;
    render_type: PAnsiChar;
    scripts: PPangoEngineScriptInfo;
    n_scripts: gint;
  end;
  PangoEngineInfo = _PangoEngineInfo;

(**
 * script_engine_list:
 * @engines: location to store a pointer to an array of engines.
 * @n_engines: location to store the number of elements in @engines.
 *
 * Function to be provided by a module to list the engines that the
 * module supplies. The function stores a pointer to an array
 * of #PangoEngineInfo structures and the length of that array in
 * the given location.
 *
 * Note that script_engine_init() will not be called before this
 * function.
 **)
procedure script_engine_list (var engines: PPangoEngineInfo; n_engines: PInteger); cdecl;

(**
 * script_engine_init:
 * @module: a #GTypeModule structure used to associate any
 *  GObject types created in this module with the module.
 *
 * Function to be provided by a module to register any
 * GObject types in the module.
 **)
procedure script_engine_init(module: PGTypeModule); cdecl;


(**
 * script_engine_exit:
 *
 * Function to be provided by the module that is called
 * when the module is unloading. Frequently does nothing.
 **)
procedure script_engine_exit; cdecl;

(**
 * script_engine_create:
 * @id: the ID of an engine as reported by script_engine_list.
 *
 * Function to be provided by the module to create an instance
 * of one of the engines implemented by the module.
 *
 * Return value: a newly created #PangoEngine of the specified
 *  type, or %NULL if an error occurred. (In normal operation,
 *  a module should not return %NULL. A %NULL return is only
 *  acceptable in the case where system misconfiguration or
 *  bugs in the driver routine are encountered.)
 **)
function script_engine_create(const id: PAnsiChar): PPangoEngine; cdecl;

(* Utility macro used by PANGO_ENGINE_LANG_DEFINE_TYPE and
 * PANGO_ENGINE_LANG_DEFINE_TYPE
 *)
//#define PANGO_ENGINE_DEFINE_TYPE(name, prefix, class_init, instance_init, parent_type) \
//static GType prefix ## _type;        \
//static void          \
//prefix ## _register_type (GTypeModule *module)      \
//{           \
//  const GTypeInfo object_info =        \
//    {           \
//      sizeof (name ## Class),        \
//      (GBaseInitFunc) NULL,        \
//      (GBaseFinalizeFunc) NULL,        \
//      (GClassInitFunc) class_init,       \
//      (GClassFinalizeFunc) NULL,       \
//      NULL,          (* class_data *)       \
//      sizeof (name),         \
//      0,             (* n_prelocs *)       \
//      (GInstanceInitFunc) instance_init,      \
//      NULL           (* value_table *)       \
//    };           \
//           \
//  prefix ## _type =  g_type_module_register_type (module, parent_type,   \
//        # name,    \
//        &object_info, 0);   \
//}

(**
 * PANGO_ENGINE_LANG_DEFINE_TYPE:
 * @name: Name of the the type to register (for example:, <literal>ArabicEngineFc</literal>
 * @prefix: Prefix for symbols that will be defined (for example:, <literal>arabic_engine_fc</literal>
 * @class_init: Class initialization function for the new type, or %NULL
 * @instance_init: Instance initialization function for the new type, or %NULL
 *
 * Outputs the necessary code for GObject type registration for a
 * #PangoEngineLang class defined in a module. Two static symbols
 * are defined.
 *
 * <programlisting>
 *  static GType <replaceable>prefix</replaceable>_type;
 *  static void <replaceable>prefix</replaceable>_register_type (GTypeModule module);
 * </programlisting>
 *
 * The <function><replaceable>prefix</replaceable>_register_type()</function>
 * function should be called in your script_engine_init() function for
 * each type that your module implements, and then your script_engine_create()
 * function can create instances of the object as follows:
 *
 * <informalexample><programlisting>
 *  PangoEngine *engine = g_object_new (<replaceable>prefix</replaceable>_type, NULL);
 * </programlisting></informalexample>
 **)

//#define PANGO_ENGINE_LANG_DEFINE_TYPE(name, prefix, class_init, instance_init) \
//  PANGO_ENGINE_DEFINE_TYPE (name, prefix,    \
//       class_init, instance_init,   \
//       PANGO_TYPE_ENGINE_LANG)

(**
 * PANGO_ENGINE_SHAPE_DEFINE_TYPE:
 * @name: Name of the the type to register (for example:, <literal>ArabicEngineFc</literal>
 * @prefix: Prefix for symbols that will be defined (for example:, <literal>arabic_engine_fc</literal>
 * @class_init: Class initialization function for the new type, or %NULL
 * @instance_init: Instance initialization function for the new type, or %NULL
 *
 * Outputs the necessary code for GObject type registration for a
 * #PangoEngineShape class defined in a module. Two static symbols
 * are defined.
 *
 * <programlisting>
 *  static GType <replaceable>prefix</replaceable>_type;
 *  static void <replaceable>prefix</replaceable>_register_type (GTypeModule module);
 * </programlisting>
 *
 * The <function><replaceable>prefix</replaceable>_register_type()</function>
 * function should be called in your script_engine_init() function for
 * each type that your module implements, and then your script_engine_create()
 * function can create instances of the object as follows:
 *
 * <informalexample><programlisting>
 *  PangoEngine *engine = g_object_new (<replaceable>prefix</replaceable>_type, NULL);
 * </programlisting></informalexample>
 **)

//#define PANGO_ENGINE_SHAPE_DEFINE_TYPE(name, prefix, class_init, instance_init) \
//  PANGO_ENGINE_DEFINE_TYPE (name, prefix,    \
//       class_init, instance_init,   \
//       PANGO_TYPE_ENGINE_SHAPE)

(* Macro used for possibly builtin Pango modules. Not useful
 * for externally build modules. If we are compiling a module standalone,
 * then we name the entry points script_engine_list, etc. But if we
 * are compiling it for inclusion directly in Pango, then we need them to
 * to have distinct names for this module, so we prepend a prefix.
 *
 * The two intermediate macros are to deal with details of the C
 * preprocessor; token pasting tokens must be function arguments,
 * and macro substitution isn't used on function arguments that
 * are used for token pasting.
 *)

//#ifdef PANGO_MODULE_PREFIX
//#define PANGO_MODULE_ENTRY(func) _PANGO_MODULE_ENTRY2(PANGO_MODULE_PREFIX,func)
//#define _PANGO_MODULE_ENTRY2(prefix,func) _PANGO_MODULE_ENTRY3(prefix,func)
//#define _PANGO_MODULE_ENTRY3(prefix,func) prefix##_script_engine_##func
//#else
//#define PANGO_MODULE_ENTRY(func) script_engine_##func
//#endif

(* Pango
 * pango-renderer.h: Base class for rendering
 *
 * Copyright (C) 2004, Red Hat, Inc.
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

//#define PANGO_TYPE_RENDERER            (pango_renderer_get_type())
//#define PANGO_RENDERER(object)         (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_RENDERER, PangoRenderer))
//#define PANGO_IS_RENDERER(object)      (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_RENDERER))
//#define PANGO_RENDERER_CLASS(klass)    (G_TYPE_CHECK_CLASS_CAST ((klass), PANGO_TYPE_RENDERER, PangoRendererClass))
//#define PANGO_IS_RENDERER_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), PANGO_TYPE_RENDERER))
//#define PANGO_RENDERER_GET_CLASS(obj)  (G_TYPE_INSTANCE_GET_CLASS ((obj), PANGO_TYPE_RENDERER, PangoRendererClass))

type


  PPangoRendererPrivate = ^PangoRendererPrivate;
  _PangoRendererPrivate = record end;
  PangoRendererPrivate = _PangoRendererPrivate;

(**
 * PangoRenderer:
 * @matrix: the current transformation matrix for the Renderer; may
 *    be %NULL, which should be treated the same as the identity matrix.
 *
 * #PangoRenderer is a base class for objects that are used to
 * render Pango objects such as #PangoGlyphString and
 * #PangoLayout.
 *
 * Since: 1.8
 **)

  PPangoRenderer = ^PangoRenderer;
  _PangoRenderer = record
   (*< private >*)
    parent_instance: GObject;

    underline: PangoUnderline;
    strikethrough: gboolean;
    active_count: Integer;

    (*< public >*)
    matrix: PPangoMatrix;  (* May be NULL *)

    (*< private >*)
    priv: PPangoRendererPrivate;
  end;
  PangoRenderer = _PangoRenderer;


(**
 * PangoRenderPart:
 * @PANGO_RENDER_PART_FOREGROUND: the text itself
 * @PANGO_RENDER_PART_BACKGROUND: the area behind the text
 * @PANGO_RENDER_PART_UNDERLINE: underlines
 * @PANGO_RENDER_PART_STRIKETHROUGH: strikethrough lines
 *
 * #PangoRenderPart defines different items to render for such
 * purposes as setting colors.
 *
 * Since: 1.8
 **)
(* When extending, note N_RENDER_PARTS #define in pango-renderer.c *)

  PangoRenderPart = (
    PANGO_RENDER_PART_FOREGROUND,
    PANGO_RENDER_PART_BACKGROUND,
    PANGO_RENDER_PART_UNDERLINE,
    PANGO_RENDER_PART_STRIKETHROUGH
  );

(**
 * PangoRendererClass:
 * @draw_glyphs: draws a #PangoGlyphString
 * @draw_rectangle: draws a rectangle
 * @draw_error_underline: draws a squiggly line that approximately
 * covers the given rectangle in the style of an underline used to
 * indicate a spelling error.
 * @draw_shape: draw content for a glyph shaped with #PangoAttrShape.
 *   @x, @y are the coordinates of the left edge of the baseline,
 *   in user coordinates.
 * @draw_trapezoid: draws a trapezoidal filled area
 * @draw_glyph: draws a single glyph
 * @part_changed: do renderer specific processing when rendering
 *  attributes change
 * @begin: Do renderer-specific initialization before drawing
 * @end: Do renderer-specific cleanup after drawing
 * @prepare_run: updates the renderer for a new run
 * @draw_glyph_item: draws a #PangoGlyphItem
 *
 * Class structure for #PangoRenderer.
 *
 * Since: 1.8
 **)

  PPangoRendererClass = ^PangoRendererClass;
  _PangoRendererClass = record
    (*< private >*)
    parent_class: GObjectClass;

    (* vtable - not signals *)
    (*< public >*)

    (* All of the following have default implementations
     * and take as coordinates user coordinates in Pango units
     *)
    draw_glyphs: procedure(renderer: PPangoRenderer; font: PPangoFont; glyphs: PPangoGlyphString; x: Integer; y: Integer); cdecl;
    draw_rectangle: procedure(renderer: PPangoRenderer; part: PangoRenderPart; x: Integer; y: Integer; width: Integer; height: Integer); cdecl;
    draw_error_underline: procedure(renderer: PPangoRenderer; x: Integer; y: Integer; width: Integer; height: Integer); cdecl;

    (* Nothing is drawn for shaped glyphs unless this is implemented *)
    draw_shape: procedure(renderer: PPangoRenderer; attr: PPangoAttrShape; x: Integer; y: Integer); cdecl;

    (* These two must be implemented and take coordinates in
     * device space as doubles.
     *)
    draw_trapezoid: procedure(renderer: PPangoRenderer; part: PangoRenderPart; y1_: double; x11: double; x21: double; y2: double; x12: double; x22: double); cdecl;
    draw_glyph: procedure(renderer: PPangoRenderer; font: PPangoFont; glyph: PangoGlyph; x: double; y: double); cdecl;

    (* Notification of change in rendering attributes
     *)
    part_changed: procedure(renderer: PPangoRenderer; part: PangoRenderPart); cdecl;

    (* Paired around drawing operations
    *)
    begin_: procedure(renderer: PPangoRenderer); cdecl;
    end_: procedure(renderer: PPangoRenderer); cdecl;

    (* Hooks into the details of layout rendering
     *)
    prepare_run: procedure(renderer: PPangoRenderer; run: PPangoLayoutRun); cdecl;

    (* All of the following have default implementations
     * and take as coordinates user coordinates in Pango units
     *)
    draw_glyph_item: procedure(renderer: PPangoRenderer; const text: PAnsiChar; glyph_item: PPangoGlyphItem; x: Integer; y: Integer); cdecl;

    (*< private >*)

    (* Padding for future expansion *)
    _pango_reserved2: procedure; cdecl;
    _pango_reserved3: procedure; cdecl;
    _pango_reserved4: procedure; cdecl;
  end;
  PangoRendererClass = _PangoRendererClass;

function pango_renderer_get_type: GType; cdecl;
procedure pango_renderer_draw_layout(renderer: PPangoRenderer; layout: PPangoLayout; x: Integer; y: Integer); cdecl;
procedure pango_renderer_draw_layout_line(renderer: PPangoRenderer; line: PPangoLayoutLine; x: Integer; y: Integer); cdecl;
procedure pango_renderer_draw_glyphs(renderer: PPangoRenderer; font: PPangoFont; glyphs: PPangoGlyphString; x: Integer; y: Integer); cdecl;
procedure pango_renderer_draw_glyph_item(renderer: PPangoRenderer; const text: PAnsiChar; glyph_item: PPangoGlyphItem; x: Integer; y: Integer); cdecl;
procedure pango_renderer_draw_rectangle(renderer: PPangoRenderer; part: PangoRenderPart; x: Integer; y: Integer; width: Integer; height: Integer); cdecl;
procedure pango_renderer_draw_error_underline(renderer: PPangoRenderer; x: Integer; y: Integer; width: Integer; height: Integer); cdecl;
procedure pango_renderer_draw_trapezoid(renderer: PPangoRenderer; part: PangoRenderPart; y1_: double; x11: double; x21: double; y2: double; x12: double; x22: double); cdecl;
procedure pango_renderer_draw_glyph(renderer: PPangoRenderer; font: PPangoFont; glyph: PangoGlyph; x: double; y: double); cdecl;
procedure pango_renderer_activate(renderer: PPangoRenderer); cdecl;
procedure pango_renderer_deactivate(renderer: PPangoRenderer); cdecl;
procedure pango_renderer_part_changed(renderer: PPangoRenderer; part: PangoRenderPart); cdecl;
procedure pango_renderer_set_color(renderer: PPangoRenderer; part: PangoRenderPart; const color: PPangoColor); cdecl;
function pango_renderer_get_color(renderer: PPangoRenderer; part: PangoRenderPart): PPangoColor; cdecl;
procedure pango_renderer_set_matrix(renderer: PPangoRenderer; const matrix: PPangoMatrix); cdecl;
function pango_renderer_get_matrix(renderer: PPangoRenderer): PPangoMatrix; cdecl;
function pango_renderer_get_layout(renderer: PPangoRenderer): PPangoLayout; cdecl;
function pango_renderer_get_layout_line(renderer: PPangoRenderer): PPangoLayoutLine; cdecl;

(* Pango
 * pango-utils.c: Utilities for internal functions and modules
 *
 * Copyright (C) 2000 Red Hat Software
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

function pango_split_file_list(const str: PAnsiChar): PPAnsiChar ; cdecl;
function pango_trim_string(const str: PAnsiChar): PAnsiChar; cdecl;
function pango_read_line(stream: Pointer; str: PGString): gint; cdecl; // stream: file
function pango_skip_space(const pos: PPAnsiChar): gboolean; cdecl;
function pango_scan_word(const pos: PPAnsiChar; out_: PGString): gboolean; cdecl;
function pango_scan_string(const pos: PPAnsiChar; out_: PGString): gboolean; cdecl;
function pango_scan_int(const pos: PPAnsiChar; out_: PInteger): gboolean; cdecl;

//#ifdef PANGO_ENABLE_BACKEND
function pango_config_key_get(const key: PAnsiChar): PAnsiChar ; cdecl;
procedure pango_lookup_aliases(const fontname: PAnsiChar; var families: PPAnsiCharArray; n_families: PInteger); cdecl;
//#endif (* PANGO_ENABLE_BACKEND *)

function pango_parse_enum(type_: GType; const str: PAnsiChar; value: PInteger; warn: gboolean; possible_values: PPAnsiCharArray): gboolean; cdecl;

(* Functions for parsing textual representations
 * of PangoFontDescription fields. They return TRUE if the input string
 * contains a valid value, which then has been assigned to the corresponding
 * field in the PangoFontDescription. If the warn parameter is TRUE,
 * a warning is printed (with g_warning) if the string does not
 * contain a valid value.
 *)
function pango_parse_style(const str: PAnsiChar; style: PPangoStyle; warn: gboolean): gboolean; cdecl;
function pango_parse_variant(const str: PAnsiChar; variant: PPangoVariant; warn: gboolean): gboolean; cdecl;
function pango_parse_weight(const str: PAnsiChar; weight: PPangoWeight; warn: gboolean): gboolean; cdecl;
function pango_parse_stretch(const str: PAnsiChar; stretch: PPangoStretch; warn: gboolean): gboolean; cdecl;

//#ifdef PANGO_ENABLE_BACKEND

(* On Unix, return the name of the "pango" subdirectory of SYSCONFDIR
 * (which is set at compile time). On Win32, return the Pango
 * installation directory (which is set at installation time, and
 * stored in the registry). The returned string should not be
 * g_free'd.
 *)
function pango_get_sysconf_subdirectory: PAnsiChar ; cdecl;

(* Ditto for LIBDIR/pango. On Win32, use the same Pango
 * installation directory. This returned string should not be
 * g_free'd either.
 *)
function pango_get_lib_subdirectory: PAnsiChar ; cdecl;

//#endif (* PANGO_ENABLE_BACKEND *)

(* Hint line position and thickness.
 *)
procedure pango_quantize_line_geometry(thickness: PInteger; position: PInteger); cdecl;

(* A routine from fribidi that we either wrap or provide ourselves.
 *)
function pango_log2vis_get_embedding_levels(const text: PAnsiChar; length: Integer; pbase_dir: PPangoDirection): PByte ; cdecl;

(* Unicode characters that are zero-width and should not be rendered
 * normally.
 *)
function pango_is_zero_width(ch: gunichar): gboolean; cdecl;

(* Pango version checking *)

//(* Encode a Pango version as an integer *)
//#define PANGO_VERSION_ENCODE(major, minor, micro) (     \
//   ((major) * 10000)                             \
// + ((minor) *   100)                             \
// + ((micro) *     1))
//
//(* Encoded version of Pango at compile-time *)
//#define PANGO_VERSION PANGO_VERSION_ENCODE(     \
// PANGO_VERSION_MAJOR,                    \
// PANGO_VERSION_MINOR,                    \
// PANGO_VERSION_MICRO)
//
//(* Check that compile-time Pango is as new as required *)
//#define PANGO_VERSION_CHECK(major,minor,micro)    \
// (PANGO_VERSION >= PANGO_VERSION_ENCODE(major,minor,micro))


(* Return encoded version of Pango at run-time *)
function pango_version: Integer; cdecl;

(* Return run-time Pango version as an string *)
function pango_version_string: PAnsiChar; cdecl;

(* Check that run-time Pango is as new as required *)
function pango_version_check(required_major: Integer; required_minor: Integer; required_micro: Integer): PAnsiChar; cdecl;

implementation

const
  PANGO_LIB = 'libpango-1.0-0.dll';

function pango_script_for_unichar(ch: WideChar): PangoScript; cdecl; external PANGO_LIB;
function pango_script_iter_new(const text: PAnsiChar; length: Integer): PPangoScriptIter; cdecl; external PANGO_LIB;
procedure pango_script_iter_get_range(iter: PPangoScriptIter; start, end_: PPAnsiChar; script: PPangoScript); cdecl; external PANGO_LIB;
function pango_script_iter_next(iter: PPangoScriptIter): gboolean; cdecl; external PANGO_LIB;
procedure pango_script_iter_free(iter: PPangoScriptIter); cdecl; external PANGO_LIB;
function pango_matrix_get_type: GType; cdecl; external PANGO_LIB;
function pango_matrix_copy(matrix: PPangoMatrix): PPangoMatrix; cdecl; external PANGO_LIB;
procedure pango_matrix_free(matrix: PPangoMatrix); cdecl; external PANGO_LIB;
procedure pango_matrix_translate(matrix: PPangoMatrix; tx, ty: Double); cdecl; external PANGO_LIB;
procedure pango_matrix_scale(matrix: PPangoMatrix; scale_x, scale_y: Double); cdecl; external PANGO_LIB;
procedure pango_matrix_rotate(matrix: PPangoMatrix; degrees: Double); cdecl; external PANGO_LIB;
procedure pango_matrix_concat(matrix, new_matrix: PPangoMatrix); cdecl; external PANGO_LIB;
procedure pango_matrix_transform_point(matrix: PPangoMatrix; x, y: PDouble); cdecl; external PANGO_LIB;
procedure pango_matrix_transform_distance(matrix: PPangoMatrix; dx, dy: PDouble); cdecl; external PANGO_LIB;
procedure pango_matrix_transform_rectangle (matrix: PPangoMatrix; rect: PPangoRectangle); cdecl; external PANGO_LIB;
procedure pango_matrix_transform_pixel_rectangle(matrix: PPangoMatrix; rect: PPangoRectangle); cdecl; external PANGO_LIB;
function pango_matrix_get_font_scale_factor(matrix: PPangoMatrix): double; cdecl; external PANGO_LIB;
function pango_script_get_sample_language(script: PangoScript): PPangoLanguage; cdecl; external PANGO_LIB;
function pango_language_get_type: GType; cdecl; external PANGO_LIB;
function pango_language_from_string (const language: PAnsiChar): PPangoLanguage; cdecl; external PANGO_LIB;
function pango_language_to_string(language: PPangoLanguage): PAnsiChar; cdecl; external PANGO_LIB;
function pango_language_get_sample_string (language: PPangoLanguage): PAnsiChar;  cdecl; external PANGO_LIB;
function pango_language_get_default: PPangoLanguage; cdecl; external PANGO_LIB;
function pango_language_matches(language: PPangoLanguage; const range_list: PAnsiChar): gboolean; cdecl; external PANGO_LIB;
function pango_language_includes_script (language: PPangoLanguage; script: PangoScript): gboolean; cdecl; external PANGO_LIB;
function pango_language_get_scripts(language: PPangoLanguage; num_scripts: PInteger): PPangoScript; cdecl; external PANGO_LIB;
function pango_gravity_to_rotation(gravity: PangoGravity): double; cdecl; external PANGO_LIB;
function pango_gravity_get_for_matrix (const matrix: PPangoMatrix): PangoGravity; cdecl; external PANGO_LIB;
function pango_gravity_get_for_script (script: PangoScript; base_gravity: PangoGravity; hint: PangoGravityHint): PangoGravity; cdecl; external PANGO_LIB;
function pango_bidi_type_for_unichar (ch: WideChar): PangoBidiType; cdecl; external PANGO_LIB;
function pango_unichar_direction(ch: WideChar): PangoDirection; cdecl; external PANGO_LIB;
function pango_find_base_dir(const text: PAnsiChar; length: Integer): PangoDirection; cdecl; external PANGO_LIB;
function pango_get_mirror_char(ch: WideChar; mirrored_ch: PWideChar): gboolean; cdecl; external PANGO_LIB;
function pango_units_from_double(d: Double): Integer; cdecl; external PANGO_LIB;
function pango_units_to_double(i: Integer): Double; cdecl; external PANGO_LIB;
procedure pango_extents_to_pixels (inclusive, nearest: PPangoRectangle); cdecl; external PANGO_LIB;
function pango_coverage_new: PPangoCoverage; cdecl; external PANGO_LIB;
function pango_coverage_ref(coverage: PPangoCoverage): PPangoCoverage; cdecl; external PANGO_LIB;
procedure pango_coverage_unref(coverage: PPangoCoverage); cdecl; external PANGO_LIB;
function pango_coverage_copy(coverage: PPangoCoverage): PPangoCoverage; cdecl external PANGO_LIB;
function pango_coverage_get(coverage: PPangoCoverage; index_: Integer): PangoCoverageLevel; cdecl; external PANGO_LIB;
procedure pango_coverage_set(coverage: PPangoCoverage; index_: Integer; level: PangoCoverageLevel); cdecl; external PANGO_LIB;
procedure pango_coverage_max(coverage, other: PPangoCoverage); cdecl; external PANGO_LIB;
procedure pango_coverage_to_bytes(coverage: PPangoCoverage; bytes: PPointer; n_bytes: PInteger);  cdecl; external PANGO_LIB;
function pango_coverage_from_bytes(bytes: PByte; n_bytes: Integer): PPangoCoverage;  cdecl; external PANGO_LIB;
function pango_font_description_get_type: GType; cdecl; external PANGO_LIB;
function pango_font_description_new: PPangoFontDescription; cdecl; external PANGO_LIB;
function pango_font_description_copy(const desc: PPangoFontDescription): PPangoFontDescription; cdecl; external PANGO_LIB;
function pango_font_description_copy_static(const desc: PPangoFontDescription): PPangoFontDescription; cdecl; external PANGO_LIB;
function pango_font_description_hash(const desc: PPangoFontDescription): Cardinal; cdecl; external PANGO_LIB;
function pango_font_description_equal(const desc1, desc2: PPangoFontDescription): gboolean; cdecl; external PANGO_LIB;
procedure pango_font_description_free(desc: PPangoFontDescription); cdecl; external PANGO_LIB;
procedure pango_font_descriptions_free(descs: PPPangoFontDescription; n_descs: Integer); cdecl; external PANGO_LIB;
procedure pango_font_description_set_family(desc: PPangoFontDescription; const family: PAnsiChar); cdecl; external PANGO_LIB;
procedure pango_font_description_set_family_static(desc: PPangoFontDescription; const family: PAnsiChar); cdecl; external PANGO_LIB;
function pango_font_description_get_family(const desc: PPangoFontDescription): PAnsiChar; cdecl; external PANGO_LIB;
procedure pango_font_description_set_style(desc: PPangoFontDescription; style: PangoStyle); cdecl; external PANGO_LIB;
function pango_font_description_get_style(const desc: PPangoFontDescription): PangoStyle; cdecl; external PANGO_LIB;
procedure pango_font_description_set_variant(desc: PPangoFontDescription; variant: PangoVariant); cdecl; external PANGO_LIB;
function pango_font_description_get_variant(const desc: PPangoFontDescription): PangoVariant; cdecl; external PANGO_LIB;
procedure pango_font_description_set_weight(desc: PPangoFontDescription; weight: PangoWeight); cdecl; external PANGO_LIB;
function pango_font_description_get_weight(const desc: PPangoFontDescription): PangoWeight; cdecl; external PANGO_LIB;
procedure pango_font_description_set_stretch(desc: PPangoFontDescription; stretch: PangoStretch); cdecl; external PANGO_LIB;
function pango_font_description_get_stretch(const desc: PPangoFontDescription): PangoStretch; cdecl; external PANGO_LIB;
procedure pango_font_description_set_size(desc: PPangoFontDescription; size: Integer); cdecl; external PANGO_LIB;
function pango_font_description_get_size(const desc: PPangoFontDescription): Integer; cdecl; external PANGO_LIB;
procedure pango_font_description_set_absolute_size(desc: PPangoFontDescription; size: Double); cdecl; external PANGO_LIB;
function pango_font_description_get_size_is_absolute(const desc: PPangoFontDescription): gboolean; cdecl; external PANGO_LIB;
procedure pango_font_description_set_gravity(desc: PPangoFontDescription; gravity: PangoGravity); cdecl; external PANGO_LIB;
function pango_font_description_get_gravity(const desc: PPangoFontDescription): PangoGravity; cdecl; external PANGO_LIB;
function pango_font_description_get_set_fields(const desc: PPangoFontDescription): PangoFontMask; cdecl; external PANGO_LIB;
procedure pango_font_description_unset_fields(desc: PPangoFontDescription; to_unset: PangoFontMask); cdecl; external PANGO_LIB;
procedure pango_font_description_merge(desc: PPangoFontDescription; const desc_to_merge: PPangoFontDescription; replace_existing: gboolean); cdecl; external PANGO_LIB;
procedure pango_font_description_merge_static(desc: PPangoFontDescription; const desc_to_merge: PPangoFontDescription; replace_existing: gboolean); cdecl; external PANGO_LIB;
function pango_font_description_better_match(const desc: PPangoFontDescription; const old_match: PPangoFontDescription; const new_match: PPangoFontDescription): gboolean; cdecl; external PANGO_LIB;
function pango_font_description_from_string(const str: PAnsiChar): PPangoFontDescription; cdecl; external PANGO_LIB;
function pango_font_description_to_string(const desc: PPangoFontDescription): PAnsiChar; cdecl; external PANGO_LIB;
function pango_font_description_to_filename(const desc: PPangoFontDescription): PAnsiChar; cdecl; external PANGO_LIB;
function pango_font_metrics_get_type: GType; cdecl; external PANGO_LIB;
function pango_font_metrics_ref(metrics: PPangoFontMetrics): PPangoFontMetrics; cdecl; external PANGO_LIB;
procedure pango_font_metrics_unref(metrics: PPangoFontMetrics); cdecl; external PANGO_LIB;
function pango_font_metrics_get_ascent(metrics: PPangoFontMetrics): Integer; cdecl; external PANGO_LIB;
function pango_font_metrics_get_descent(metrics: PPangoFontMetrics): Integer; cdecl; external PANGO_LIB;
function pango_font_metrics_get_approximate_char_width(metrics: PPangoFontMetrics): Integer; cdecl; external PANGO_LIB;
function pango_font_metrics_get_approximate_digit_width(metrics: PPangoFontMetrics): Integer; cdecl; external PANGO_LIB;
function pango_font_metrics_get_underline_position(metrics: PPangoFontMetrics): Integer; cdecl; external PANGO_LIB;
function pango_font_metrics_get_underline_thickness(metrics: PPangoFontMetrics): Integer; cdecl; external PANGO_LIB;
function pango_font_metrics_get_strikethrough_position(metrics: PPangoFontMetrics): Integer; cdecl; external PANGO_LIB;
function pango_font_metrics_get_strikethrough_thickness(metrics: PPangoFontMetrics): Integer; cdecl; external PANGO_LIB;
function pango_font_metrics_new: PPangoFontMetrics; cdecl; external PANGO_LIB;
function pango_font_family_get_type: GType; cdecl; external PANGO_LIB;
procedure pango_font_family_list_faces(family: PPangoFontFamily; faces: PPPPangoFontFace; n_faces: PInteger); cdecl; external PANGO_LIB;
function pango_font_family_get_name(family: PPangoFontFamily): PAnsiChar; cdecl; external PANGO_LIB;
function pango_font_family_is_monospace(family: PPangoFontFamily): gboolean; cdecl; external PANGO_LIB;
function pango_font_face_get_type: GType; cdecl; external PANGO_LIB;
function pango_font_face_describe(face: PPangoFontFace): PPangoFontDescription; cdecl; external PANGO_LIB;
function pango_font_face_get_face_name(face: PPangoFontFace): PAnsiChar; cdecl; external PANGO_LIB;
procedure pango_font_face_list_sizes(face: PPangoFontFace; var sizes: Pinteger; var n_sizes: Integer); cdecl; external PANGO_LIB;
function pango_font_face_is_synthesized(face: PPangoFontFace): gboolean; cdecl; external PANGO_LIB;
function pango_font_get_type: GType; cdecl; external PANGO_LIB;
function pango_font_describe(font: PPangoFont): PPangoFontDescription; cdecl; external PANGO_LIB;
function pango_font_describe_with_absolute_size(font: PPangoFont): PPangoFontDescription; cdecl; external PANGO_LIB;
function pango_font_get_coverage(font: PPangoFont; language: PPangoLanguage): PPangoCoverage; cdecl; external PANGO_LIB;
function pango_font_find_shaper(font: PPangoFont; language: PPangoLanguage; ch: Cardinal): PPangoEngineShape; cdecl; external PANGO_LIB;
function pango_font_get_metrics(font: PPangoFont; language: PPangoLanguage): PPangoFontMetrics; cdecl; external PANGO_LIB;
procedure pango_font_get_glyph_extents(font: PPangoFont; glyph: PangoGlyph; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl; external PANGO_LIB;
function pango_font_get_font_map(font: PPangoFont): PPangoFontMap; cdecl; external PANGO_LIB;
function pango_color_get_type: GType; cdecl; external PANGO_LIB;
function pango_color_copy(const src: PPangoColor): PPangoColor; cdecl; external PANGO_LIB;
procedure pango_color_free(color: PPangoColor); cdecl; external PANGO_LIB;
function pango_color_parse(color: PPangoColor; const spec: PAnsiChar): gboolean; cdecl; external PANGO_LIB;
function pango_color_to_string(const color: PPangoColor): PAnsiChar; cdecl; external PANGO_LIB;
function pango_attr_type_register(const name: PAnsiChar): PangoAttrType; cdecl; external PANGO_LIB;
function pango_attr_type_get_name(type_: PangoAttrType): PAnsiChar; cdecl; external PANGO_LIB;
procedure pango_attribute_init(attr: PPangoAttribute; const klass: PPangoAttrClass); cdecl; external PANGO_LIB;
function pango_attribute_copy(const attr: PPangoAttribute): PPangoAttribute ; cdecl; external PANGO_LIB;
procedure pango_attribute_destroy(attr: PPangoAttribute); cdecl; external PANGO_LIB;
function pango_attribute_equal(const attr1: PPangoAttribute; const attr2: PPangoAttribute): gboolean; cdecl; external PANGO_LIB;
function pango_attr_language_new(language: PPangoLanguage): PPangoAttribute; cdecl; external PANGO_LIB;
function pango_attr_family_new(const family: PAnsiChar): PPangoAttribute; cdecl; external PANGO_LIB;
function pango_attr_foreground_new(red: Word; green: Word; blue: Word): PPangoAttribute; cdecl; external PANGO_LIB;
function pango_attr_background_new(red: Word; green: Word; blue: Word): PPangoAttribute; cdecl; external PANGO_LIB;
function pango_attr_size_new(size: Integer): PPangoAttribute; cdecl; external PANGO_LIB;
function pango_attr_size_new_absolute(size: Integer): PPangoAttribute; cdecl; external PANGO_LIB;
function pango_attr_style_new(style: PangoStyle): PPangoAttribute; cdecl; external PANGO_LIB;
function pango_attr_weight_new(weight: PangoWeight): PPangoAttribute; cdecl; external PANGO_LIB;
function pango_attr_variant_new(variant: PangoVariant): PPangoAttribute; cdecl; external PANGO_LIB;
function pango_attr_stretch_new(stretch: PangoStretch): PPangoAttribute; cdecl; external PANGO_LIB;
function pango_attr_font_desc_new(const desc: PPangoFontDescription): PPangoAttribute; cdecl; external PANGO_LIB;
function pango_attr_underline_new(underline: PangoUnderline): PPangoAttribute; cdecl; external PANGO_LIB;
function pango_attr_underline_color_new(red: Word; green: Word; blue: Word): PPangoAttribute; cdecl; external PANGO_LIB;
function pango_attr_strikethrough_new(strikethrough: gboolean): PPangoAttribute; cdecl; external PANGO_LIB;
function pango_attr_strikethrough_color_new(red: Word; green: Word; blue: Word): PPangoAttribute; cdecl; external PANGO_LIB;
function pango_attr_rise_new(rise: Integer): PPangoAttribute; cdecl; external PANGO_LIB;
function pango_attr_scale_new(scale_factor: double): PPangoAttribute; cdecl; external PANGO_LIB;
function pango_attr_fallback_new(enable_fallback: gboolean): PPangoAttribute; cdecl; external PANGO_LIB;
function pango_attr_letter_spacing_new(letter_spacing: Integer): PPangoAttribute; cdecl; external PANGO_LIB;
function pango_attr_shape_new(const ink_rect: PPangoRectangle; const logical_rect: PPangoRectangle): PPangoAttribute; cdecl; external PANGO_LIB;
function pango_attr_shape_new_with_data(const ink_rect: PPangoRectangle; const logical_rect: PPangoRectangle; data: Pointer; copy_func: PangoAttrDataCopyFunc; destroy_func: GDestroyNotify): PPangoAttribute; cdecl; external PANGO_LIB;
function pango_attr_gravity_new(gravity: PangoGravity): PPangoAttribute; cdecl; external PANGO_LIB;
function pango_attr_gravity_hint_new(hint: PangoGravityHint): PPangoAttribute; cdecl; external PANGO_LIB;
function pango_attr_list_get_type: GType; cdecl; external PANGO_LIB;
function pango_attr_list_new: PPangoAttrList ; cdecl; external PANGO_LIB;
function pango_attr_list_ref(list: PPangoAttrList): PPangoAttrList ; cdecl; external PANGO_LIB;
procedure pango_attr_list_unref(list: PPangoAttrList); cdecl; external PANGO_LIB;
function pango_attr_list_copy(list: PPangoAttrList): PPangoAttrList ; cdecl; external PANGO_LIB;
procedure pango_attr_list_insert(list: PPangoAttrList; attr: PPangoAttribute); cdecl; external PANGO_LIB;
procedure pango_attr_list_insert_before(list: PPangoAttrList; attr: PPangoAttribute); cdecl; external PANGO_LIB;
procedure pango_attr_list_change(list: PPangoAttrList; attr: PPangoAttribute); cdecl; external PANGO_LIB;
procedure pango_attr_list_splice(list: PPangoAttrList; other: PPangoAttrList; pos: Integer; len: Integer); cdecl; external PANGO_LIB;
function pango_attr_list_filter(list: PPangoAttrList; func: PangoAttrFilterFunc; data: Pointer): PPangoAttrList; cdecl; external PANGO_LIB;
function pango_attr_list_get_iterator(list: PPangoAttrList): PPangoAttrIterator; cdecl; external PANGO_LIB;
procedure pango_attr_iterator_range(iterator: PPangoAttrIterator; start: PInteger; end_: PInteger); cdecl; external PANGO_LIB;
function pango_attr_iterator_next(iterator: PPangoAttrIterator): gboolean; cdecl; external PANGO_LIB;
function pango_attr_iterator_copy(iterator: PPangoAttrIterator): PPangoAttrIterator; cdecl; external PANGO_LIB;
procedure pango_attr_iterator_destroy(iterator: PPangoAttrIterator); cdecl; external PANGO_LIB;
function pango_attr_iterator_get(iterator: PPangoAttrIterator; type_: PangoAttrType): PPangoAttribute ; cdecl; external PANGO_LIB;
procedure pango_attr_iterator_get_font(iterator: PPangoAttrIterator; desc: PPangoFontDescription; language: PPPangoLanguage; extra_attrs: PPGSList); cdecl; external PANGO_LIB;
function pango_attr_iterator_get_attrs(iterator: PPangoAttrIterator): PGSList ; cdecl; external PANGO_LIB;
function pango_parse_markup(const markup_text: PAnsiChar; length: Integer; accel_marker: WideChar; attr_list: PPPangoAttrList; text: PPAnsiChar; accel_char: PWideChar; error: Pointer): gboolean; cdecl; external PANGO_LIB;
function pango_fontset_get_type: GType; cdecl; external PANGO_LIB;
function pango_fontset_get_font(fontset: PPangoFontset; wc: Cardinal): PPangoFont; cdecl; external PANGO_LIB;
function pango_fontset_get_metrics(fontset: PPangoFontset): PPangoFontMetrics; cdecl; external PANGO_LIB;
procedure pango_fontset_foreach(fontset: PPangoFontset; func: PangoFontsetForeachFunc; data: Pointer); cdecl; external PANGO_LIB;
function pango_fontset_simple_get_type: GType; cdecl; external PANGO_LIB;
function pango_fontset_simple_new(language: PPangoLanguage): PPangoFontsetSimple; cdecl; external PANGO_LIB;
procedure pango_fontset_simple_append(fontset: PPangoFontsetSimple; font: PPangoFont); cdecl; external PANGO_LIB;
function pango_fontset_simple_size(fontset: PPangoFontsetSimple): Integer; cdecl; external PANGO_LIB;
function pango_font_map_get_type: GType; cdecl; external PANGO_LIB;
function pango_font_map_create_context(fontmap: PPangoFontMap): PPangoContext; cdecl; external PANGO_LIB;
function pango_font_map_load_font(fontmap: PPangoFontMap; context: PPangoContext; const desc: PPangoFontDescription): PPangoFont; cdecl; external PANGO_LIB;
function pango_font_map_load_fontset(fontmap: PPangoFontMap; context: PPangoContext; const desc: PPangoFontDescription; language: PPangoLanguage): PPangoFontset; cdecl; external PANGO_LIB;
procedure pango_font_map_list_families(fontmap: PPangoFontMap; families: PPPPangoFontFamily; n_families: PInteger); cdecl; external PANGO_LIB;
function pango_font_map_get_shape_engine_type(fontmap: PPangoFontMap): PAnsiChar; cdecl; external PANGO_LIB;
function pango_context_get_type: GType; cdecl; external PANGO_LIB;
function pango_context_new: PPangoContext; cdecl; external PANGO_LIB;
procedure pango_context_set_font_map(context: PPangoContext; font_map: PPangoFontMap); cdecl; external PANGO_LIB;
function pango_context_get_font_map(context: PPangoContext): PPangoFontMap; cdecl; external PANGO_LIB;
procedure pango_context_list_families(context: PPangoContext; families: PPPPangoFontFamily; n_families: PInteger); cdecl; external PANGO_LIB;
function pango_context_load_font(context: PPangoContext; const desc: PPangoFontDescription): PPangoFont; cdecl; external PANGO_LIB;
function pango_context_load_fontset(context: PPangoContext; const desc: PPangoFontDescription; language: PPangoLanguage): PPangoFontset; cdecl; external PANGO_LIB;
function pango_context_get_metrics(context: PPangoContext; const desc: PPangoFontDescription; language: PPangoLanguage): PPangoFontMetrics; cdecl; external PANGO_LIB;
procedure pango_context_set_font_description(context: PPangoContext; const desc: PPangoFontDescription); cdecl; external PANGO_LIB;
function pango_context_get_font_description(context: PPangoContext): PPangoFontDescription; cdecl; external PANGO_LIB;
function pango_context_get_language(context: PPangoContext): PPangoLanguage; cdecl; external PANGO_LIB;
procedure pango_context_set_language(context: PPangoContext; language: PPangoLanguage); cdecl; external PANGO_LIB;
procedure pango_context_set_base_dir(context: PPangoContext; direction: PangoDirection); cdecl; external PANGO_LIB;
function pango_context_get_base_dir(context: PPangoContext): PangoDirection; cdecl; external PANGO_LIB;
procedure pango_context_set_base_gravity(context: PPangoContext; gravity: PangoGravity); cdecl; external PANGO_LIB;
function pango_context_get_base_gravity(context: PPangoContext): PangoGravity; cdecl; external PANGO_LIB;
function pango_context_get_gravity(context: PPangoContext): PangoGravity; cdecl; external PANGO_LIB;
procedure pango_context_set_gravity_hint(context: PPangoContext; hint: PangoGravityHint); cdecl; external PANGO_LIB;
function pango_context_get_gravity_hint(context: PPangoContext): PangoGravityHint; cdecl; external PANGO_LIB;
procedure pango_context_set_matrix(context: PPangoContext; const matrix: PPangoMatrix); cdecl; external PANGO_LIB;
function pango_context_get_matrix(context: PPangoContext): PPangoMatrix; cdecl; external PANGO_LIB;
function pango_itemize(context: PPangoContext; const text: PAnsiChar; start_index: Integer; length: Integer; attrs: PPangoAttrList; cached_iter: PPangoAttrIterator): PGList; cdecl; external PANGO_LIB;
function pango_itemize_with_base_dir(context: PPangoContext; base_dir: PangoDirection; const text: PAnsiChar; start_index: Integer; length: Integer; attrs: PPangoAttrList; cached_iter: PPangoAttrIterator): PGList; cdecl; external PANGO_LIB;

function pango_item_get_type: GType; cdecl; external PANGO_LIB;
function pango_item_new: PPangoItem; cdecl; external PANGO_LIB;
function pango_item_copy(item: PPangoItem): PPangoItem; cdecl; external PANGO_LIB;
procedure pango_item_free(item: PPangoItem); cdecl; external PANGO_LIB;
function pango_item_split(orig: PPangoItem; split_index: Integer; split_offset: Integer): PPangoItem; cdecl; external PANGO_LIB;
function pango_glyph_string_new: PPangoGlyphString; cdecl; external PANGO_LIB;
procedure pango_glyph_string_set_size(str: PPangoGlyphString; new_len: Integer); cdecl; external PANGO_LIB;
function pango_glyph_string_get_type: GType; cdecl; external PANGO_LIB;
function pango_glyph_string_copy(str: PPangoGlyphString): PPangoGlyphString; cdecl; external PANGO_LIB;
procedure pango_glyph_string_free(str: PPangoGlyphString); cdecl; external PANGO_LIB;
procedure pango_glyph_string_extents(glyphs: PPangoGlyphString; font: PPangoFont; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl; external PANGO_LIB;
function pango_glyph_string_get_width(glyphs: PPangoGlyphString): Integer; cdecl; external PANGO_LIB;
procedure pango_glyph_string_extents_range(glyphs: PPangoGlyphString; start: Integer; end_: Integer; font: PPangoFont; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl; external PANGO_LIB;
procedure pango_glyph_string_get_logical_widths(glyphs: PPangoGlyphString; const text: PAnsiChar; length: Integer; embedding_level: Integer; logical_widths: PInteger); cdecl; external PANGO_LIB;
procedure pango_glyph_string_index_to_x(glyphs: PPangoGlyphString; text: PAnsiChar; length: Integer; analysis: PPangoAnalysis; index_: Integer; trailing: gboolean; x_pos: PInteger); cdecl; external PANGO_LIB;
procedure pango_glyph_string_x_to_index(glyphs: PPangoGlyphString; text: PAnsiChar; length: Integer; analysis: PPangoAnalysis; x_pos: Integer; index_: PInteger; trailing: PInteger); cdecl; external PANGO_LIB;
procedure pango_shape(const text: PAnsiChar; length: Integer; const analysis: PPangoAnalysis; glyphs: PPangoGlyphString); cdecl; external PANGO_LIB;
function pango_reorder_items(logical_items: PGList): PGList; cdecl; external PANGO_LIB;
procedure pango_break(const text: PAnsiChar; length: Integer; analysis: PPangoAnalysis; attrs: PPangoLogAttr; attrs_len: Integer); cdecl; external PANGO_LIB;
procedure pango_find_paragraph_boundary(const text: PAnsiChar; length: Integer; paragraph_delimiter_index: PInteger; next_paragraph_start: PInteger); cdecl; external PANGO_LIB;
procedure pango_get_log_attrs(const text: PAnsiChar; length: Integer; level: Integer; language: PPangoLanguage; log_attrs: PPangoLogAttr; attrs_len: Integer); cdecl; external PANGO_LIB;
procedure pango_default_break(const text: PAnsiChar; length: Integer; analysis: PPangoAnalysis; attrs: PPangoLogAttr; attrs_len: Integer); cdecl; external PANGO_LIB;
function pango_tab_array_new(initial_size: Integer; positions_in_pixels: gboolean): PPangoTabArray; cdecl; external PANGO_LIB;
function pango_tab_array_new_with_positions(size: Integer; positions_in_pixels: gboolean; first_alignment: PangoTabAlign; first_position: Integer): PPangoTabArray; varargs; cdecl; external PANGO_LIB;
function pango_tab_array_get_type: GType; cdecl; external PANGO_LIB;
function pango_tab_array_copy(src: PPangoTabArray): PPangoTabArray; cdecl; external PANGO_LIB;
procedure pango_tab_array_free(tab_array: PPangoTabArray); cdecl; external PANGO_LIB;
function pango_tab_array_get_size(tab_array: PPangoTabArray): Integer; cdecl; external PANGO_LIB;
procedure pango_tab_array_resize(tab_array: PPangoTabArray; new_size: Integer); cdecl; external PANGO_LIB;
procedure pango_tab_array_set_tab(tab_array: PPangoTabArray; tab_index: Integer; alignment: PangoTabAlign; location: Integer); cdecl; external PANGO_LIB;
procedure pango_tab_array_get_tab(tab_array: PPangoTabArray; tab_index: Integer; alignment: PPangoTabAlign; location: PInteger); cdecl; external PANGO_LIB;
procedure pango_tab_array_get_tabs(tab_array: PPangoTabArray; var alignments: PPangoTabAlign; var locations: PInteger); cdecl; external PANGO_LIB;
function pango_tab_array_get_positions_in_pixels(tab_array: PPangoTabArray): gboolean; cdecl; external PANGO_LIB;
function pango_glyph_item_get_type: GType; cdecl; external PANGO_LIB;
function pango_glyph_item_split(orig: PPangoGlyphItem; const text: PAnsiChar; split_index: Integer): PPangoGlyphItem; cdecl; external PANGO_LIB;
function pango_glyph_item_copy(orig: PPangoGlyphItem): PPangoGlyphItem; cdecl; external PANGO_LIB;
procedure pango_glyph_item_free(glyph_item: PPangoGlyphItem); cdecl; external PANGO_LIB;
function pango_glyph_item_apply_attrs(glyph_item: PPangoGlyphItem; const text: PAnsiChar; list: PPangoAttrList): PGSList ; cdecl; external PANGO_LIB;
procedure pango_glyph_item_letter_space(glyph_item: PPangoGlyphItem; const text: PAnsiChar; log_attrs: PPangoLogAttr; letter_spacing: Integer); cdecl; external PANGO_LIB;
function pango_glyph_item_iter_get_type: GType; cdecl; external PANGO_LIB;
function pango_glyph_item_iter_copy(orig: PPangoGlyphItemIter): PPangoGlyphItemIter; cdecl; external PANGO_LIB;
procedure pango_glyph_item_iter_free(iter: PPangoGlyphItemIter); cdecl; external PANGO_LIB;
function pango_glyph_item_iter_init_start(iter: PPangoGlyphItemIter; glyph_item: PPangoGlyphItem; const text: PAnsiChar ): gboolean; cdecl; external PANGO_LIB;
function pango_glyph_item_iter_init_end(iter: PPangoGlyphItemIter; glyph_item: PPangoGlyphItem; const text: PAnsiChar): gboolean; cdecl; external PANGO_LIB;
function pango_glyph_item_iter_next_cluster(iter: PPangoGlyphItemIter): gboolean; cdecl; external PANGO_LIB;
function pango_glyph_item_iter_prev_cluster(iter: PPangoGlyphItemIter): gboolean; cdecl; external PANGO_LIB;
function pango_layout_get_type: GType; cdecl; external PANGO_LIB;
function pango_layout_new(context: PPangoContext): PPangoLayout; cdecl; external PANGO_LIB;
function pango_layout_copy(src: PPangoLayout): PPangoLayout; cdecl; external PANGO_LIB;
function pango_layout_get_context(layout: PPangoLayout): PPangoContext; cdecl; external PANGO_LIB;
procedure pango_layout_set_attributes(layout: PPangoLayout; attrs: PPangoAttrList); cdecl; external PANGO_LIB;
function pango_layout_get_attributes(layout: PPangoLayout): PPangoAttrList; cdecl; external PANGO_LIB;
procedure pango_layout_set_text(layout: PPangoLayout; const text: PAnsiChar; length: Integer); cdecl; external PANGO_LIB;
function pango_layout_get_text(layout: PPangoLayout): PAnsiChar; cdecl; external PANGO_LIB;
procedure pango_layout_set_markup(layout: PPangoLayout; const markup: PAnsiChar; length: Integer); cdecl; external PANGO_LIB;
procedure pango_layout_set_markup_with_accel(layout: PPangoLayout; const markup: PAnsiChar; length: Integer; accel_marker: WideChar; accel_char: PWideChar); cdecl; external PANGO_LIB;
procedure pango_layout_set_font_description(layout: PPangoLayout; const desc: PPangoFontDescription); cdecl; external PANGO_LIB;
function pango_layout_get_font_description(layout: PPangoLayout): PPangoFontDescription; cdecl; external PANGO_LIB;
procedure pango_layout_set_width(layout: PPangoLayout; width: Integer); cdecl; external PANGO_LIB;
function pango_layout_get_width(layout: PPangoLayout): Integer; cdecl; external PANGO_LIB;
procedure pango_layout_set_height(layout: PPangoLayout; height: Integer); cdecl; external PANGO_LIB;
function pango_layout_get_height(layout: PPangoLayout): Integer; cdecl; external PANGO_LIB;
procedure pango_layout_set_wrap(layout: PPangoLayout; wrap: PangoWrapMode); cdecl; external PANGO_LIB;
function pango_layout_get_wrap(layout: PPangoLayout): PangoWrapMode; cdecl; external PANGO_LIB;
function pango_layout_is_wrapped(layout: PPangoLayout): gboolean; cdecl; external PANGO_LIB;
procedure pango_layout_set_indent(layout: PPangoLayout; indent: Integer); cdecl; external PANGO_LIB;
function pango_layout_get_indent(layout: PPangoLayout): Integer; cdecl; external PANGO_LIB;
procedure pango_layout_set_spacing(layout: PPangoLayout; spacing: Integer); cdecl; external PANGO_LIB;
function pango_layout_get_spacing(layout: PPangoLayout): Integer; cdecl; external PANGO_LIB;
procedure pango_layout_set_justify(layout: PPangoLayout; justify: gboolean); cdecl; external PANGO_LIB;
function pango_layout_get_justify(layout: PPangoLayout): gboolean; cdecl; external PANGO_LIB;
procedure pango_layout_set_auto_dir(layout: PPangoLayout; auto_dir: gboolean); cdecl; external PANGO_LIB;
function pango_layout_get_auto_dir(layout: PPangoLayout): gboolean; cdecl; external PANGO_LIB;
procedure pango_layout_set_alignment(layout: PPangoLayout; alignment: PangoAlignment); cdecl; external PANGO_LIB;
function pango_layout_get_alignment(layout: PPangoLayout): PangoAlignment; cdecl; external PANGO_LIB;
procedure pango_layout_set_tabs(layout: PPangoLayout; tabs: PPangoTabArray); cdecl; external PANGO_LIB;
function pango_layout_get_tabs(layout: PPangoLayout): PPangoTabArray; cdecl; external PANGO_LIB;
procedure pango_layout_set_single_paragraph_mode(layout: PPangoLayout; setting: gboolean); cdecl; external PANGO_LIB;
function pango_layout_get_single_paragraph_mode(layout: PPangoLayout): gboolean; cdecl; external PANGO_LIB;
procedure pango_layout_set_ellipsize(layout: PPangoLayout; ellipsize: PangoEllipsizeMode); cdecl; external PANGO_LIB;
function pango_layout_get_ellipsize(layout: PPangoLayout): PangoEllipsizeMode; cdecl; external PANGO_LIB;
function pango_layout_is_ellipsized(layout: PPangoLayout): gboolean; cdecl; external PANGO_LIB;
function pango_layout_get_unknown_glyphs_count(layout: PPangoLayout): Integer; cdecl; external PANGO_LIB;
procedure pango_layout_context_changed(layout: PPangoLayout); cdecl; external PANGO_LIB;
procedure pango_layout_get_log_attrs(layout: PPangoLayout; var attrs: PPangoLogAttr; var n_attrs: Integer); cdecl; external PANGO_LIB;
procedure pango_layout_index_to_pos(layout: PPangoLayout; index_: Integer; pos: PPangoRectangle); cdecl; external PANGO_LIB;
procedure pango_layout_index_to_line_x(layout: PPangoLayout; index_: Integer; trailing: gboolean; line: PInteger; x_pos: PInteger); cdecl; external PANGO_LIB;
procedure pango_layout_get_cursor_pos(layout: PPangoLayout; index_: Integer; strong_pos: PPangoRectangle; weak_pos: PPangoRectangle); cdecl; external PANGO_LIB;
procedure pango_layout_move_cursor_visually(layout: PPangoLayout; strong: gboolean; old_index: Integer; old_trailing: Integer; direction: Integer; new_index: PInteger; new_trailing: PInteger); cdecl; external PANGO_LIB;
function pango_layout_xy_to_index(layout: PPangoLayout; x: Integer; y: Integer; index_: PInteger; trailing: PInteger): gboolean; cdecl; external PANGO_LIB;
procedure pango_layout_get_extents(layout: PPangoLayout; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl; external PANGO_LIB;
procedure pango_layout_get_pixel_extents(layout: PPangoLayout; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl; external PANGO_LIB;
procedure pango_layout_get_size(layout: PPangoLayout; width: PInteger; height: PInteger); cdecl; external PANGO_LIB;
procedure pango_layout_get_pixel_size(layout: PPangoLayout; width: PInteger; height: PInteger); cdecl; external PANGO_LIB;
function pango_layout_get_baseline(layout: PPangoLayout): Integer; cdecl; external PANGO_LIB;
function pango_layout_get_line_count(layout: PPangoLayout): Integer; cdecl; external PANGO_LIB;
function pango_layout_get_line(layout: PPangoLayout; line: Integer): PPangoLayoutLine; cdecl; external PANGO_LIB;
function pango_layout_get_line_readonly(layout: PPangoLayout; line: Integer): PPangoLayoutLine; cdecl; external PANGO_LIB;
function pango_layout_get_lines(layout: PPangoLayout): PGSList; cdecl; external PANGO_LIB;
function pango_layout_get_lines_readonly(layout: PPangoLayout): PGSList; cdecl; external PANGO_LIB;
function pango_layout_line_get_type: GType; cdecl; external PANGO_LIB;
function pango_layout_line_ref(line: PPangoLayoutLine): PPangoLayoutLine; cdecl; external PANGO_LIB;
procedure pango_layout_line_unref(line: PPangoLayoutLine); cdecl; external PANGO_LIB;
function pango_layout_line_x_to_index(line: PPangoLayoutLine; x_pos: Integer; index_: PInteger ; trailing: PInteger): gboolean; cdecl; external PANGO_LIB;
procedure pango_layout_line_index_to_x(line: PPangoLayoutLine; index_: Integer; trailing: gboolean; x_pos: PInteger); cdecl; external PANGO_LIB;
procedure pango_layout_line_get_x_ranges(line: PPangoLayoutLine; start_index: Integer; end_index: Integer; var ranges: PInteger; n_ranges: PInteger); cdecl; external PANGO_LIB;
procedure pango_layout_line_get_extents(line: PPangoLayoutLine; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl; external PANGO_LIB;
procedure pango_layout_line_get_pixel_extents(layout_line: PPangoLayoutLine; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl; external PANGO_LIB;
function pango_layout_iter_get_type: GType; cdecl; external PANGO_LIB;
function pango_layout_get_iter(layout: PPangoLayout): PPangoLayoutIter; cdecl; external PANGO_LIB;
function pango_layout_iter_copy(iter: PPangoLayoutIter): PPangoLayoutIter; cdecl; external PANGO_LIB;
procedure pango_layout_iter_free(iter: PPangoLayoutIter); cdecl; external PANGO_LIB;
function pango_layout_iter_get_index(iter: PPangoLayoutIter): Integer; cdecl; external PANGO_LIB;
function pango_layout_iter_get_run(iter: PPangoLayoutIter): PPangoLayoutRun; cdecl; external PANGO_LIB;
function pango_layout_iter_get_run_readonly(iter: PPangoLayoutIter): PPangoLayoutRun; cdecl; external PANGO_LIB;
function pango_layout_iter_get_line(iter: PPangoLayoutIter): PPangoLayoutLine; cdecl; external PANGO_LIB;
function pango_layout_iter_get_line_readonly(iter: PPangoLayoutIter): PPangoLayoutLine; cdecl; external PANGO_LIB;
function pango_layout_iter_at_last_line(iter: PPangoLayoutIter): gboolean; cdecl; external PANGO_LIB;
function pango_layout_iter_get_layout(iter: PPangoLayoutIter): PPangoLayout; cdecl; external PANGO_LIB;
function pango_layout_iter_next_char(iter: PPangoLayoutIter): gboolean; cdecl; external PANGO_LIB;
function pango_layout_iter_next_cluster(iter: PPangoLayoutIter): gboolean; cdecl; external PANGO_LIB;
function pango_layout_iter_next_run(iter: PPangoLayoutIter): gboolean; cdecl; external PANGO_LIB;
function pango_layout_iter_next_line(iter: PPangoLayoutIter): gboolean; cdecl; external PANGO_LIB;
procedure pango_layout_iter_get_char_extents(iter: PPangoLayoutIter; logical_rect: PPangoRectangle); cdecl; external PANGO_LIB;
procedure pango_layout_iter_get_cluster_extents(iter: PPangoLayoutIter; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl; external PANGO_LIB;
procedure pango_layout_iter_get_run_extents(iter: PPangoLayoutIter; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl; external PANGO_LIB;
procedure pango_layout_iter_get_line_extents(iter: PPangoLayoutIter; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl; external PANGO_LIB;
procedure pango_layout_iter_get_line_yrange(iter: PPangoLayoutIter; y0_: PInteger; y1_: PInteger); cdecl; external PANGO_LIB;
procedure pango_layout_iter_get_layout_extents(iter: PPangoLayoutIter; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl; external PANGO_LIB;
function pango_layout_iter_get_baseline(iter: PPangoLayoutIter): Integer; cdecl; external PANGO_LIB;

function pango_engine_get_type: GType; cdecl; external PANGO_LIB;
function pango_engine_lang_get_type: GType; cdecl; external PANGO_LIB;
function pango_engine_shape_get_type: GType; cdecl; external PANGO_LIB;
procedure script_engine_list (var engines: PPangoEngineInfo; n_engines: PInteger); cdecl; external PANGO_LIB;
procedure script_engine_init (module: PGTypeModule); cdecl; external PANGO_LIB;
procedure script_engine_exit; cdecl; external PANGO_LIB;
function script_engine_create (const id: PAnsiChar): PPangoEngine; cdecl; external PANGO_LIB;
function pango_renderer_get_type: GType; cdecl; external PANGO_LIB;
procedure pango_renderer_draw_layout (renderer: PPangoRenderer; layout: PPangoLayout; x: Integer; y: Integer); cdecl; external PANGO_LIB;
procedure pango_renderer_draw_layout_line (renderer: PPangoRenderer; line: PPangoLayoutLine; x: Integer; y: Integer); cdecl; external PANGO_LIB;
procedure pango_renderer_draw_glyphs (renderer: PPangoRenderer; font: PPangoFont; glyphs: PPangoGlyphString; x: Integer; y: Integer); cdecl; external PANGO_LIB;
procedure pango_renderer_draw_glyph_item (renderer: PPangoRenderer; const text: PAnsiChar; glyph_item: PPangoGlyphItem; x: Integer; y: Integer); cdecl; external PANGO_LIB;
procedure pango_renderer_draw_rectangle (renderer: PPangoRenderer; part: PangoRenderPart; x: Integer; y: Integer; width: Integer; height: Integer); cdecl; external PANGO_LIB;
procedure pango_renderer_draw_error_underline (renderer: PPangoRenderer; x: Integer; y: Integer; width: Integer; height: Integer); cdecl; external PANGO_LIB;
procedure pango_renderer_draw_trapezoid (renderer: PPangoRenderer; part: PangoRenderPart; y1_: double; x11: double; x21: double; y2: double; x12: double; x22: double); cdecl; external PANGO_LIB;
procedure pango_renderer_draw_glyph (renderer: PPangoRenderer; font: PPangoFont; glyph: PangoGlyph; x: double; y: double); cdecl; external PANGO_LIB;
procedure pango_renderer_activate (renderer: PPangoRenderer); cdecl; external PANGO_LIB;
procedure pango_renderer_deactivate (renderer: PPangoRenderer); cdecl; external PANGO_LIB;
procedure pango_renderer_part_changed (renderer: PPangoRenderer; part: PangoRenderPart); cdecl; external PANGO_LIB;
procedure pango_renderer_set_color (renderer: PPangoRenderer; part: PangoRenderPart; const color: PPangoColor); cdecl; external PANGO_LIB;
function pango_renderer_get_color (renderer: PPangoRenderer; part: PangoRenderPart): PPangoColor; cdecl; external PANGO_LIB;
procedure pango_renderer_set_matrix (renderer: PPangoRenderer; const matrix: PPangoMatrix); cdecl; external PANGO_LIB;
function pango_renderer_get_matrix (renderer: PPangoRenderer): PPangoMatrix; cdecl; external PANGO_LIB;
function pango_renderer_get_layout (renderer: PPangoRenderer): PPangoLayout; cdecl; external PANGO_LIB;
function pango_renderer_get_layout_line (renderer: PPangoRenderer): PPangoLayoutLine; cdecl; external PANGO_LIB;
function pango_split_file_list (const str: PAnsiChar): PPAnsiChar ; cdecl; external PANGO_LIB;
function pango_trim_string (const str: PAnsiChar): PAnsiChar; cdecl; external PANGO_LIB;
function pango_read_line(stream: Pointer; str: PGString): gint; cdecl; external PANGO_LIB;
function pango_skip_space (const pos: PPAnsiChar): gboolean; cdecl; external PANGO_LIB;
function pango_scan_word (const pos: PPAnsiChar; out_: PGString): gboolean; cdecl; external PANGO_LIB;
function pango_scan_string (const pos: PPAnsiChar; out_: PGString): gboolean; cdecl; external PANGO_LIB;
function pango_scan_int (const pos: PPAnsiChar; out_: PInteger): gboolean; cdecl; external PANGO_LIB;
function pango_config_key_get (const key: PAnsiChar): PAnsiChar ; cdecl; external PANGO_LIB;
procedure pango_lookup_aliases (const fontname: PAnsiChar; var families: PPAnsiCharArray; n_families: PInteger); cdecl; external PANGO_LIB;
function pango_parse_enum (type_: GType; const str: PAnsiChar; value: PInteger; warn: gboolean; possible_values: PPAnsiCharArray): gboolean; cdecl; external PANGO_LIB;
function pango_parse_style (const str: PAnsiChar; style: PPangoStyle; warn: gboolean): gboolean; cdecl; external PANGO_LIB;
function pango_parse_variant (const str: PAnsiChar; variant: PPangoVariant; warn: gboolean): gboolean; cdecl; external PANGO_LIB;
function pango_parse_weight (const str: PAnsiChar; weight: PPangoWeight; warn: gboolean): gboolean; cdecl; external PANGO_LIB;
function pango_parse_stretch (const str: PAnsiChar; stretch: PPangoStretch; warn: gboolean): gboolean; cdecl; external PANGO_LIB;
function pango_get_sysconf_subdirectory: PAnsiChar ; cdecl; external PANGO_LIB;
function pango_get_lib_subdirectory: PAnsiChar ; cdecl; external PANGO_LIB;
procedure pango_quantize_line_geometry (thickness: PInteger; position: PInteger); cdecl; external PANGO_LIB;
function pango_log2vis_get_embedding_levels (const text: PAnsiChar; length: Integer; pbase_dir: PPangoDirection): PByte ; cdecl; external PANGO_LIB;
function pango_is_zero_width (ch: gunichar): gboolean; cdecl; external PANGO_LIB;
function pango_version: Integer; cdecl; external PANGO_LIB;
function pango_version_string: PAnsiChar ; cdecl; external PANGO_LIB;
function pango_version_check (required_major: Integer; required_minor: Integer; required_micro: Integer): PAnsiChar; cdecl; external PANGO_LIB;

{ TPangoMatrix }

procedure TPangoMatrix.Concat(newMatrix: PPangoMatrix);
begin
  pango_matrix_concat(@self, newMatrix);
end;

function TPangoMatrix.GetFontScaleFactor: double;
begin
  Result := pango_matrix_get_font_scale_factor(@self);
end;

procedure TPangoMatrix.Init(axx, ayx, axy, ayy, ax0, ay0: Double);
begin
  xx := axx;
  yx := ayx;
  xy := axy;
  yy := ayy;
  x0 := ax0;
  y0 := ay0;
end;

procedure TPangoMatrix.InitIdentity;
begin
  init(1, 0,
		   0, 1,
		   0, 0);
end;

procedure TPangoMatrix.Rotate(degrees: Double);
begin
  pango_matrix_rotate(@self, degrees);
end;

procedure TPangoMatrix.Scale(scaleX, scaleY: Double);
begin
  pango_matrix_scale(@self, scaleX, scaleY);
end;

procedure TPangoMatrix.TransformDistance(dx, dy: PDouble);
begin
  pango_matrix_transform_distance(@self, dx, dy);
end;

procedure TPangoMatrix.TransformPixelRectangle(rect: PPangoRectangle);
begin
  pango_matrix_transform_pixel_rectangle(@self, rect);
end;

procedure TPangoMatrix.TransformPoint(x, y: PDouble);
begin
  pango_matrix_transform_point(@self, x, y);
end;

procedure TPangoMatrix.TransformRectangle(rect: PPangoRectangle);
begin
  pango_matrix_transform_rectangle(@self, rect);
end;

procedure TPangoMatrix.Translate(tx, ty: Double);
begin
  pango_matrix_translate(@self, tx, ty);
end;


{ TPangoColor }

function TPangoColor.Parse(const spec: AnsiString): Boolean;
begin
  Result := pango_color_parse(@self, PAnsiChar(spec));
end;

function TPangoColor.ToString: string;
begin
  Result := string(pango_color_to_string(@self));
end;

end.
