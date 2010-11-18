unit pangocairo;

interface
uses pangolib, cairolib, pangocairolib, cairo, pango, glib;

type

  IPangoCairoFontMap = interface(IPangoFontMap)   // todo ginterface
    ['{99B6172B-64C1-44E4-8030-AC30C08F6F1D}']
    procedure SetDefault;
    function GetFontType: TCairoFontType;
    procedure SetResolution(dpi: double);
    function GetResolution: Double;

    property FontType: TCairoFontType read GetFontType;
    property Resolution: Double read GetResolution write SetResolution;
  end;

  IPangoCairoFont = interface(IPangoFont)
    ['{B174B51D-EBBE-42AA-B6B8-4058931B8924}']
    function GetScaledFont: ICairoScaledFont; cdecl;
    property ScaledFont: ICairoScaledFont read GetScaledFont;
  end;

  TPangoCairoFontMap = class(TPangoFontMap, IPangoCairoFontMap)
  protected
    procedure SetDefault;
    function GetFontType: TCairoFontType;
    procedure SetResolution(dpi: double);
    function GetResolution: Double;
  public
    constructor Create; virtual;
    constructor CreateForFontType(fonttype: TCairoFontType);
    constructor CreateDefault;
  end;

  IPangoCairoContext = interface(ICairoContext)
    ['{C58A313B-244F-4FC9-A713-DD39C11A76C0}']
    procedure PangoUpdateContext(pc: IPangoContext);
    procedure PangoUpdateLayout(layout: IPangoLayout);
    procedure PangoShowErrorUnderline(x, y, width, height: double);
    function PangoCreateContext: IPangoContext;
    function PangoCreateLayout: IPangoLayout;
    procedure PangoShowGlyphString(font: IPangoFont; glyphs: PPangoGlyphString);
    procedure PangoShowGlyphItem(text: PAnsiChar; glyphItem: PPangoGlyphItem);
    procedure PangoShowLayoutLine(line: PPangoLayoutLine);
    procedure PangoShowLayout(layout: IPangoLayout);
    procedure PangoGlyphStringPath(font: IPangoFont; glyphs: PPangoGlyphString);
    procedure PangoLayoutLinePath(line: PPangoLayoutLine);
    procedure PangoLayoutPath(layout: IPangoLayout);
    procedure PangoErrorUnderlinePath(x, y, width, height: double);
  end;

  TPangoCairoFont = class(TPangoFont, IPangoCairoFont)
  protected
    function GetScaledFont: ICairoScaledFont; cdecl;
  end;

  TPangoCairoContext = class(TCairoContext, IPangoCairoContext)
  protected
    procedure PangoUpdateContext(pc: IPangoContext);
    procedure PangoUpdateLayout(layout: IPangoLayout);
    procedure PangoShowErrorUnderline(x, y, width, height: double);
    function PangoCreateContext: IPangoContext;
    function PangoCreateLayout: IPangoLayout;
    procedure PangoShowGlyphString(font: IPangoFont; glyphs: PPangoGlyphString);
    procedure PangoShowGlyphItem(text: PAnsiChar; glyphItem: PPangoGlyphItem);
    procedure PangoShowLayoutLine(line: PPangoLayoutLine);
    procedure PangoShowLayout(layout: IPangoLayout);
    procedure PangoGlyphStringPath(font: IPangoFont; glyphs: PPangoGlyphString);
    procedure PangoLayoutLinePath(line: PPangoLayoutLine);
    procedure PangoLayoutPath(layout: IPangoLayout);
    procedure PangoErrorUnderlinePath(x, y, width, height: double);
  end;


implementation

{ TPangoCairoFontMap }

constructor TPangoCairoFontMap.Create;
begin
  CreateInternal(pango_cairo_font_map_new);
end;

constructor TPangoCairoFontMap.CreateDefault;
begin
  CreateInternal(g_object_ref(pango_cairo_font_map_get_default));
end;

constructor TPangoCairoFontMap.CreateForFontType(fonttype: TCairoFontType);
begin
  CreateInternal(pango_cairo_font_map_new_for_font_type(fonttype));
end;

function TPangoCairoFontMap.GetFontType: TCairoFontType;
begin
  Result := pango_cairo_font_map_get_font_type(GetHandle);
end;

function TPangoCairoFontMap.GetResolution: Double;
begin
  Result := pango_cairo_font_map_get_resolution(GetHandle);
end;

procedure TPangoCairoFontMap.SetDefault;
begin
  pango_cairo_font_map_set_default(GetHandle);
end;

procedure TPangoCairoFontMap.SetResolution(dpi: double);
begin
  pango_cairo_font_map_set_resolution(GetHandle, dpi);
end;

{ TPangoCairoFont }

function TPangoCairoFont.GetScaledFont: ICairoScaledFont;
begin
  Result := TCairoScaledFont.CreateInternal(pango_cairo_font_get_scaled_font(GetHandle));
end;

{ TPangoCairoContext }

function TPangoCairoContext.PangoCreateContext: IPangoContext;
begin
  Result := TPangoContext.CreateInternal(pango_cairo_create_context(Context));
end;

function TPangoCairoContext.PangoCreateLayout: IPangoLayout;
begin
  Result := TPangoLayout.CreateInternal(pango_cairo_create_layout(Context));
end;

procedure TPangoCairoContext.PangoErrorUnderlinePath(x, y, width,
  height: double);
begin
  pango_cairo_error_underline_path(Context, x, y, width, height);
end;

procedure TPangoCairoContext.PangoGlyphStringPath(font: IPangoFont;
  glyphs: PPangoGlyphString);
begin
  pango_cairo_glyph_string_path(Context, GObjectHandle(font), glyphs);
end;

procedure TPangoCairoContext.PangoLayoutLinePath(line: PPangoLayoutLine);
begin
  pango_cairo_layout_line_path(Context, line);
end;

procedure TPangoCairoContext.PangoLayoutPath(layout: IPangoLayout);
begin
  pango_cairo_layout_path(Context, GObjectHandle(layout));
end;

procedure TPangoCairoContext.PangoShowErrorUnderline(x, y, width,
  height: double);
begin
  pango_cairo_show_error_underline(Context, x, y, width, height);
end;

procedure TPangoCairoContext.PangoShowGlyphItem(text: PAnsiChar;
  glyphItem: PPangoGlyphItem);
begin
  pango_cairo_show_glyph_item(Context, text, glyphItem);
end;

procedure TPangoCairoContext.PangoShowGlyphString(font: IPangoFont;
  glyphs: PPangoGlyphString);
begin
  pango_cairo_show_glyph_string(Context, GObjectHandle(font), glyphs);
end;

procedure TPangoCairoContext.PangoShowLayout(layout: IPangoLayout);
begin
  pango_cairo_show_layout(Context, GObjectHandle(layout));
end;

procedure TPangoCairoContext.PangoShowLayoutLine(line: PPangoLayoutLine);
begin
  pango_cairo_show_layout_line(Context, line);
end;

procedure TPangoCairoContext.PangoUpdateLayout(layout: IPangoLayout);
begin
  pango_cairo_update_layout(Context, GObjectHandle(layout));
end;

procedure TPangoCairoContext.PangoUpdateContext(pc: IPangoContext);
begin
  pango_cairo_update_context(Context, GObjectHandle(pc));
end;

end.