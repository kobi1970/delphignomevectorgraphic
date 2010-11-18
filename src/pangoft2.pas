unit pangoft2;

interface
uses glib, freetypelib, fontconfiglib, pangolib, pangoft2lib, pango;

type
  IPangoFcFontMap = interface;
    IPangoFT2FontMap = interface;
  IPangoFcFont = interface;
  IPangoFcDecoder = interface;
  IPangoOTInfo = interface;
  IPangoOTRuleset = interface;

  IPangoOTBuffer = interface;


  IPangoFcFontMap = interface(IPangoFontMap)
    ['{0D7214F7-61C5-4F90-9B2C-23B2057D0DE8}']
    procedure Shutdown;
    procedure CacheClear;
    procedure AddDecoderFindFunc(findfunc: PangoFcDecoderFindFunc; userData: Pointer; dnotify: GDestroyNotify);
  end;

  IPangoFT2FontMap = interface(IPangoFcFontMap)
    ['{EAFA8AC0-5463-4176-B1B1-EAF01497DC44}']
    procedure SetResolution(dpiX, dpiY: double);
    procedure SetDefaultSubstitute(func: PangoFT2SubstituteFunc; data: Pointer; notify: GDestroyNotify);
    procedure SubstituteChanged;
  end;

  IPangoFcFont = interface(IPangoFont)
    ['{A2DEF8A8-3506-421A-A73D-36015AD9F9F5}']
    function HasChar(wc: WideChar): Boolean;
    function GetGlyph(wc: WideChar): Cardinal;
    function GetUnknownGlyph(wc: WideChar): PangoGlyph;
    procedure KernGlyphs(glyphs: IPangoGlyphString);
    function LockFace: FT_Face;
    procedure UnlockFace;
    function NewOtBuffer: IPangoOTBuffer;
  end;

  IPangoFcDecoder = interface(IGObject)
    ['{F00DBC04-7251-4A9F-8A98-041A3E95AFB5}']
    function GetCharset(fcfont: IPangoFcFont): PFcCharSet;
    function GetGlyph(fcfont: IPangoFcFont; wc: Cardinal): PangoGlyph;
  end;

  IPangoOTInfo = interface(IGObject)
    ['{63056577-1FBC-4BF5-9E90-E8818749DBD3}']
    function FindScript(tableType: PangoOTTableType; scriptTag: PangoOTTag; scriptIndex: PCardinal): Boolean;
    function FindLanguage(tableType: PangoOTTableType; scriptIndex: Cardinal; languageTag: PangoOTTag; languageIndex, requiredFeatureIndex: PCardinal): Boolean;
    function FindFeature(tableType: PangoOTTableType; featureTag: PangoOTTag; scriptIndex, languageIndex: Cardinal; featureIndex: PCardinal): Boolean;
    function ListScripts(tableType: PangoOTTableType): PPangoOTTag;
    function ListLanguages(tableType: PangoOTTableType; scriptIndex: Cardinal; languageTag: PangoOTTag): PPangoOTTag;
    function ListFeatures(tableType: PangoOTTableType; tag: PangoOTTag; scriptIndex, languageIndex: Cardinal): PPangoOTTag;
    function GetRulesetForDescription(desc: PPangoOTRulesetDescription): IPangoOTRuleset;
    function NewRuleset: IPangoOTRuleset;
    function NewRulesetFor(script: PangoScript; language: PPangoLanguage): IPangoOTRuleset;
    function NewRulesetFromDescription(desc: PPangoOTRulesetDescription): IPangoOTRuleset;
  end;

  IPangoOTRuleset = interface(IGObject)
    ['{27E3FBC4-2477-4E6F-9915-ACE74BE81778}']
    procedure AddFeature(tableType: PangoOTTableType; featureIndex, propertyBit: Cardinal);
    function MaybeAddFeature(tableType: PangoOTTableType; featureTag: PangoOTTag; propertyBit: Cardinal): Boolean;
    function MaybeAddFeatures(tableType: PangoOTTableType; features: PPangoOTFeatureMap; nFeatures: Cardinal): Cardinal;
    function GetFeatureCount(nGsubFeatures, nGposFeatures: PCardinal): Cardinal;
    procedure Substitute(buffer: IPangoOTBuffer);
    procedure Position(buffer: IPangoOTBuffer);
  end;

  IPangoOTBuffer = interface
    ['{A5C7FA0C-736A-41FB-9B07-8AC4D704A300}']
    function GetHandle: PPangoOTBuffer;
    procedure Clear;
    procedure SetRtl(rtl: Boolean);
    procedure AddGlyph(glyph, properties, cluster: Cardinal);
    procedure GetGlyphs(var glyphs: PPangoOTGlyph; var nGlyphs: Integer);
    procedure Output(glyphs: IPangoGlyphString);
    procedure SetZeroWidthMarks(zeroWidthMarks: Boolean);
    property Handle: PPangoOTBuffer read GetHandle;
  end;

  TPangoFcFontMap = class(TPangoFontMap, IPangoFcFontMap)
  protected
    procedure Shutdown;
    procedure CacheClear;
    procedure AddDecoderFindFunc(findfunc: PangoFcDecoderFindFunc; userData: Pointer; dnotify: GDestroyNotify);
  end;

  TPangoFT2FontMap = class(TPangoFcFontMap, IPangoFT2FontMap)
  protected
    procedure SetResolution(dpiX, dpiY: double);
    procedure SetDefaultSubstitute(func: PangoFT2SubstituteFunc; data: Pointer; notify: GDestroyNotify);
    procedure SubstituteChanged;
  public
    constructor Create; virtual;
  end;

  TPangoFcFont = class(TPangoFont, IPangoFcFont)
  protected
    function HasChar(wc: WideChar): Boolean;
    function GetGlyph(wc: WideChar): Cardinal;
    function GetUnknownGlyph(wc: WideChar): PangoGlyph;
    procedure KernGlyphs(glyphs: IPangoGlyphString);
    function LockFace: FT_Face;
    procedure UnlockFace;
    function NewOtBuffer: IPangoOTBuffer;
  end;

  TPangoFcDecoder = class(TGObject, IPangoFcDecoder)
  protected
    function GetCharset(fcfont: IPangoFcFont): PFcCharSet;
    function GetGlyph(fcfont: IPangoFcFont; wc: Cardinal): PangoGlyph;
  end;

  TPangoOTInfo = class(TGObject, IPangoOTInfo)
  protected
    function FindScript(tableType: PangoOTTableType; scriptTag: PangoOTTag; scriptIndex: PCardinal): Boolean;
    function FindLanguage(tableType: PangoOTTableType; scriptIndex: Cardinal; languageTag: PangoOTTag; languageIndex, requiredFeatureIndex: PCardinal): Boolean;
    function FindFeature(tableType: PangoOTTableType; featureTag: PangoOTTag; scriptIndex, languageIndex: Cardinal; featureIndex: PCardinal): Boolean;
    function ListScripts(tableType: PangoOTTableType): PPangoOTTag;
    function ListLanguages(tableType: PangoOTTableType; scriptIndex: Cardinal; languageTag: PangoOTTag): PPangoOTTag;
    function ListFeatures(tableType: PangoOTTableType; tag: PangoOTTag; scriptIndex, languageIndex: Cardinal): PPangoOTTag;
    function GetRulesetForDescription(desc: PPangoOTRulesetDescription): IPangoOTRuleset;
    function NewRuleset: IPangoOTRuleset;
    function NewRulesetFor(script: PangoScript; language: PPangoLanguage): IPangoOTRuleset;
    function NewRulesetFromDescription(desc: PPangoOTRulesetDescription): IPangoOTRuleset;
  public
    constructor Create(face: FT_Face); virtual;
  end;

  TPangoOTBuffer = class(TInterfacedObject, IPangoOTBuffer)
  private
    FPangoOTBuffer: PPangoOTBuffer;
    constructor CreateInternal(Handle: PPangoOTBuffer);
  protected
    function GetHandle: PPangoOTBuffer;
    procedure Clear;
    procedure SetRtl(rtl: Boolean);
    procedure AddGlyph(glyph, properties, cluster: Cardinal);
    procedure GetGlyphs(var glyphs: PPangoOTGlyph; var nGlyphs: Integer);
    procedure Output(glyphs: IPangoGlyphString);
    procedure SetZeroWidthMarks(zeroWidthMarks: Boolean);
  public
    destructor Destroy; override;
  end;

  TPangoOTRuleset = class(TGObject, IPangoOTRuleset)
  protected
    procedure AddFeature(tableType: PangoOTTableType; featureIndex, propertyBit: Cardinal);
    function MaybeAddFeature(tableType: PangoOTTableType; featureTag: PangoOTTag; propertyBit: Cardinal): Boolean;
    function MaybeAddFeatures(tableType: PangoOTTableType; features: PPangoOTFeatureMap; nFeatures: Cardinal): Cardinal;
    function GetFeatureCount(nGsubFeatures, nGposFeatures: PCardinal): Cardinal;
    procedure Substitute(buffer: IPangoOTBuffer);
    procedure Position(buffer: IPangoOTBuffer);
  end;


implementation

function PangoGlyphStringHandle(const I: IPangoGlyphString): PPangoGlyphString; inline;
begin
  if I <> nil then Result := I.Handle else Result := nil;
end;

function PangoOTBufferHandle(const I: IPangoOTBuffer): PPangoOTBuffer; inline;
begin
  if I <> nil then Result := I.Handle else Result := nil;
end;

{ TPangoFcFont }

function TPangoFcFont.GetGlyph(wc: WideChar): Cardinal;
begin
  Result := pango_fc_font_get_glyph(GetHandle, wc);
end;

function TPangoFcFont.GetUnknownGlyph(wc: WideChar): PangoGlyph;
begin
  Result := pango_fc_font_get_unknown_glyph(GetHandle, wc);
end;

function TPangoFcFont.HasChar(wc: WideChar): Boolean;
begin
  Result := pango_fc_font_has_char(GetHandle, wc);
end;

procedure TPangoFcFont.KernGlyphs(glyphs: IPangoGlyphString);
begin
  pango_fc_font_kern_glyphs(GetHandle, PangoGlyphStringHandle(glyphs));
end;

function TPangoFcFont.LockFace: FT_Face;
begin
  Result := pango_fc_font_lock_face(GetHandle);
end;

function TPangoFcFont.NewOtBuffer: IPangoOTBuffer;
begin
  Result := TPangoOTBuffer.CreateInternal(pango_ot_buffer_new(GetHandle));
end;

procedure TPangoFcFont.UnlockFace;
begin
  pango_fc_font_unlock_face(GetHandle);
end;

{ TPangoFcDecoder }

function TPangoFcDecoder.GetCharset(fcfont: IPangoFcFont): PFcCharSet;
begin
  Result := pango_fc_decoder_get_charset(GetHandle, GObjectHandle(fcfont))
end;

function TPangoFcDecoder.GetGlyph(fcfont: IPangoFcFont;
  wc: Cardinal): PangoGlyph;
begin
  Result := pango_fc_decoder_get_glyph(GetHandle, GObjectHandle(fcfont), wc);
end;

{ TPangoFcFontMap }

procedure TPangoFcFontMap.AddDecoderFindFunc(findfunc: PangoFcDecoderFindFunc;
  userData: Pointer; dnotify: GDestroyNotify);
begin
  pango_fc_font_map_add_decoder_find_func(GetHandle, findfunc, userData, dnotify);
end;

procedure TPangoFcFontMap.CacheClear;
begin
  pango_fc_font_map_cache_clear(GetHandle);
end;

procedure TPangoFcFontMap.Shutdown;
begin
  pango_fc_font_map_shutdown(GetHandle);
end;

{ TPangoFT2FontMap }

constructor TPangoFT2FontMap.Create;
begin
  CreateInternal(pango_ft2_font_map_new);
end;

procedure TPangoFT2FontMap.SetDefaultSubstitute(func: PangoFT2SubstituteFunc;
  data: Pointer; notify: GDestroyNotify);
begin
  pango_ft2_font_map_set_default_substitute(GetHandle, func, data, notify);
end;

procedure TPangoFT2FontMap.SetResolution(dpiX, dpiY: double);
begin
  pango_ft2_font_map_set_resolution(GetHandle, dpiX, dpiY);
end;

procedure TPangoFT2FontMap.SubstituteChanged;
begin
  pango_ft2_font_map_substitute_changed(GetHandle);
end;

{ TPangoOTInfo }

constructor TPangoOTInfo.Create(face: FT_Face);
begin
  CreateInternal(g_object_ref(pango_ot_info_get(face)));
end;

function TPangoOTInfo.FindFeature(tableType: PangoOTTableType;
  featureTag: PangoOTTag; scriptIndex, languageIndex: Cardinal;
  featureIndex: PCardinal): Boolean;
begin
  Result := pango_ot_info_find_feature(GetHandle, tableType, featureTag, scriptIndex, languageIndex, featureIndex);
end;

function TPangoOTInfo.FindLanguage(tableType: PangoOTTableType;
  scriptIndex: Cardinal; languageTag: PangoOTTag; languageIndex,
  requiredFeatureIndex: PCardinal): Boolean;
begin
  Result := pango_ot_info_find_language(GetHandle, tableType, scriptIndex, languageTag, languageIndex, requiredFeatureIndex);
end;

function TPangoOTInfo.FindScript(tableType: PangoOTTableType;
  scriptTag: PangoOTTag; scriptIndex: PCardinal): Boolean;
begin
  Result := pango_ot_info_find_script(GetHandle, tableType, scriptTag, scriptIndex);
end;

function TPangoOTInfo.GetRulesetForDescription(
  desc: PPangoOTRulesetDescription): IPangoOTRuleset;
begin
 Result := TPangoOTRuleset.CreateInternal(g_object_ref(pango_ot_ruleset_get_for_description(GetHandle, desc)));
end;

function TPangoOTInfo.ListFeatures(tableType: PangoOTTableType; tag: PangoOTTag;
  scriptIndex, languageIndex: Cardinal): PPangoOTTag;
begin
  Result := pango_ot_info_list_features(GetHandle, tableType, tag, scriptIndex, languageIndex);
end;

function TPangoOTInfo.ListLanguages(tableType: PangoOTTableType;
  scriptIndex: Cardinal; languageTag: PangoOTTag): PPangoOTTag;
begin
  Result := pango_ot_info_list_languages(GetHandle, tableType, scriptIndex, languageTag);
end;

function TPangoOTInfo.ListScripts(tableType: PangoOTTableType): PPangoOTTag;
begin
  Result := pango_ot_info_list_scripts(GetHandle, tableType);
end;

function TPangoOTInfo.NewRuleset: IPangoOTRuleset;
begin
  Result := TPangoOTRuleset.CreateInternal(pango_ot_ruleset_new(GetHandle));
end;

function TPangoOTInfo.NewRulesetFor(script: PangoScript;
  language: PPangoLanguage): IPangoOTRuleset;
begin
  Result := TPangoOTRuleset.CreateInternal(pango_ot_ruleset_new_for(GetHandle, script, language));
end;

function TPangoOTInfo.NewRulesetFromDescription(
  desc: PPangoOTRulesetDescription): IPangoOTRuleset;
begin
  Result := TPangoOTRuleset.CreateInternal(pango_ot_ruleset_new_from_description(GetHandle, desc));
end;

{ TPangoOTBuffer }

procedure TPangoOTBuffer.AddGlyph(glyph, properties, cluster: Cardinal);
begin
  pango_ot_buffer_add_glyph(FPangoOTBuffer, glyph, properties, cluster);
end;

procedure TPangoOTBuffer.Clear;
begin
  pango_ot_buffer_clear(FPangoOTBuffer);
end;

constructor TPangoOTBuffer.CreateInternal(Handle: PPangoOTBuffer);
begin
  Assert(Handle <> nil);
  FPangoOTBuffer := Handle;
end;

destructor TPangoOTBuffer.Destroy;
begin
  pango_ot_buffer_destroy(FPangoOTBuffer);
  inherited;
end;

procedure TPangoOTBuffer.GetGlyphs(var glyphs: PPangoOTGlyph;
  var nGlyphs: Integer);
begin
  pango_ot_buffer_get_glyphs(FPangoOTBuffer, glyphs, nGlyphs);
end;

function TPangoOTBuffer.GetHandle: PPangoOTBuffer;
begin
  Result := FPangoOTBuffer;
end;

procedure TPangoOTBuffer.Output(glyphs: IPangoGlyphString);
begin
  pango_ot_buffer_output(FPangoOTBuffer, PangoGlyphStringHandle(glyphs));
end;

procedure TPangoOTBuffer.SetRtl(rtl: Boolean);
begin
  pango_ot_buffer_set_rtl(FPangoOTBuffer, rtl);
end;

procedure TPangoOTBuffer.SetZeroWidthMarks(zeroWidthMarks: Boolean);
begin
  pango_ot_buffer_set_zero_width_marks(FPangoOTBuffer, zeroWidthMarks);
end;

{ TPangoOTRuleset }

procedure TPangoOTRuleset.AddFeature(tableType: PangoOTTableType; featureIndex,
  propertyBit: Cardinal);
begin
  pango_ot_ruleset_add_feature(GetHandle, tableType, featureIndex, propertyBit);
end;

function TPangoOTRuleset.GetFeatureCount(nGsubFeatures,
  nGposFeatures: PCardinal): Cardinal;
begin
  Result := pango_ot_ruleset_get_feature_count(GetHandle, nGsubFeatures, nGposFeatures);
end;

function TPangoOTRuleset.MaybeAddFeature(tableType: PangoOTTableType;
  featureTag: PangoOTTag; propertyBit: Cardinal): Boolean;
begin
  Result := pango_ot_ruleset_maybe_add_feature(GetHandle, tableType, featureTag, propertyBit);
end;

function TPangoOTRuleset.MaybeAddFeatures(tableType: PangoOTTableType;
  features: PPangoOTFeatureMap; nFeatures: Cardinal): Cardinal;
begin
  Result := pango_ot_ruleset_maybe_add_features(GetHandle, tableType, features, nFeatures);
end;

procedure TPangoOTRuleset.Position(buffer: IPangoOTBuffer);
begin
  pango_ot_ruleset_position(GetHandle, PangoOTBufferHandle(buffer));
end;

procedure TPangoOTRuleset.Substitute(buffer: IPangoOTBuffer);
begin
  pango_ot_ruleset_substitute(GetHandle, PangoOTBufferHandle(buffer));
end;

end.