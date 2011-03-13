unit pango;

interface
uses pangolib, glib, Classes;

type
{$IFNDEF UNICODE}
  RawByteString = AnsiString;
{$ENDIF}

  // gobject
  IPangoFontMap = interface;
  IPangoFont = interface;
  IPangoContext = interface;
  IPangoEngine = interface;
    IPangoEngineLang = interface;
    IPangoEngineShape = interface;
  IPangoFontFace = interface;
  IPangoFontFamily = interface;
  IPangoFontset = interface;
    IPangoFontsetSimple = interface;
  IPangoLayout = interface;
  IPangoRenderer = interface;

  // pango specific
  IPangoFontDescription = interface;
  IPangoScriptIter = interface;
  IPangoCoverage = interface;
  IPangoFontMetrics = interface;
  IPangoAttrList = interface;
  IPangoAttribute = interface;
  IPangoAttrIterator = interface;
  IPangoItem = interface;
  IPangoGlyphString = interface;
  IPangoTabArray = interface;
  IPangoGlyphItem = interface;
  IPangoLayoutLine = interface;
  IPangoLayoutIter = interface;
  IPangoLayoutRun = IPangoGlyphItem;

  IPangoFontMap = interface(IGObject)
    ['{12DD33E1-02F8-462C-A181-949639C44926}']
    function CreateContext: IPangoContext;
    function LoadFont(context: IPangoContext; desc: IPangoFontDescription): IPangoFont;
    function LoadFontset(context: IPangoContext; desc: IPangoFontDescription; language: PPangoLanguage): IPangoFontset;
    function ListFamilies: IInterfaceList;
    function GetShapeEngineType: PAnsiChar;
    property Families: IInterfaceList read ListFamilies;
  end;

  IPangoFont = interface(IGObject)
    ['{4F9B7D3F-A12A-4DC6-8639-F1665C4C332C}']
    function Describe: IPangoFontDescription;
    function DescribeWithAbsoluteSize: IPangoFontDescription;
    function GetCoverage(language: PPangoLanguage): IPangoCoverage;
    function FindShaper(language: PPangoLanguage; ch: Cardinal): IPangoEngineShape;
    function GetMetrics(language: PPangoLanguage): IPangoFontMetrics;
    procedure GetGlyphExtents(glyph: PangoGlyph; inkRect, logicalRect: PPangoRectangle);
    function GetFontMap: IPangoFontMap;

    property FontMap: IPangoFontMap read GetFontMap;
  end;

  IPangoContext = interface(IGObject)
    ['{C5A629D1-2BBE-462D-B93D-987BF2A2F377}']
    procedure SetFontMap(fontMap: IPangoFontMap);
    function GetFontMap: IPangoFontMap;
    function ListFamilies: IInterfaceList;
    function LoadFont(desc: IPangoFontDescription): IPangoFont;
    function LoadFontset(desc: IPangoFontDescription; language: PPangoLanguage): IPangoFontset;
    function GetMetrics(desc: IPangoFontDescription; language: PPangoLanguage): IPangoFontMetrics;
    procedure SetFontDescription(desc: IPangoFontDescription);
    function GetFontDescription: IPangoFontDescription;
    function GetLanguage: PPangoLanguage;
    procedure SetLanguage(language: PPangoLanguage);
    procedure SetBaseDir(direction: PangoDirection);
    function GetBaseDir: PangoDirection;
    procedure SetBaseGravity(gravity: PangoGravity);
    function GetBaseGravity: PangoGravity;
    function GetGravity: PangoGravity;
    procedure SetGravityHint(hint: PangoGravityHint);
    function GetGravityHint: PangoGravityHint;
    procedure SetMatrix(matrix: PPangoMatrix);
    function GetMatrix: PPangoMatrix;
    function NewLayout: IPangoLayout;
    function Itemize(text: PAnsiChar; startIndex, length: Integer; attrs: IPangoAttrList; cachedIter: IPangoAttrIterator): IInterfaceList;
    function ItemizeWithBaseDir(baseDir: PangoDirection; text: PAnsiChar; startIndex, length: Integer; attrs: IPangoAttrList; cachedIter: IPangoAttrIterator): IInterfaceList;

    property Families: IInterfaceList read ListFamilies;
    property FontMap: IPangoFontMap read GetFontMap write SetFontMap;
    property Language: PPangoLanguage read GetLanguage write SetLanguage;
    property BaseDir: PangoDirection read GetBaseDir write SetBaseDir;
    property BaseGravity: PangoGravity read GetBaseGravity write SetBaseGravity;
    property Gravity: PangoGravity read GetGravity;
    property GravityHint: PangoGravityHint read GetGravityHint write SetGravityHint;
    property Matrix: PPangoMatrix read GetMatrix write SetMatrix;
    property FontDescription: IPangoFontDescription read GetFontDescription write SetFontDescription;
  end;

  IPangoEngine = interface(IGObject)
    ['{F129503E-6F40-404A-A65E-350B25A5B7CE}']
  end;

  IPangoEngineLang = interface(IPangoEngine)
    ['{9090B605-6FF8-4189-9AC6-F654527646B4}']
  end;

  IPangoEngineShape = interface(IPangoEngine)
    ['{D2543656-4E5A-449E-8387-351466960788}']
  end;

  IPangoFontFace = interface(IGObject)
    ['{7429BC92-5027-48F0-8B01-DEA96E071B15}']
    function Describe: IPangoFontDescription;
    function GetFaceName: PAnsiChar;
    function GetSizes: Integer;
    function GetSize(index: Integer): Integer;
    function IsSynthesized: Boolean;

    property FaceName: PAnsiChar read GetFaceName;
    property Sizes: Integer read GetSizes;
    property Size[index: Integer]: Integer read GetSize;
  end;

  IPangoFontFamily = interface(IGObject)
    ['{A83F25A6-AD4D-456D-9CCA-962F2EBD3409}']
    function ListFaces: IInterfaceList;
    function GetName: PAnsiChar;
    function IsMonospace: Boolean;
    property Name: PAnsiChar read GetName;
    property Faces: IInterfaceList read ListFaces;
  end;

  IPangoFontset = interface(IGObject)
    ['{B9B64F45-EE0B-4022-BC43-5DC140B689CE}']
    function GetFont(wc: Cardinal): IPangoFont;
    function GetMetrics: IPangoFontMetrics;
    procedure ForEach(func: PangoFontsetForeachFunc; data: Pointer);
  end;

  IPangoFontsetSimple = interface(IPangoFontset)
    ['{6DF9C131-380B-46F7-BFB5-E2D292D25718}']
    procedure Append(font: IPangoFont);
    function Size: Integer;
  end;

  IPangoLayout = interface(IGObject)
    ['{964B341C-652B-497B-AF42-125FD65F6489}']
    function Copy: IPangoLayout;
    function GetContext: IPangoContext;
    procedure SetAttributes(attrs: IPangoAttrList);
    function GetAttributes: IPangoAttrList;
    procedure SetText(const text: string);
    function GetText: string;
    procedure SetMarkup(markup: PAnsiChar; length: Integer);
    procedure SetMarkupWithAccel(markup: PAnsiChar; length: Integer; accelMarker: WideChar; accelChar: PWideChar);
    procedure SetFontDescription(desc: IPangoFontDescription);
    function GetFontDescription: IPangoFontDescription;
    procedure SetWidth(width: Integer);
    function GetWidth: Integer;
    procedure SetHeight(height: Integer);
    function GetHeight: Integer;
    procedure SetWrap(wrap: PangoWrapMode);
    function GetWrap: PangoWrapMode;
    function IsWrapped: Boolean;
    procedure SetIndent(indent: Integer);
    function GetIndent: Integer;
    procedure SetSpacing(spacing: Integer);
    function GetSpacing: Integer;
    procedure SetJustify(justify: Boolean);
    function GetJustify: Boolean;
    procedure SetAutoDir(autoDir: Boolean);
    function GetAutoDir: Boolean;
    procedure SetAlignment(alignment: PangoAlignment);
    function GetAlignment: PangoAlignment;
    procedure SetTabs(tabs: IPangoTabArray);
    function GetTabs: IPangoTabArray;
    procedure SetSingleParagraphMode(setting: Boolean);
    function GetSingleParagraphMode: Boolean;
    procedure SetEllipsize(ellipsize: PangoEllipsizeMode);
    function GetEllipsize: PangoEllipsizeMode;
    function IsEllipsized: Boolean;
    function GetUnknownGlyphsCount: Integer;
    procedure ContextChanged;
    procedure GetLogAttrs(var attrs: PPangoLogAttr; var nAttrs: Integer);
    procedure IndexToPos(index: Integer; pos: PPangoRectangle);
    procedure IndexToLineX(index: Integer; trailing: Boolean; line: PInteger; xPos: PInteger);
    procedure GetCursorPos(index: Integer; strongPos: PPangoRectangle; weakPos: PPangoRectangle);
    procedure MoveCursorVisually(strong: Boolean; oldIndex: Integer; oldTrailing: Integer; direction: Integer; newIndex: PInteger; newTrailing: PInteger);
    function XyToIndex(x: Integer; y: Integer; index: PInteger; trailing: PInteger): Boolean;
    procedure GetExtents(inkRect: PPangoRectangle; logicalRect: PPangoRectangle);
    procedure GetPixelExtents(inkRect: PPangoRectangle; logicalRect: PPangoRectangle);
    procedure GetSize(var width, height: Integer);
    procedure GetPixelSize(width: PInteger; height: PInteger);
    function GetBaseline: Integer;
    function GetLineCount: Integer;
    function GetLine(line: Integer): IPangoLayoutLine;
    function GetLineReadonly(line: Integer): IPangoLayoutLine;
    function GetLines: PGSList;
    function GetLinesReadonly: PGSList;

    property Text: string read GetText write SetText;
    property Context: IPangoContext read GetContext;
    property Attributes: IPangoAttrList read GetAttributes write SetAttributes;
    property FontDescription: IPangoFontDescription read GetFontDescription write SetFontDescription;
    property Width: Integer read GetWidth write SetWidth;
    property Height: Integer read GetHeight write SetHeight;
    property Wrap: PangoWrapMode read GetWrap write SetWrap;
    property Indent: Integer read GetIndent write SetIndent;
    property Spacing: Integer read GetSpacing write SetSpacing;
    property Justify: Boolean read GetJustify write SetJustify;
    property AutoDir: Boolean read GetAutoDir write SetAutoDir;
    property Alignment: PangoAlignment read GetAlignment write SetAlignment;
    property Tabs: IPangoTabArray read GetTabs write SetTabs;
    property SingleParagraphMode: Boolean read GetSingleParagraphMode write SetSingleParagraphMode;
    property Ellipsize: PangoEllipsizeMode read GetEllipsize write SetEllipsize;
    property UnknownGlyphsCount: Integer read GetUnknownGlyphsCount;
    property Baseline: Integer read GetBaseline;
    property LineCount: Integer read GetLineCount;
    property Line[line: Integer]: IPangoLayoutLine read GetLine;
    property LineReadonly[line: Integer]: IPangoLayoutLine read GetLineReadonly;
    property Lines: PGSList read GetLines;
    property LinesReadonly: PGSList read GetLinesReadonly;
  end;

  IPangoRenderer = interface(IGObject)
    ['{93C11332-8AA4-4121-B2DE-26DE52872F9C}']
    procedure DrawLayout(layout: IPangoLayout; x: Integer; y: Integer);
    procedure DrawLayoutLine(line: IPangoLayoutLine; x, y: Integer);
    procedure DrawGlyphs(font: IPangoFont; glyphs: IPangoGlyphString; x, y: Integer);
    procedure DrawGlyphItem(text: PAnsiChar; glyphItem: IPangoGlyphItem; x, y: Integer);
    procedure DrawRectangle(part: PangoRenderPart; x, y, width, height: Integer);
    procedure DrawErrorUnderline(x, y, width, height: Integer);
    procedure DrawTrapezoid(part: PangoRenderPart; y1, x11, x21, y2, x12, x22: double);
    procedure DrawGlyph(font: IPangoFont; glyph: PangoGlyph; x, y: double);
    procedure Activate;
    procedure Deactivate;
    procedure PartChanged(part: PangoRenderPart);
    procedure SetColor(part: PangoRenderPart; color: PPangoColor);
    function GetColor(part: PangoRenderPart): PPangoColor;
    procedure SetMatrix(matrix: PPangoMatrix);
    function GetMatrix: PPangoMatrix;
    function GetLayout: IPangoLayout;
    function GetLayoutLine: IPangoLayoutLine;
  end;

  IPangoXftRenderer = interface(IPangoRenderer)
    ['{8F6E79A3-9D9F-4DB5-B197-F0B0EA3660AF}']
  end;

  IPangoFontDescription = interface
  ['{8037017A-792A-4874-A65B-81145D7FC01B}']
    function GetHandle: PPangoFontDescription;
    function Copy: IPangoFontDescription;
    function CopyStatic: IPangoFontDescription;
    function Hash: Cardinal;
    function Equal(desc: IPangoFontDescription): Boolean;
    procedure SetFamily(family: PAnsiChar);
    function GetFamily: PAnsiChar;
    procedure SetFamilyStatic(const family: string);
    procedure SetStyle(style: PangoStyle);
    function GetStyle: PangoStyle;
    procedure SetVariant(variant: PangoVariant);
    function GetVariant: PangoVariant;
    procedure SetWeight(weight: PangoWeight);
    function GetWeight: PangoWeight;
    procedure SetStretch(stretch: PangoStretch);
    function GetStretch: PangoStretch;
    procedure SetSize(size: Integer);
    function GetSize: Integer;
    procedure SetAbsoluteSize(size: Double);
    function GetSizeIsAbsolute: Boolean;
    procedure SetGravity(gravity: PangoGravity);
    function GetGravity: PangoGravity;
    function GetSetFields: PangoFontMask;
    procedure UnsetFields(toUnset: PangoFontMask);
    procedure Merge(descToMerge: IPangoFontDescription; replaceExisting: Boolean);
    procedure MergeStatic(descToMerge: IPangoFontDescription; replaceExisting: Boolean);
    function BetterMatch(oldMatch, newMatch: IPangoFontDescription): Boolean;
    function ToString: string;
    function ToFilename: string;

    property Handle: PPangoFontDescription read GetHandle;
    property Family: PAnsiChar read GetFamily write SetFamily;
    property Style: PangoStyle read GetStyle write SetStyle;
    property Variant: PangoVariant read GetVariant write SetVariant;
    property Weight: PangoWeight read GetWeight write SetWeight;
    property Stretch: PangoStretch read GetStretch write SetStretch;
    property Size: Integer read GetSize write SetSize;
    property SizeIsAbsolute: Boolean read GetSizeIsAbsolute;
    property Gravity: PangoGravity read GetGravity write SetGravity;

  end;

  IPangoScriptIter = interface
    ['{0CDA0908-4D0E-4BD7-8113-5BFCCD447B62}']
    function Text: string;
    function Script: PangoScript;
    function Next: Boolean;
  end;

  IPangoCoverage = interface
    ['{23D6EC0C-F771-4EF7-8E7E-325C78318BC6}']
    function GetHandle: PPangoCoverage;
    function Copy: IPangoCoverage;
    function GetLevel(index: Integer): PangoCoverageLevel;
    procedure SetLevel(index: Integer; level: PangoCoverageLevel);
    procedure Max(other: IPangoCoverage);
    function ToBytes: RawByteString;
    property Level[index: Integer]: PangoCoverageLevel read GetLevel write SetLevel;
    property Handle: PPangoCoverage read GetHandle;
  end;

  IPangoFontMetrics = interface
    ['{4148A6E1-9A45-42FD-8F0D-E8C2FDBEB6DE}']
    function GetAscent: Integer;
    function GetDescent: Integer;
    function GetApproximateCharWidth: Integer;
    function GetApproximateDigitWidth: Integer;
    function GetUnderlinePosition: Integer;
    function GetUnderlineThickness: Integer;
    function GetStrikethroughPosition: Integer;
    function GetStrikethroughThickness: Integer;

    property Ascent: Integer read GetAscent;
    property Descent: Integer read GetDescent;
    property ApproximateCharWidth: Integer read GetApproximateCharWidth;
    property ApproximateDigitWidth: Integer read GetApproximateDigitWidth;
    property UnderlinePosition: Integer read GetUnderlinePosition;
    property UnderlineThickness: Integer read GetUnderlineThickness;
    property StrikethroughPosition: Integer read GetStrikethroughPosition;
    property StrikethroughThickness: Integer read GetStrikethroughThickness;
  end;

  IPangoAttrList = interface
    ['{733BEAC3-B190-4B58-8262-C70CC4910156}']
    function GetHandle: PPangoAttrList;
    function Copy: IPangoAttrList;
    procedure Insert(attr: IPangoAttribute);
    procedure InsertBefore(attr: IPangoAttribute);
    procedure Change(attr: IPangoAttribute);
    procedure Splice(other: IPangoAttrList; pos: Integer; len: Integer);
    function Filter(func: PangoAttrFilterFunc; data: Pointer): IPangoAttrList;
    function GetIterator: IPangoAttrIterator;
    property Handle: PPangoAttrList read GetHandle;
  end;

  IPangoAttribute = interface
    ['{F7D33B8E-0558-4CAF-A587-7C73848F6F28}']
    function GetHandle: PPangoAttribute;
    procedure ListInsert(list: IPangoAttrList);
    procedure ListInsertBefore(list: IPangoAttrList);
    procedure ListChange(list: IPangoAttrList);

    function Copy: IPangoAttribute;
    function Equal(attr: IPangoAttribute): Boolean;
    property Handle: PPangoAttribute read GetHandle;
  end;

  IPangoAttrIterator = interface
    ['{E5F5C46B-A2EE-47DF-8903-A4281A0E8E1E}']
    function GetHandle: PPangoAttrIterator;
    procedure Range(start: PInteger; end_: PInteger);
    function Next: Boolean;
    function Copy: IPangoAttrIterator;
    function Get(type_: PangoAttrType): IPangoAttribute ;
    procedure GetFont(desc: IPangoFontDescription; language: PPPangoLanguage; extraAttrs: PPGSList);
    function GetAttrs: IInterfaceList;
    property Handle: PPangoAttrIterator read GetHandle;
  end;

  IPangoItem = interface
    ['{BE70E8A7-CDCA-4CA7-9B0A-0760DD3CC3F0}']
    function Copy: IPangoItem;
    function Split(splitIndex, splitOffset: Integer): IPangoItem;
  end;

  IPangoGlyphString = interface
    ['{F777EFCA-B7A8-4D82-BF90-EE81402E3619}']
    function GetHandle: PPangoGlyphString;
    procedure SetSize(newLen: Integer);
    function Copy: IPangoGlyphString;
    procedure Extents(font: IPangoFont; inkRect, logicalRect: PPangoRectangle);
    function GetWidth: Integer;
    procedure ExtentsRange(start, end_: Integer; font: IPangoFont; inkRect, logicalRect: PPangoRectangle);
    procedure GetLogicalWidths(text: PAnsiChar; length, embeddingLevel: Integer; logicalWidths: PInteger);
    procedure IndexToX(text: PAnsiChar; length: Integer; analysis: PPangoAnalysis; index: Integer; trailing: Boolean; xPos: PInteger);
    procedure XToIndex(text: PAnsiChar; length: Integer; analysis: PPangoAnalysis; xPos: Integer; index, trailing: PInteger);
    property Handle: PPangoGlyphString read GetHandle;
  end;

  IPangoTabArray = interface
    ['{38DC6AE7-BC50-43D2-82F5-77C1B4417A4C}']
    function GetHandle: PPangoTabArray;
    function Copy: IPangoTabArray;
    function GetSize: Integer;
    procedure Resize(newSize: Integer);
    procedure SetTab(tabIndex: Integer; alignment: PangoTabAlign; location: Integer);
    procedure GetTab(tabIndex: Integer; alignment: PPangoTabAlign; location: PInteger);
    procedure GetTabs(var alignments: PPangoTabAlign; var locations: PInteger);
    function GetPositionsInPixels: Boolean;
    property Handle: PPangoTabArray read GetHandle;
  end;

  IPangoGlyphItem = interface
    ['{FD239606-C99D-462A-9E2F-25432C632F99}']
    function GetHandle: PPangoGlyphItem;
    function Split(text: PAnsiChar; splitIndex: Integer): IPangoGlyphItem;
    function Copy: IPangoGlyphItem;
    function ApplyAttrs(text: PAnsiChar; list: IPangoAttrList): IInterfaceList;
    procedure LetterSpace(text: PAnsiChar; logAttrs: PPangoLogAttr; letterSpacing: Integer);
    property Handle: PPangoGlyphItem read GetHandle;
  end;

  IPangoLayoutLine = interface
    ['{FC014F99-46B4-424D-B5F5-92550DDCDE9C}']
    function GetHandle: PPangoLayoutLine;
    function XToIndex(xPos: Integer; index: PInteger; trailing: PInteger): Boolean;
    procedure IndexToX(index: Integer; trailing: Boolean; xPos: PInteger);
    procedure GetXRanges(startIndex: Integer; endIndex: Integer; var ranges: PInteger; nRanges: PInteger);
    procedure GetExtents(inkRect: PPangoRectangle; logicalRect: PPangoRectangle);
    procedure GetPixelExtents(inkRect: PPangoRectangle; logicalRect: PPangoRectangle);
    property Handle: PPangoLayoutLine read GetHandle;
  end;

  IPangoLayoutIter = interface
    ['{C02A2094-BC98-44C5-AF5C-3CD6A9CB9560}']
    function Copy: IPangoLayoutIter;
    function GetIndex: Integer;
    function GetRun: IPangoLayoutRun;
    function GetRunReadonly: IPangoLayoutRun;
    function GetLine: IPangoLayoutLine;
    function GetLineReadonly: IPangoLayoutLine;
    function AtLastLine: Boolean;
    function GetLayout: IPangoLayout;
    function NextChar: Boolean;
    function NextCluster: Boolean;
    function NextRun: Boolean;
    function NextLine: Boolean;
    procedure GetCharExtents(logicalRect: PPangoRectangle);
    procedure GetClusterExtents(inkRect, logicalRect: PPangoRectangle);
    procedure GetRunExtents(inkRect, logicalRect: PPangoRectangle);
    procedure GetLineExtents(inkRect, logicalRect: PPangoRectangle);
    procedure GetLineYrange(y0, y1: PInteger);
    procedure GetLayoutExtents(inkRect, logicalRect: PPangoRectangle);
    function GetBaseline: Integer;
  end;

/////////////////////////////////////////////////////////////////////////////////

  // abstract class
  TPangoFontMap = class(TGObject, IPangoFontMap)
  protected
    function CreateContext: IPangoContext;
    function LoadFont(context: IPangoContext; desc: IPangoFontDescription): IPangoFont;
    function LoadFontset(context: IPangoContext; desc: IPangoFontDescription; language: PPangoLanguage): IPangoFontset;
    function ListFamilies: IInterfaceList;
    function GetShapeEngineType: PAnsiChar;
  end;

  TPangoFont = class(TGObject, IPangoFont)
  protected
    function Describe: IPangoFontDescription;
    function DescribeWithAbsoluteSize: IPangoFontDescription;
    function GetCoverage(language: PPangoLanguage): IPangoCoverage;
    function FindShaper(language: PPangoLanguage; ch: Cardinal): IPangoEngineShape;
    function GetMetrics(language: PPangoLanguage): IPangoFontMetrics;
    procedure GetGlyphExtents(glyph: PangoGlyph; inkRect: PPangoRectangle; logicalRect: PPangoRectangle);
    function GetFontMap: IPangoFontMap;
  end;

  TPangoContext = class(TGObject, IPangoContext)
  protected
    procedure SetFontMap(fontMap: IPangoFontMap);
    function GetFontMap: IPangoFontMap;
    function ListFamilies: IInterfaceList;
    function LoadFont(desc: IPangoFontDescription): IPangoFont;
    function LoadFontset(desc: IPangoFontDescription; language: PPangoLanguage): IPangoFontset;
    function GetMetrics(desc: IPangoFontDescription; language: PPangoLanguage): IPangoFontMetrics;
    procedure SetFontDescription(desc: IPangoFontDescription);
    function GetFontDescription: IPangoFontDescription;
    function GetLanguage: PPangoLanguage;
    procedure SetLanguage(language: PPangoLanguage);
    procedure SetBaseDir(direction: PangoDirection);
    function GetBaseDir: PangoDirection;
    procedure SetBaseGravity(gravity: PangoGravity);
    function GetBaseGravity: PangoGravity;
    function GetGravity: PangoGravity;
    procedure SetGravityHint(hint: PangoGravityHint);
    function GetGravityHint: PangoGravityHint;
    procedure SetMatrix(matrix: PPangoMatrix);
    function GetMatrix: PPangoMatrix;
    function NewLayout: IPangoLayout;
    function Itemize(text: PAnsiChar; startIndex, length: Integer; attrs: IPangoAttrList; cachedIter: IPangoAttrIterator): IInterfaceList;
    function ItemizeWithBaseDir(baseDir: PangoDirection; text: PAnsiChar; startIndex, length: Integer; attrs: IPangoAttrList; cachedIter: IPangoAttrIterator): IInterfaceList;
  public
    constructor Create; virtual;
  end;

  TPangoEngine = class(TGObject, IPangoEngine)
  end;

  TPangoEngineLang = class(TPangoEngine, IPangoEngineLang)
  end;

  TPangoEngineShape = class(TPangoEngine, IPangoEngineShape)
  end;

  TPangoFontFace = class(TGObject, IPangoFontFace)
  private
    FSize: Integer;
    FSizes: Pinteger;
  protected
    function Describe: IPangoFontDescription;
    function GetFaceName: PAnsiChar;
    function GetSizes: Integer;
    function GetSize(index: Integer): Integer;
    function IsSynthesized: Boolean;
  public
    constructor CreateInternal(Handle: Pointer); override;
    destructor Destroy; override;
  end;

  TPangoFontFamily = class(TGObject, IPangoFontFamily)
  protected
    function ListFaces: IInterfaceList;
    function GetName: PAnsiChar;
    function IsMonospace: Boolean;
  end;

  TPangoFontset = class(TGObject, IPangoFontset)
  protected
    function GetFont(wc: Cardinal): IPangoFont;
    function GetMetrics: IPangoFontMetrics;
    procedure ForEach(func: PangoFontsetForeachFunc; data: Pointer);
  end;

  TPangoFontsetSimple = class(TPangoFontset, IPangoFontsetSimple)
  protected
    procedure Append(font: IPangoFont);
    function Size: Integer;
  public
    constructor Create(language: PPangoLanguage); virtual;
  end;

  TPangoLayout = class(TGObject, IPangoLayout)
  protected
    function Copy: IPangoLayout;
    function GetContext: IPangoContext;
    procedure SetAttributes(attrs: IPangoAttrList);
    function GetAttributes: IPangoAttrList;
    procedure SetText(const text: string);
    function GetText: string;
    procedure SetMarkup(markup: PAnsiChar; length: Integer);
    procedure SetMarkupWithAccel(markup: PAnsiChar; length: Integer; accelMarker: WideChar; accelChar: PWideChar);
    procedure SetFontDescription(desc: IPangoFontDescription);
    function GetFontDescription: IPangoFontDescription;
    procedure SetWidth(width: Integer);
    function GetWidth: Integer;
    procedure SetHeight(height: Integer);
    function GetHeight: Integer;
    procedure SetWrap(wrap: PangoWrapMode);
    function GetWrap: PangoWrapMode;
    function IsWrapped: Boolean;
    procedure SetIndent(indent: Integer);
    function GetIndent: Integer;
    procedure SetSpacing(spacing: Integer);
    function GetSpacing: Integer;
    procedure SetJustify(justify: Boolean);
    function GetJustify: Boolean;
    procedure SetAutoDir(autoDir: Boolean);
    function GetAutoDir: Boolean;
    procedure SetAlignment(alignment: PangoAlignment);
    function GetAlignment: PangoAlignment;
    procedure SetTabs(tabs: IPangoTabArray);
    function GetTabs: IPangoTabArray;
    procedure SetSingleParagraphMode(setting: Boolean);
    function GetSingleParagraphMode: Boolean;
    procedure SetEllipsize(ellipsize: PangoEllipsizeMode);
    function GetEllipsize: PangoEllipsizeMode;
    function IsEllipsized: Boolean;
    function GetUnknownGlyphsCount: Integer;
    procedure ContextChanged;
    procedure GetLogAttrs(var attrs: PPangoLogAttr; var nAttrs: Integer);
    procedure IndexToPos(index: Integer; pos: PPangoRectangle);
    procedure IndexToLineX(index: Integer; trailing: Boolean; line: PInteger; xPos: PInteger);
    procedure GetCursorPos(index: Integer; strongPos: PPangoRectangle; weakPos: PPangoRectangle);
    procedure MoveCursorVisually(strong: Boolean; oldIndex: Integer; oldTrailing: Integer; direction: Integer; newIndex: PInteger; newTrailing: PInteger);
    function XyToIndex(x: Integer; y: Integer; index: PInteger; trailing: PInteger): Boolean;
    procedure GetExtents(inkRect: PPangoRectangle; logicalRect: PPangoRectangle);
    procedure GetPixelExtents(inkRect: PPangoRectangle; logicalRect: PPangoRectangle);
    procedure GetSize(var width, height: Integer);
    procedure GetPixelSize(width: PInteger; height: PInteger);
    function GetBaseline: Integer;
    function GetLineCount: Integer;
    function GetLine(line: Integer): IPangoLayoutLine;
    function GetLineReadonly(line: Integer): IPangoLayoutLine;
    function GetLines: PGSList;
    function GetLinesReadonly: PGSList;
  end;

  TPangoRenderer = class(TGObject, IPangoRenderer)
  protected
    procedure DrawLayout(layout: IPangoLayout; x: Integer; y: Integer);
    procedure DrawLayoutLine(line: IPangoLayoutLine; x, y: Integer);
    procedure DrawGlyphs(font: IPangoFont; glyphs: IPangoGlyphString; x, y: Integer);
    procedure DrawGlyphItem(text: PAnsiChar; glyphItem: IPangoGlyphItem; x, y: Integer);
    procedure DrawRectangle(part: PangoRenderPart; x, y, width, height: Integer);
    procedure DrawErrorUnderline(x, y, width, height: Integer);
    procedure DrawTrapezoid(part: PangoRenderPart; y1, x11, x21, y2, x12, x22: double);
    procedure DrawGlyph(font: IPangoFont; glyph: PangoGlyph; x, y: double);
    procedure Activate;
    procedure Deactivate;
    procedure PartChanged(part: PangoRenderPart);
    procedure SetColor(part: PangoRenderPart; color: PPangoColor);
    function GetColor(part: PangoRenderPart): PPangoColor;
    procedure SetMatrix(matrix: PPangoMatrix);
    function GetMatrix: PPangoMatrix;
    function GetLayout: IPangoLayout;
    function GetLayoutLine: IPangoLayoutLine;
  end;

  TPangoXftRenderer = class(TPangoRenderer, IPangoXftRenderer)
  end;

  TPangoFontDescription = class(TInterfacedObject, IPangoFontDescription)
  private
    FHandle: PPangoFontDescription;
    FOwned: Boolean;
  protected
    function GetHandle: PPangoFontDescription;
    function Copy: IPangoFontDescription;
    function CopyStatic: IPangoFontDescription;
    function Hash: Cardinal;
    function Equal(desc: IPangoFontDescription): Boolean;
    procedure SetFamily(family: PAnsiChar);
    procedure SetFamilyStatic(const family: string);
    function GetFamily: PAnsiChar;
    procedure SetStyle(style: PangoStyle);
    function GetStyle: PangoStyle;
    procedure SetVariant(variant: PangoVariant);
    function GetVariant: PangoVariant;
    procedure SetWeight(weight: PangoWeight);
    function GetWeight: PangoWeight;
    procedure SetStretch(stretch: PangoStretch);
    function GetStretch: PangoStretch;
    procedure SetSize(size: Integer);
    function GetSize: Integer;
    procedure SetAbsoluteSize(size: Double);
    function GetSizeIsAbsolute: Boolean;
    procedure SetGravity(gravity: PangoGravity);
    function GetGravity: PangoGravity;
    function GetSetFields: PangoFontMask;
    procedure UnsetFields(toUnset: PangoFontMask);
    procedure Merge(descToMerge: IPangoFontDescription; replaceExisting: Boolean);
    procedure MergeStatic(descToMerge: IPangoFontDescription; replaceExisting: Boolean);
    function BetterMatch(oldMatch: IPangoFontDescription; newMatch: IPangoFontDescription): Boolean;
    function ToFilename: string;
  public
    function ToString: string; override;
    constructor Create; virtual;
    constructor CreateFromString(const str: string); virtual;
    constructor CreateInternal(Handle: PPangoFontDescription; Owned: Boolean); virtual;
    destructor Destroy; override;
  end;

  TPangoScriptIter = class(TInterfacedObject, IPangoScriptIter)
  private
    FPangoScriptIter: PPangoScriptIter;
    FText: UTF8String;
  protected
    function Text: string;
    function Script: PangoScript;
    function Next: Boolean;
  public
    constructor Create(const text: string); virtual;
    destructor Destroy; override;
  end;

  TPangoCoverage = class(TInterfacedObject, IPangoCoverage)
  private
    FPangoCoverage: PPangoCoverage;
    constructor CreateInternal(Handle: PPangoCoverage);
  protected
    function GetHandle: PPangoCoverage;
    function Copy: IPangoCoverage;
    function GetLevel(index: Integer): PangoCoverageLevel;
    procedure SetLevel(index: Integer; level: PangoCoverageLevel);
    procedure Max(other: IPangoCoverage);
    function ToBytes: RawByteString;
  public
    constructor Create; virtual;
    constructor CreateFromBytes(bytes: RawByteString); virtual;
    destructor Destroy; override;
  end;

  TPangoFontMetrics = class(TInterfacedObject, IPangoFontMetrics)
  private
    FPangoFontMetrics: PPangoFontMetrics;
    constructor CreateInternal(Handle: PPangoFontMetrics); virtual;
  protected
    function GetAscent: Integer;
    function GetDescent: Integer;
    function GetApproximateCharWidth: Integer;
    function GetApproximateDigitWidth: Integer;
    function GetUnderlinePosition: Integer;
    function GetUnderlineThickness: Integer;
    function GetStrikethroughPosition: Integer;
    function GetStrikethroughThickness: Integer;
  public
    constructor Create; virtual;
    destructor Destroy; override;
  end;

  TPangoAttrList = class(TInterfacedObject, IPangoAttrList)
  private
    FPangoAttrList: PPangoAttrList;
    constructor CreateInternal(Handle: PPangoAttrList);
  protected
    function GetHandle: PPangoAttrList;
    function Copy: IPangoAttrList;
    procedure Insert(attr: IPangoAttribute);
    procedure InsertBefore(attr: IPangoAttribute);
    procedure Change(attr: IPangoAttribute);
    procedure Splice(other: IPangoAttrList; pos: Integer; len: Integer);
    function Filter(func: PangoAttrFilterFunc; data: Pointer): IPangoAttrList;
    function GetIterator: IPangoAttrIterator;
  public
    constructor Create; virtual;
    destructor Destroy; override;
  end;

  TPangoAttribute = class(TInterfacedObject, IPangoAttribute)
  private
    FPangoAttribute: PPangoAttribute;
    FOwned: Boolean;
    constructor CreateInternal(Handle: PPangoAttribute; Owned: Boolean);
  protected
    function GetHandle: PPangoAttribute;
    function Copy: IPangoAttribute;
    function Equal(attr: IPangoAttribute): Boolean;
    procedure ListInsert(list: IPangoAttrList);
    procedure ListInsertBefore(list: IPangoAttrList);
    procedure ListChange(list: IPangoAttrList);
  public
    constructor CreateLanguage(language: PPangoLanguage);
    constructor CreateFamily(family: PAnsiChar);
    constructor CreateForeground(red: Word; green: Word; blue: Word);
    constructor CreateBackground(red: Word; green: Word; blue: Word);
    constructor CreateSize(size: Integer);
    constructor CreateSizeAbsolute(size: Integer);
    constructor CreateStyle(style: PangoStyle);
    constructor CreateWeight(weight: PangoWeight);
    constructor CreateVariant(variant: PangoVariant);
    constructor CreateStretch(stretch: PangoStretch);
    constructor CreateFontDesc(desc: IPangoFontDescription);
    constructor CreateUnderline(underline: PangoUnderline);
    constructor CreateUnderlineColor(red: Word; green: Word; blue: Word);
    constructor CreateStrikethrough(strikethrough: Boolean);
    constructor CreateStrikethroughColor(red: Word; green: Word; blue: Word);
    constructor CreateRise(rise: Integer);
    constructor CreateScale(scaleFactor: double);
    constructor CreateFallback(enableFallback: Boolean);
    constructor CreateLetterSpacing(letterSpacing: Integer);
    constructor CreateShape(inkRect, logicalRect: PPangoRectangle);
    constructor CreateShapeWithData(inkRect, logicalRect: PPangoRectangle; data: Pointer; copyFunc: PangoAttrDataCopyFunc; destroyFunc: GDestroyNotify);
    constructor CreateGravity(gravity: PangoGravity);
    constructor CreateGravityHint(hint: PangoGravityHint);
    destructor Destroy; override;
  end;

  TPangoAttrIterator = class(TInterfacedObject, IPangoAttrIterator)
  private
    FPangoAttrIterator: PPangoAttrIterator;
    constructor CreateInternal(Handle: PPangoAttrIterator);
  protected
    function GetHandle: PPangoAttrIterator;
    procedure Range(start: PInteger; end_: PInteger);
    function Next: Boolean;
    function Copy: IPangoAttrIterator;
    function Get(type_: PangoAttrType): IPangoAttribute ;
    procedure GetFont(desc: IPangoFontDescription; language: PPPangoLanguage; extraAttrs: PPGSList);
    function GetAttrs: IInterfaceList;
  public
    destructor Destroy; override;
  end;

  TPangoItem = class(TInterfacedObject, IPangoItem)
  private
    FPangoItem: PPangoItem;
    FOwned: Boolean;
    constructor CreateInternal(Handle: PPangoItem; Owned: Boolean);
  protected
    function Copy: IPangoItem;
    function Split(splitIndex, splitOffset: Integer): IPangoItem;
  public
    constructor Create; virtual;
    destructor Destroy; override;
  end;

  TPangoGlyphString = class(TInterfacedObject, IPangoGlyphString)
  private
    FPangoGlyphString: PPangoGlyphString;
    constructor CreateInternal(Handle: PPangoGlyphString);
  protected
    function GetHandle: PPangoGlyphString;
    procedure SetSize(newLen: Integer);
    function Copy: IPangoGlyphString;
    procedure Extents(font: IPangoFont; inkRect, logicalRect: PPangoRectangle);
    function GetWidth: Integer;
    procedure ExtentsRange(start, end_: Integer; font: IPangoFont; inkRect, logicalRect: PPangoRectangle);
    procedure GetLogicalWidths(text: PAnsiChar; length, embeddingLevel: Integer; logicalWidths: PInteger);
    procedure IndexToX(text: PAnsiChar; length: Integer; analysis: PPangoAnalysis; index: Integer; trailing: Boolean; xPos: PInteger);
    procedure XToIndex(text: PAnsiChar; length: Integer; analysis: PPangoAnalysis; xPos: Integer; index, trailing: PInteger);
  public
    constructor Create; virtual;
    destructor Destroy; override;
  end;

  TPangoTabArray = class(TInterfacedObject, IPangoTabArray)
  private
    FPangoTabArray: PPangoTabArray;
    FOwned: Boolean;
    constructor CreateInternal(Handle: PPangoTabArray; Owned: Boolean);
  protected
    function GetHandle: PPangoTabArray;
    function Copy: IPangoTabArray;
    function GetSize: Integer;
    procedure Resize(newSize: Integer);
    procedure SetTab(tabIndex: Integer; alignment: PangoTabAlign; location: Integer);
    procedure GetTab(tabIndex: Integer; alignment: PPangoTabAlign; location: PInteger);
    procedure GetTabs(var alignments: PPangoTabAlign; var locations: PInteger);
    function GetPositionsInPixels: Boolean;
  public
    constructor Create(initialSize: Integer; positionsInPixels: boolean); virtual;
    constructor CreateWithPositions(size: Integer; positionsInPixels: Boolean;
      firstAlignment: PangoTabAlign; firstPosition: Integer);
    destructor Destroy; override;
  end;

  TPangoGlyphItem = class(TInterfacedObject, IPangoGlyphItem)
  private
    FPangoGlyphItem: PPangoGlyphItem;
    FOwned: Boolean;
    constructor CreateInternal(Handle: PPangoGlyphItem; Owned: Boolean);
  protected
    function GetHandle: PPangoGlyphItem;
    function Split(text: PAnsiChar; splitIndex: Integer): IPangoGlyphItem;
    function Copy: IPangoGlyphItem;
    function ApplyAttrs(text: PAnsiChar; list: IPangoAttrList): IInterfaceList;
    procedure LetterSpace(text: PAnsiChar; logAttrs: PPangoLogAttr; letterSpacing: Integer);
  public
    destructor Destroy; override;
  end;

  TPangoLayoutLine = class(TInterfacedObject, IPangoLayoutLine)
  private
    FPangoLayoutLine: PPangoLayoutLine;
    constructor CreateInternal(Handle: PPangoLayoutLine);
  protected
    function GetHandle: PPangoLayoutLine;
    function XToIndex(xPos: Integer; index: PInteger; trailing: PInteger): Boolean;
    procedure IndexToX(index: Integer; trailing: Boolean; xPos: PInteger);
    procedure GetXRanges(startIndex: Integer; endIndex: Integer; var ranges: PInteger; nRanges: PInteger);
    procedure GetExtents(inkRect: PPangoRectangle; logicalRect: PPangoRectangle);
    procedure GetPixelExtents(inkRect: PPangoRectangle; logicalRect: PPangoRectangle);
  public
    destructor Destroy; override;
  end;

  TPangoLayoutIter = class(TInterfacedObject, IPangoLayoutIter)
  private
    FPangoLayoutIter: PPangoLayoutIter;
    constructor CreateInternale(Handle: PPangoLayoutIter);
  protected
    function Copy: IPangoLayoutIter;
    function GetIndex: Integer;
    function GetRun: IPangoLayoutRun;
    function GetRunReadonly: IPangoLayoutRun;
    function GetLine: IPangoLayoutLine;
    function GetLineReadonly: IPangoLayoutLine;
    function AtLastLine: Boolean;
    function GetLayout: IPangoLayout;
    function NextChar: Boolean;
    function NextCluster: Boolean;
    function NextRun: Boolean;
    function NextLine: Boolean;
    procedure GetCharExtents(logicalRect: PPangoRectangle);
    procedure GetClusterExtents(inkRect, logicalRect: PPangoRectangle);
    procedure GetRunExtents(inkRect, logicalRect: PPangoRectangle);
    procedure GetLineExtents(inkRect, logicalRect: PPangoRectangle);
    procedure GetLineYrange(y0, y1: PInteger);
    procedure GetLayoutExtents(inkRect, logicalRect: PPangoRectangle);
    function GetBaseline: Integer;
  public
    constructor Create(layout: IPangoLayout); virtual;
    destructor Destroy; override;
  end;

  procedure PangoShape(const text: string; analysis: PPangoAnalysis; glyphs: IPangoGlyphString);
  procedure PangoBreak(const text: string; analysis: PPangoAnalysis; attrs: PPangoLogAttr; attrsLen: Integer);
  procedure PangoFindParagraphBoundary(const text: string; paragraphDelimiterIndex, nextParagraphStart: PInteger);
  procedure PangoGetLogAttrs(const text: string; level: Integer; language: PPangoLanguage; logAttrs: PPangoLogAttr; attrsLen: Integer);
  procedure PangoDefaultBreak(const text: string; analysis: PPangoAnalysis; attrs: PPangoLogAttr; attrsLen: Integer);

implementation

type
  TIntegerArray = array[0..High(Integer) div sizeof(Integer) - 1] of Integer;
  PIntegerArray = ^TIntegerArray;

function PangoFontDescriptionHandle(I: IPangoFontDescription): PPangoFontDescription; inline;
begin
  if I <> nil then Result := I.Handle else Result := nil;
end;

function PangoCoverageHandle(I: IPangoCoverage): PPangoCoverage; inline;
begin
  if I <> nil then Result := I.Handle else Result := nil;
end;

function PangoAttrListHandle(I: IPangoAttrList): PPangoAttrList; inline;
begin
  if I <> nil then Result := I.Handle else Result := nil;
end;

function PangoAttributeHandle(I: IPangoAttribute): PPangoAttribute; inline;
begin
  if I <> nil then Result := I.Handle else Result := nil;
end;

function PangoAttrIteratorHandle(I: IPangoAttrIterator): PPangoAttrIterator; inline;
begin
  if I <> nil then Result := I.Handle else Result := nil;
end;

function PangoGlyphStringHandle(I: IPangoGlyphString): PPangoGlyphString; inline;
begin
  if I <> nil then Result := I.Handle else Result := nil;
end;

function PangoTabArrayHandle(I: IPangoTabArray): PPangoTabArray; inline;
begin
  if I <> nil then Result := I.Handle else Result := nil;
end;

function PangoGlyphItemHandle(I: IPangoGlyphItem): PPangoGlyphItem; inline;
begin
  if I <> nil then Result := I.Handle else Result := nil;
end;

function PangoLayoutLineHandle(I: IPangoLayoutLine): PPangoLayoutLine; inline;
begin
  if I <> nil then Result := I.Handle else Result := nil;
end;

////////////////////////////

procedure PangoShape(const text: string; analysis: PPangoAnalysis; glyphs: IPangoGlyphString);
var
  utf: UTF8String;
begin
  utf := UTF8String(text);
  pango_shape(PAnsiChar(utf), Length(utf), analysis, PangoGlyphStringHandle(glyphs));
end;

procedure PangoBreak(const text: string; analysis: PPangoAnalysis; attrs: PPangoLogAttr; attrsLen: Integer);
var
  utf: UTF8String;
begin
  utf := UTF8String(text);
  pango_break(PAnsiChar(utf), Length(utf), analysis, attrs, attrsLen);
end;

procedure PangoFindParagraphBoundary(const text: string; paragraphDelimiterIndex, nextParagraphStart: PInteger);
var
  utf: UTF8String;
begin
  utf := UTF8String(text);
  pango_find_paragraph_boundary(PAnsiChar(utf), Length(utf), paragraphDelimiterIndex, nextParagraphStart);
end;

procedure PangoGetLogAttrs(const text: string; level: Integer; language: PPangoLanguage; logAttrs: PPangoLogAttr; attrsLen: Integer);
var
  utf: UTF8String;
begin
  utf := UTF8String(text);
  pango_get_log_attrs(PAnsiChar(utf), Length(utf), level, language, logAttrs, attrsLen);
end;

procedure PangoDefaultBreak(const text: string; analysis: PPangoAnalysis; attrs: PPangoLogAttr; attrsLen: Integer);
var
  utf: UTF8String;
begin
  utf := UTF8String(text);
  pango_default_break(PAnsiChar(utf), Length(utf), analysis, attrs, attrsLen);
end;

{ TPangoFontMap }

function TPangoFontMap.CreateContext: IPangoContext;
begin
  Result := TPangoContext.CreateInternal(pango_font_map_create_context(GetHandle));
end;

function TPangoFontMap.GetShapeEngineType: PAnsiChar;
begin
  Result := pango_font_map_get_shape_engine_type(GetHandle);
end;

function TPangoFontMap.ListFamilies: IInterfaceList;
var
  p, families: PPPangoFontFamily;
  count: Integer;
begin
  Result := TInterfaceList.Create;
  pango_font_map_list_families(GetHandle, @families, @count);
  p := families;
  while count > 0 do
  begin
    Result.Add(TPangoFontFamily.CreateInternal(g_object_ref(families^)));
    inc(families);
    dec(count);
  end;
  g_free(p);
end;

function TPangoFontMap.LoadFont(context: IPangoContext;
  desc: IPangoFontDescription): IPangoFont;
var
  p: PPangoFont;
begin
  p := pango_font_map_load_font(GetHandle, GObjectHandle(context), PangoFontDescriptionHandle(desc));
  if p <> nil then
    Result := TPangoFont.CreateInternal(g_object_ref(p)) else
    Result := nil;
end;

function TPangoFontMap.LoadFontset(context: IPangoContext;
  desc: IPangoFontDescription; language: PPangoLanguage): IPangoFontset;
var
  p: PPangoFontset;
begin
  p := pango_font_map_load_fontset(GetHandle, GObjectHandle(context), PangoFontDescriptionHandle(desc), language);
  if p <> nil then
    Result := TPangoFontset.CreateInternal(g_object_ref(p)) else
    Result := nil;
end;

{ TPangoFont }

function TPangoFont.Describe: IPangoFontDescription;
begin
  Result := TPangoFontDescription.CreateInternal(pango_font_describe(GetHandle), true);
end;

function TPangoFont.DescribeWithAbsoluteSize: IPangoFontDescription;
begin
  Result := TPangoFontDescription.CreateInternal(pango_font_describe_with_absolute_size(GetHandle), true);
end;

function TPangoFont.FindShaper(language: PPangoLanguage;
  ch: Cardinal): IPangoEngineShape;
begin
  Result := TPangoEngineShape.CreateInternal(g_object_ref(pango_font_find_shaper(GetHandle, language, ch)));
end;

function TPangoFont.GetCoverage(language: PPangoLanguage): IPangoCoverage;
begin
  Result := TPangoCoverage.CreateInternal(pango_font_get_coverage(GetHandle, language));
end;

function TPangoFont.GetFontMap: IPangoFontMap;
var
  p: PPangoFontMap;
begin
  p := pango_font_get_font_map(GetHandle);
  if p  <> nil then
    Result := TPangoFontMap.CreateInternal(g_object_ref(p)) else
    Result := nil;
end;

procedure TPangoFont.GetGlyphExtents(glyph: PangoGlyph; inkRect,
  logicalRect: PPangoRectangle);
begin
  pango_font_get_glyph_extents(GetHandle, glyph, inkRect, logicalRect);
end;

function TPangoFont.GetMetrics(language: PPangoLanguage): IPangoFontMetrics;
begin
  Result := TPangoFontMetrics.CreateInternal(pango_font_get_metrics(GetHandle, language));
end;

{ TPangoContext }

constructor TPangoContext.Create;
begin
  CreateInternal(pango_context_new);
end;

function TPangoContext.GetBaseDir: PangoDirection;
begin
  Result := pango_context_get_base_dir(GetHandle);
end;

function TPangoContext.GetBaseGravity: PangoGravity;
begin
  Result := pango_context_get_base_gravity(GetHandle);
end;

function TPangoContext.GetFontDescription: IPangoFontDescription;
begin
  Result := TPangoFontDescription.CreateInternal(pango_context_get_font_description(GetHandle), false);
end;

function TPangoContext.GetFontMap: IPangoFontMap;
var
  p: Pointer;
begin
  p := pango_context_get_font_map(GetHandle);
  if p <> nil then
    Result := TPangoFontMap.CreateInternal(g_object_ref(p)) else
    Result := nil;
end;

function TPangoContext.GetGravity: PangoGravity;
begin
  Result := pango_context_get_gravity(GetHandle);
end;

function TPangoContext.GetGravityHint: PangoGravityHint;
begin
  Result := pango_context_get_gravity_hint(GetHandle);
end;

function TPangoContext.GetLanguage: PPangoLanguage;
begin
  Result := pango_context_get_language(GetHandle);
end;

function TPangoContext.GetMatrix: PPangoMatrix;
begin
  Result := pango_context_get_matrix(GetHandle);
end;

function TPangoContext.GetMetrics(desc: IPangoFontDescription;
  language: PPangoLanguage): IPangoFontMetrics;
begin
  Result := TPangoFontMetrics.CreateInternal(pango_context_get_metrics(GetHandle, PangoFontDescriptionHandle(desc), language));
end;

function TPangoContext.Itemize(text: PAnsiChar; startIndex, length: Integer;
  attrs: IPangoAttrList;
  cachedIter: IPangoAttrIterator): IInterfaceList;
var
  p: PGList;
begin
  Result := TInterfaceList.Create;
  p := pango_itemize(GetHandle, text, startIndex, length, PangoAttrListHandle(attrs), PangoAttrIteratorHandle(cachedIter));
  while p <> nil do
  begin
    Result.Add(TPangoItem.CreateInternal(p.data, false));
    p := p.next;
  end;
end;

function TPangoContext.ItemizeWithBaseDir(baseDir: PangoDirection;
  text: PAnsiChar; startIndex, length: Integer; attrs: IPangoAttrList;
  cachedIter: IPangoAttrIterator): IInterfaceList;
var
  list, p: PGList;
begin
  Result := TInterfaceList.Create;
  list := pango_itemize_with_base_dir(GetHandle, baseDir, text, startIndex, length, PangoAttrListHandle(attrs), PangoAttrIteratorHandle(cachedIter));
  p := list;
  while p <> nil do
  begin
    Result.Add(TPangoItem.CreateInternal(p.data, true));
    p := p.next;
  end;
  g_list_free(list);
end;

function TPangoContext.ListFamilies: IInterfaceList;
var
  p, families: PPPangoFontFamily;
  count: Integer;
begin
  Result := TInterfaceList.Create;
  pango_context_list_families(GetHandle, @families, @count);
  p := families;
  while count > 0 do
  begin
    result.Add(TPangoFontFamily.CreateInternal(g_object_ref(families^)));
    inc(families);
    dec(count);
  end;
  g_free(p);
end;

function TPangoContext.LoadFont(desc: IPangoFontDescription): IPangoFont;
var
  p: PPangoFont;
begin
  p := pango_context_load_font(GetHandle, PangoFontDescriptionHandle(desc));
  if p <> nil then
    Result := TPangoFont.CreateInternal(g_object_ref(p)) else
    Result := nil;
end;

function TPangoContext.LoadFontset(desc: IPangoFontDescription;
  language: PPangoLanguage): IPangoFontset;
var
  p: PPangoFontset;
begin
  p := pango_context_load_fontset(GetHandle, PangoFontDescriptionHandle(desc), language);
  if p <> nil then
    Result := TPangoFontset.CreateInternal(g_object_ref(p)) else
    Result := nil;
end;

function TPangoContext.NewLayout: IPangoLayout;
begin
  Result := TPangoLayout.CreateInternal(pango_layout_new(GetHandle));
end;

procedure TPangoContext.SetBaseDir(direction: PangoDirection);
begin
  pango_context_set_base_dir(GetHandle, direction);
end;

procedure TPangoContext.SetBaseGravity(gravity: PangoGravity);
begin
  pango_context_set_base_gravity(GetHandle, gravity);
end;

procedure TPangoContext.SetFontDescription(desc: IPangoFontDescription);
begin
  pango_context_set_font_description(GetHandle, PangoFontDescriptionHandle(desc));;
end;

procedure TPangoContext.SetFontMap(fontMap: IPangoFontMap);
begin
  pango_context_set_font_map(GetHandle, GObjectHandle(fontMap));
end;

procedure TPangoContext.SetGravityHint(hint: PangoGravityHint);
begin
  pango_context_set_gravity_hint(GetHandle, hint);
end;

procedure TPangoContext.SetLanguage(language: PPangoLanguage);
begin
  pango_context_set_language(GetHandle, language);
end;

procedure TPangoContext.SetMatrix(matrix: PPangoMatrix);
begin
  pango_context_set_matrix(GetHandle, matrix);
end;

{ TPangoFontFace }

constructor TPangoFontFace.CreateInternal(Handle: Pointer);
begin
  inherited;
  FSize := 0;
  FSizes := nil;
end;

function TPangoFontFace.Describe: IPangoFontDescription;
begin
  Result := TPangoFontDescription.CreateInternal(pango_font_face_describe(GetHandle), true);
end;

destructor TPangoFontFace.Destroy;
begin
  if FSizes <> nil then
    g_free(FSizes);
  inherited;
end;

function TPangoFontFace.GetFaceName: PAnsiChar;
begin
  Result := pango_font_face_get_face_name(GetHandle);
end;

function TPangoFontFace.GetSize(index: Integer): Integer;
begin
 if FSizes = nil then
   pango_font_face_list_sizes(GetHandle, FSizes, FSize);
 if (index >= 0) and (index < FSize) then
   Result := PIntegerArray(FSizes)[index] else
   Result := 0;
end;

function TPangoFontFace.GetSizes: Integer;
begin
 if FSizes = nil then
   pango_font_face_list_sizes(GetHandle, FSizes, FSize);
 Result := FSize;
end;

function TPangoFontFace.IsSynthesized: Boolean;
begin
  Result := pango_font_face_is_synthesized(GetHandle);
end;

{ TPangoFontFamily }

function TPangoFontFamily.GetName: PAnsiChar;
begin
  Result := pango_font_family_get_name(GetHandle);
end;

function TPangoFontFamily.IsMonospace: Boolean;
begin
  Result := pango_font_family_is_monospace(GetHandle)
end;

function TPangoFontFamily.ListFaces: IInterfaceList;
var
  p, faces: PPPangoFontFace;
  count: Integer;
begin
  Result := TInterfaceList.Create;
  pango_font_family_list_faces(GetHandle, @faces, @count);
  p := faces;
  while count > 0 do
  begin
    Result.Add(TPangoFontFace.CreateInternal(g_object_ref(faces^)));
    inc(faces);
    dec(count);
  end;
  g_free(p);
end;

{ TPangoFontset }

procedure TPangoFontset.ForEach(func: PangoFontsetForeachFunc; data: Pointer);
begin
  pango_fontset_foreach(GetHandle, func, data);
end;

function TPangoFontset.GetFont(wc: Cardinal): IPangoFont;
begin
  Result := TPangoFont.CreateInternal(pango_fontset_get_font(GetHandle, wc));
end;

function TPangoFontset.GetMetrics: IPangoFontMetrics;
begin
  Result := TPangoFontMetrics.CreateInternal(pango_fontset_get_metrics(GetHandle));
end;

{ TPangoFontsetSimple }

procedure TPangoFontsetSimple.Append(font: IPangoFont);
begin
  pango_fontset_simple_append(GetHandle, GObjectHandle(font));
end;

constructor TPangoFontsetSimple.Create(language: PPangoLanguage);
begin
  CreateInternal(pango_fontset_simple_new(language));
end;

function TPangoFontsetSimple.Size: Integer;
begin
  Result := pango_fontset_simple_size(GetHandle);
end;

{ TPangoLayout }

procedure TPangoLayout.ContextChanged;
begin
  pango_layout_context_changed(GetHandle);
end;

function TPangoLayout.Copy: IPangoLayout;
begin
  Result := TPangoLayout.CreateInternal(pango_layout_copy(GetHandle));
end;

function TPangoLayout.GetAlignment: PangoAlignment;
begin
  Result := pango_layout_get_alignment(GetHandle);
end;

function TPangoLayout.GetAttributes: IPangoAttrList;
var
  p: PPangoAttrList;
begin
  p := pango_attr_list_ref(pango_layout_get_attributes(GetHandle));
  if p <> nil then
    Result := TPangoAttrList.CreateInternal(p) else
    Result := nil;
end;

function TPangoLayout.GetAutoDir: Boolean;
begin
  Result := pango_layout_get_auto_dir(GetHandle);
end;

function TPangoLayout.GetBaseline: Integer;
begin
  Result := pango_layout_get_baseline(GetHandle);
end;

function TPangoLayout.GetContext: IPangoContext;
begin
  Result := TPangoContext.CreateInternal(g_object_ref(pango_layout_get_context(GetHandle)));
end;

procedure TPangoLayout.GetCursorPos(index: Integer; strongPos,
  weakPos: PPangoRectangle);
begin
  pango_layout_get_cursor_pos(GetHandle, index, strongPos, weakPos);
end;

function TPangoLayout.GetEllipsize: PangoEllipsizeMode;
begin
  Result := pango_layout_get_ellipsize(GetHandle);
end;

procedure TPangoLayout.GetExtents(inkRect, logicalRect: PPangoRectangle);
begin
  pango_layout_get_extents(GetHandle, inkRect, logicalRect);
end;

function TPangoLayout.GetFontDescription: IPangoFontDescription;
var
  p: PPangoFontDescription;
begin
  p := pango_layout_get_font_description(GetHandle);
  if p <> nil then
    Result := TPangoFontDescription.CreateInternal(p, false) else
    Result := nil;
end;

function TPangoLayout.GetHeight: Integer;
begin
  Result := pango_layout_get_height(GetHandle);
end;

function TPangoLayout.GetIndent: Integer;
begin
  Result := pango_layout_get_indent(GetHandle);
end;

function TPangoLayout.GetJustify: Boolean;
begin
  Result := pango_layout_get_justify(GetHandle);
end;

function TPangoLayout.GetLine(line: Integer): IPangoLayoutLine;
var
  p: PPangoLayoutLine;
begin
  p := pango_layout_get_line(GetHandle, line);
  if p <> nil then
    Result := TPangoLayoutLine.CreateInternal(pango_layout_line_ref(p)) else
    Result := nil;
end;

function TPangoLayout.GetLineCount: Integer;
begin
  Result := pango_layout_get_line_count(GetHandle);
end;

function TPangoLayout.GetLineReadonly(line: Integer): IPangoLayoutLine;
var
  p: PPangoLayoutLine;
begin
  p := pango_layout_get_line_readonly(GetHandle, line);
  if p <> nil then
    Result := TPangoLayoutLine.CreateInternal(pango_layout_line_ref(p)) else
    Result := nil;
end;

function TPangoLayout.GetLines: PGSList;
begin
  Result := pango_layout_get_lines(GetHandle);
end;

function TPangoLayout.GetLinesReadonly: PGSList;
begin
  Result := pango_layout_get_lines_readonly(GetHandle);
end;

procedure TPangoLayout.GetLogAttrs(var attrs: PPangoLogAttr;
  var nAttrs: Integer);
begin
  pango_layout_get_log_attrs(GetHandle, attrs, nAttrs);
end;

procedure TPangoLayout.GetPixelExtents(inkRect, logicalRect: PPangoRectangle);
begin
  pango_layout_get_pixel_extents(GetHandle, inkRect, logicalRect);
end;

procedure TPangoLayout.GetPixelSize(width, height: PInteger);
begin
  pango_layout_get_pixel_size(GetHandle, width, height);
end;

function TPangoLayout.GetSingleParagraphMode: Boolean;
begin
  Result := pango_layout_get_single_paragraph_mode(GetHandle);
end;

procedure TPangoLayout.GetSize(var width, height: Integer);
begin
  pango_layout_get_size(GetHandle, @width, @height);
end;

function TPangoLayout.GetSpacing: Integer;
begin
  Result := pango_layout_get_spacing(GetHandle);
end;

function TPangoLayout.GetTabs: IPangoTabArray;
var
  p: PPangoTabArray;
begin
  p := pango_layout_get_tabs(GetHandle);
  if p <> nil then
    Result := TPangoTabArray.CreateInternal(p, true) else
    Result := nil;
end;

function TPangoLayout.GetText: string;
begin
  Result := string(UTF8String(pango_layout_get_text(GetHandle)));
end;

function TPangoLayout.GetUnknownGlyphsCount: Integer;
begin
  Result := pango_layout_get_unknown_glyphs_count(GetHandle);
end;

function TPangoLayout.GetWidth: Integer;
begin
  Result := pango_layout_get_width(GetHandle);
end;

function TPangoLayout.GetWrap: PangoWrapMode;
begin
  Result := pango_layout_get_wrap(GetHandle);
end;

procedure TPangoLayout.IndexToLineX(index: Integer; trailing: Boolean; line,
  xPos: PInteger);
begin
  pango_layout_index_to_line_x(GetHandle, index, trailing, line, xPos);
end;

procedure TPangoLayout.IndexToPos(index: Integer; pos: PPangoRectangle);
begin
  pango_layout_index_to_pos(GetHandle, index, pos);
end;

function TPangoLayout.IsEllipsized: Boolean;
begin
  Result := pango_layout_is_ellipsized(GetHandle);
end;

function TPangoLayout.IsWrapped: Boolean;
begin
  Result := pango_layout_is_wrapped(GetHandle);
end;

procedure TPangoLayout.MoveCursorVisually(strong: Boolean; oldIndex,
  oldTrailing, direction: Integer; newIndex, newTrailing: PInteger);
begin
  pango_layout_move_cursor_visually(GetHandle, strong, oldIndex, oldTrailing, direction, newIndex, newTrailing);
end;

procedure TPangoLayout.SetAlignment(alignment: PangoAlignment);
begin
  pango_layout_set_alignment(GetHandle, alignment);
end;

procedure TPangoLayout.SetAttributes(attrs: IPangoAttrList);
begin
  pango_layout_set_attributes(GetHandle, PangoAttrListHandle(attrs));
end;

procedure TPangoLayout.SetAutoDir(autoDir: Boolean);
begin
  pango_layout_set_auto_dir(GetHandle, autoDir);
end;

procedure TPangoLayout.SetEllipsize(ellipsize: PangoEllipsizeMode);
begin
  pango_layout_set_ellipsize(GetHandle, ellipsize);
end;

procedure TPangoLayout.SetFontDescription(desc: IPangoFontDescription);
begin
  pango_layout_set_font_description(GetHandle, PangoFontDescriptionHandle(desc));
end;

procedure TPangoLayout.SetHeight(height: Integer);
begin
  pango_layout_set_height(GetHandle, height);
end;

procedure TPangoLayout.SetIndent(indent: Integer);
begin
  pango_layout_set_indent(GetHandle, indent);
end;

procedure TPangoLayout.SetJustify(justify: Boolean);
begin
  pango_layout_set_justify(GetHandle, justify);
end;

procedure TPangoLayout.SetMarkup(markup: PAnsiChar; length: Integer);
begin
  pango_layout_set_markup(GetHandle, markup, length);
end;

procedure TPangoLayout.SetMarkupWithAccel(markup: PAnsiChar;
  length: Integer; accelMarker: WideChar; accelChar: PWideChar);
begin
  pango_layout_set_markup_with_accel(GetHandle, markup, length, accelMarker, accelChar);
end;

procedure TPangoLayout.SetSingleParagraphMode(setting: Boolean);
begin
  pango_layout_set_single_paragraph_mode(GetHandle, setting);
end;

procedure TPangoLayout.SetSpacing(spacing: Integer);
begin
  pango_layout_set_spacing(GetHandle, spacing);
end;

procedure TPangoLayout.SetTabs(tabs: IPangoTabArray);
begin
  pango_layout_set_tabs(GetHandle, PangoTabArrayHandle(tabs));
end;

procedure TPangoLayout.SetText(const text: string);
begin
  pango_layout_set_text(GetHandle, PAnsiChar(UTF8String(text)), -1);
end;

procedure TPangoLayout.SetWidth(width: Integer);
begin
  pango_layout_set_width(GetHandle, width);
end;

procedure TPangoLayout.SetWrap(wrap: PangoWrapMode);
begin
  pango_layout_set_wrap(GetHandle, wrap);
end;

function TPangoLayout.XyToIndex(x, y: Integer; index,
  trailing: PInteger): Boolean;
begin
  Result := pango_layout_xy_to_index(GetHandle, x, y, index, trailing);
end;

{ TPangoRenderer }

procedure TPangoRenderer.Activate;
begin
  pango_renderer_activate(GetHandle);
end;

procedure TPangoRenderer.Deactivate;
begin
  pango_renderer_deactivate(GetHandle);
end;

procedure TPangoRenderer.DrawErrorUnderline(x, y, width, height: Integer);
begin
  pango_renderer_draw_error_underline(GetHandle, x, y, width, height);
end;

procedure TPangoRenderer.DrawGlyph(font: IPangoFont; glyph: PangoGlyph; x,
  y: double);
begin
  pango_renderer_draw_glyph(GetHandle, GObjectHandle(font), glyph, x, y);
end;

procedure TPangoRenderer.DrawGlyphItem(text: PAnsiChar;
  glyphItem: IPangoGlyphItem; x, y: Integer);
begin
  pango_renderer_draw_glyph_item(GetHandle, text, PangoGlyphItemHandle(glyphItem), x, y);
end;

procedure TPangoRenderer.DrawGlyphs(font: IPangoFont; glyphs: IPangoGlyphString;
  x, y: Integer);
begin
  pango_renderer_draw_glyphs(GetHandle, GObjectHandle(font), PangoGlyphStringHandle(glyphs), x, y);
end;

procedure TPangoRenderer.DrawLayout(layout: IPangoLayout; x, y: Integer);
begin
  pango_renderer_draw_layout(GetHandle, GObjectHandle(layout), x, y);
end;

procedure TPangoRenderer.DrawLayoutLine(line: IPangoLayoutLine; x, y: Integer);
begin
  pango_renderer_draw_layout_line(GetHandle, PangoLayoutLineHandle(line), x, y);
end;

procedure TPangoRenderer.DrawRectangle(part: PangoRenderPart; x, y, width,
  height: Integer);
begin
  pango_renderer_draw_rectangle(GetHandle, part, x, y, width, height);
end;

procedure TPangoRenderer.DrawTrapezoid(part: PangoRenderPart; y1, x11, x21, y2,
  x12, x22: double);
begin
  pango_renderer_draw_trapezoid(GetHandle, part, y1, x11, x21, y2, x12, x22);
end;

function TPangoRenderer.GetColor(part: PangoRenderPart): PPangoColor;
begin
  Result :=  pango_renderer_get_color(GetHandle, part);
end;

function TPangoRenderer.GetLayout: IPangoLayout;
var
  p: PPangoLayout;
begin
  p := pango_renderer_get_layout(GetHandle);
  if p <> nil then
    Result := TPangoLayout.CreateInternal(g_object_ref(p)) else
    Result := nil;
end;

function TPangoRenderer.GetLayoutLine: IPangoLayoutLine;
var
  p: PPangoLayoutLine;
begin
  p := pango_renderer_get_layout_line(GetHandle);
  if p <> nil then
    Result :=  TPangoLayoutLine.CreateInternal(pango_layout_line_ref(p)) else
    Result := nil;
end;

function TPangoRenderer.GetMatrix: PPangoMatrix;
begin
  Result :=  pango_renderer_get_matrix(GetHandle)
end;

procedure TPangoRenderer.PartChanged(part: PangoRenderPart);
begin
  pango_renderer_part_changed(GetHandle, part);
end;

procedure TPangoRenderer.SetColor(part: PangoRenderPart;
  color: PPangoColor);
begin
  pango_renderer_set_color(GetHandle, part, color);
end;

procedure TPangoRenderer.SetMatrix(matrix: PPangoMatrix);
begin
  pango_renderer_set_matrix(GetHandle, matrix);
end;

{ TPangoFontDescription }

function TPangoFontDescription.BetterMatch(oldMatch,
  newMatch: IPangoFontDescription): Boolean;
begin
  Result := pango_font_description_better_match(FHandle,
    PangoFontDescriptionHandle(oldMatch),
    PangoFontDescriptionHandle(newMatch));
end;

function TPangoFontDescription.Copy: IPangoFontDescription;
begin
  Result := TPangoFontDescription.CreateInternal(pango_font_description_copy(FHandle), true);
end;

function TPangoFontDescription.CopyStatic: IPangoFontDescription;
begin
  Result := TPangoFontDescription.CreateInternal(pango_font_description_copy_static(FHandle), true);
end;

constructor TPangoFontDescription.Create;
begin
  CreateInternal(pango_font_description_new, true);
end;

constructor TPangoFontDescription.CreateFromString(const str: string);
begin
  CreateInternal(pango_font_description_from_string(PAnsiChar(RawByteString(str))), True);
end;

constructor TPangoFontDescription.CreateInternal(Handle: PPangoFontDescription; Owned: Boolean);
begin
  FHandle := Handle;
  FOwned := Owned;
end;

destructor TPangoFontDescription.Destroy;
begin
  if FOwned then
    pango_font_description_free(FHandle);
  inherited;
end;

function TPangoFontDescription.Equal(desc: IPangoFontDescription): Boolean;
begin
  Result := pango_font_description_equal(FHandle, PangoFontDescriptionHandle(desc));
end;

function TPangoFontDescription.GetFamily: PAnsiChar;
begin
  Result := pango_font_description_get_family(FHandle)
end;

function TPangoFontDescription.GetGravity: PangoGravity;
begin
  Result := pango_font_description_get_gravity(FHandle);
end;

function TPangoFontDescription.GetHandle: PPangoFontDescription;
begin
  Result := FHandle;
end;

function TPangoFontDescription.GetSetFields: PangoFontMask;
begin
  Result := pango_font_description_get_set_fields(FHandle);
end;

function TPangoFontDescription.GetSize: Integer;
begin
  Result := pango_font_description_get_size(FHandle)
end;

function TPangoFontDescription.GetSizeIsAbsolute: Boolean;
begin
  Result := pango_font_description_get_size_is_absolute(FHandle);
end;

function TPangoFontDescription.GetStretch: PangoStretch;
begin
  Result := pango_font_description_get_stretch(FHandle)
end;

function TPangoFontDescription.GetStyle: PangoStyle;
begin
  Result := pango_font_description_get_style(FHandle);
end;

function TPangoFontDescription.GetVariant: PangoVariant;
begin
  Result := pango_font_description_get_variant(FHandle);
end;

function TPangoFontDescription.GetWeight: PangoWeight;
begin
  Result := pango_font_description_get_weight(FHandle);
end;

function TPangoFontDescription.Hash: Cardinal;
begin
  Result := pango_font_description_hash(FHandle);
end;

procedure TPangoFontDescription.Merge(descToMerge: IPangoFontDescription;
  replaceExisting: Boolean);
begin
  pango_font_description_merge(FHandle, PangoFontDescriptionHandle(descToMerge), replaceExisting);
end;

procedure TPangoFontDescription.MergeStatic(
  descToMerge: IPangoFontDescription; replaceExisting: Boolean);
begin
  pango_font_description_merge_static(FHandle, PangoFontDescriptionHandle(descToMerge), replaceExisting);
end;

procedure TPangoFontDescription.SetAbsoluteSize(size: Double);
begin
  pango_font_description_set_absolute_size(FHandle, size);
end;

procedure TPangoFontDescription.SetFamily(family: PAnsiChar);
begin
  pango_font_description_set_family(FHandle, family);
end;

procedure TPangoFontDescription.SetFamilyStatic(const family: string);
begin
  pango_font_description_set_family_static(FHandle, PAnsiChar(rawbytestring(family)));
end;

procedure TPangoFontDescription.SetGravity(gravity: PangoGravity);
begin
  pango_font_description_set_gravity(FHandle, gravity);
end;

procedure TPangoFontDescription.SetSize(size: Integer);
begin
  pango_font_description_set_size(FHandle, size);
end;

procedure TPangoFontDescription.SetStretch(stretch: PangoStretch);
begin
  pango_font_description_set_stretch(FHandle, stretch);
end;

procedure TPangoFontDescription.SetStyle(style: PangoStyle);
begin
  pango_font_description_set_style(FHandle, style);
end;

procedure TPangoFontDescription.SetVariant(variant: PangoVariant);
begin
  pango_font_description_set_variant(FHandle, variant);
end;

procedure TPangoFontDescription.SetWeight(weight: PangoWeight);
begin
  pango_font_description_set_weight(FHandle, weight);
end;

function TPangoFontDescription.ToFilename: string;
var
  p: PAnsiChar;
begin
  p := pango_font_description_to_filename(FHandle);
  Result := string(p);
  g_free(p);
end;

function TPangoFontDescription.ToString: string;
var
  p: PAnsiChar;
begin
  p := pango_font_description_to_string(FHandle);
  Result := string(p);
  g_free(p);
end;

procedure TPangoFontDescription.UnsetFields(toUnset: PangoFontMask);
begin
  pango_font_description_unset_fields(FHandle, toUnset);
end;

{ TPangoScriptIter }

constructor TPangoScriptIter.Create(const text: string);
begin
  FText := UTF8String(text);
  FPangoScriptIter := pango_script_iter_new(PAnsiChar(FText), -1);
  Assert(FPangoScriptIter <> nil);
end;

destructor TPangoScriptIter.Destroy;
begin
  pango_script_iter_free(FPangoScriptIter);
  inherited;
end;

function TPangoScriptIter.Next: Boolean;
begin
  Result := pango_script_iter_next(FPangoScriptIter);
end;

function TPangoScriptIter.Script: PangoScript;
begin
  pango_script_iter_get_range(FPangoScriptIter, nil, nil, @Result);
end;

function TPangoScriptIter.Text: string;
var
  p1, p2: PAnsiChar;
begin
  pango_script_iter_get_range(FPangoScriptIter, @p1, @p2, nil);
  Result := UTF8ToString(copy(p1, 0, p2-p1));
end;

{ TPangoCoverage }

function TPangoCoverage.Copy: IPangoCoverage;
begin
  Result := TPangoCoverage.CreateInternal(pango_coverage_copy(FPangoCoverage));
end;

constructor TPangoCoverage.Create;
begin
  CreateInternal(pango_coverage_new);
end;

constructor TPangoCoverage.CreateFromBytes(bytes: RawByteString);
begin
  CreateInternal(pango_coverage_from_bytes(PByte(bytes), Length(bytes)));
end;

constructor TPangoCoverage.CreateInternal(Handle: PPangoCoverage);
begin
  Assert(Handle <> nil);
  FPangoCoverage := Handle;
end;

destructor TPangoCoverage.Destroy;
begin
  pango_coverage_unref(FPangoCoverage);
  inherited;
end;

function TPangoCoverage.GetHandle: PPangoCoverage;
begin
  Result := FPangoCoverage;
end;

function TPangoCoverage.GetLevel(index: Integer): PangoCoverageLevel;
begin
  Result := pango_coverage_get(FPangoCoverage, index);
end;

procedure TPangoCoverage.Max(other: IPangoCoverage);
begin
  pango_coverage_max(FPangoCoverage, PangoCoverageHandle(other));
end;

procedure TPangoCoverage.SetLevel(index: Integer; level: PangoCoverageLevel);
begin
  pango_coverage_set(FPangoCoverage, index, level);
end;

function TPangoCoverage.ToBytes: RawByteString;
var
  len: Integer;
  p: PAnsiChar;
begin
  pango_coverage_to_bytes(FPangoCoverage, @p, @len);
  SetLength(Result, len);
  Move(p^, PAnsiChar(Result)^, len);
  g_free(p);
end;

{ TPangoFontMetrics }

constructor TPangoFontMetrics.Create;
begin
  CreateInternal(pango_font_metrics_new);
end;

constructor TPangoFontMetrics.CreateInternal(Handle: PPangoFontMetrics);
begin
  Assert(Handle <> nil);
  FPangoFontMetrics := Handle;
end;

destructor TPangoFontMetrics.Destroy;
begin
  pango_font_metrics_unref(FPangoFontMetrics);
  inherited;
end;

function TPangoFontMetrics.GetApproximateCharWidth: Integer;
begin
  Result := pango_font_metrics_get_approximate_char_width(FPangoFontMetrics);
end;

function TPangoFontMetrics.GetApproximateDigitWidth: Integer;
begin
  Result := pango_font_metrics_get_approximate_digit_width(FPangoFontMetrics);
end;

function TPangoFontMetrics.GetAscent: Integer;
begin
  Result := pango_font_metrics_get_ascent(FPangoFontMetrics);
end;

function TPangoFontMetrics.GetDescent: Integer;
begin
  Result := pango_font_metrics_get_descent(FPangoFontMetrics);
end;

function TPangoFontMetrics.GetStrikethroughPosition: Integer;
begin
  Result := pango_font_metrics_get_strikethrough_position(FPangoFontMetrics);
end;

function TPangoFontMetrics.GetStrikethroughThickness: Integer;
begin
  Result := pango_font_metrics_get_strikethrough_thickness(FPangoFontMetrics);
end;

function TPangoFontMetrics.GetUnderlinePosition: Integer;
begin
  Result := pango_font_metrics_get_underline_position(FPangoFontMetrics);
end;

function TPangoFontMetrics.GetUnderlineThickness: Integer;
begin
  Result := pango_font_metrics_get_underline_thickness(FPangoFontMetrics);
end;

{ TPangoAttrList }

procedure TPangoAttrList.Change(attr: IPangoAttribute);
begin
  attr.ListChange(Self);
end;

function TPangoAttrList.Copy: IPangoAttrList;
begin
  Result := TPangoAttrList.CreateInternal(pango_attr_list_copy(FPangoAttrList));
end;

constructor TPangoAttrList.Create;
begin
  CreateInternal(pango_attr_list_new);
end;

constructor TPangoAttrList.CreateInternal(Handle: PPangoAttrList);
begin
  Assert(Handle <> nil);
  FPangoAttrList := Handle;
end;

destructor TPangoAttrList.Destroy;
begin
  pango_attr_list_unref(FPangoAttrList);
  inherited;
end;

function TPangoAttrList.Filter(func: PangoAttrFilterFunc;
  data: Pointer): IPangoAttrList;
var
  p: PPangoAttrList;
begin
  p := pango_attr_list_filter(FPangoAttrList, func, data);
  if p <> nil then
    Result := TPangoAttrList.CreateInternal(p) else
    Result := nil;
end;

function TPangoAttrList.GetHandle: PPangoAttrList;
begin
  Result := FPangoAttrList;
end;

function TPangoAttrList.GetIterator: IPangoAttrIterator;
begin
  Result := TPangoAttrIterator.CreateInternal(pango_attr_list_get_iterator(FPangoAttrList));
end;

procedure TPangoAttrList.Insert(attr: IPangoAttribute);
begin
  attr.ListInsert(self);
end;

procedure TPangoAttrList.InsertBefore(attr: IPangoAttribute);
begin
  attr.ListInsertBefore(self);
end;

procedure TPangoAttrList.Splice(other: IPangoAttrList; pos, len: Integer);
begin
  pango_attr_list_splice(FPangoAttrList, PangoAttrListHandle(other), pos, len);
end;

{ TPangoAttribute }

function TPangoAttribute.Copy: IPangoAttribute;
begin
  Result := TPangoAttribute.CreateInternal(pango_attribute_copy(FPangoAttribute), true);
end;

constructor TPangoAttribute.CreateBackground(red, green, blue: Word);
begin
  CreateInternal(pango_attr_background_new(red, green, blue), true);
end;

constructor TPangoAttribute.CreateFallback(enableFallback: Boolean);
begin
  CreateInternal(pango_attr_fallback_new(enableFallback), true);
end;

constructor TPangoAttribute.CreateFamily(family: PAnsiChar);
begin
  CreateInternal(pango_attr_family_new(family), true);
end;

constructor TPangoAttribute.CreateFontDesc(desc: IPangoFontDescription);
begin
  CreateInternal(pango_attr_font_desc_new(PangoFontDescriptionHandle(desc)), true);
end;

constructor TPangoAttribute.CreateForeground(red, green, blue: Word);
begin
  CreateInternal(pango_attr_foreground_new(red, green, blue), true);
end;

constructor TPangoAttribute.CreateGravity(gravity: PangoGravity);
begin
  CreateInternal(pango_attr_gravity_new(gravity), true);
end;

constructor TPangoAttribute.CreateGravityHint(hint: PangoGravityHint);
begin
  CreateInternal(pango_attr_gravity_hint_new(hint), true);
end;

constructor TPangoAttribute.CreateInternal(Handle: PPangoAttribute; Owned: Boolean);
begin
  Assert(Handle <> nil);
  FPangoAttribute := Handle;
  FOwned := Owned;
end;

constructor TPangoAttribute.CreateLanguage(language: PPangoLanguage);
begin
  CreateInternal(pango_attr_language_new(language), true);
end;

constructor TPangoAttribute.CreateLetterSpacing(letterSpacing: Integer);
begin
  CreateInternal(pango_attr_letter_spacing_new(letterSpacing), true);
end;

constructor TPangoAttribute.CreateRise(rise: Integer);
begin
  CreateInternal(pango_attr_rise_new(rise), true);
end;

constructor TPangoAttribute.CreateScale(scaleFactor: double);
begin
  CreateInternal(pango_attr_scale_new(scaleFactor), true);
end;

constructor TPangoAttribute.CreateShape(inkRect, logicalRect: PPangoRectangle);
begin
  CreateInternal(pango_attr_shape_new(inkRect, logicalRect), true);
end;

constructor TPangoAttribute.CreateShapeWithData(inkRect,
  logicalRect: PPangoRectangle; data: Pointer; copyFunc: PangoAttrDataCopyFunc;
  destroyFunc: GDestroyNotify);
begin
  CreateInternal(pango_attr_shape_new_with_data(inkRect, logicalRect, data, copyFunc, destroyFunc), true);
end;

constructor TPangoAttribute.CreateSize(size: Integer);
begin
  CreateInternal(pango_attr_size_new(size), true);
end;

constructor TPangoAttribute.CreateSizeAbsolute(size: Integer);
begin
  CreateInternal(pango_attr_size_new_absolute(size), true);
end;

constructor TPangoAttribute.CreateStretch(stretch: PangoStretch);
begin
  CreateInternal(pango_attr_stretch_new(stretch), true);
end;

constructor TPangoAttribute.CreateStrikethrough(strikethrough: Boolean);
begin
  CreateInternal(pango_attr_strikethrough_new(strikethrough), true);
end;

constructor TPangoAttribute.CreateStrikethroughColor(red, green, blue: Word);
begin
  CreateInternal(pango_attr_strikethrough_color_new(red, green, blue), true);
end;

constructor TPangoAttribute.CreateStyle(style: PangoStyle);
begin
  CreateInternal(pango_attr_style_new(style), true);
end;

constructor TPangoAttribute.CreateUnderline(underline: PangoUnderline);
begin
  CreateInternal(pango_attr_underline_new(underline), true);
end;

constructor TPangoAttribute.CreateUnderlineColor(red, green, blue: Word);
begin
  CreateInternal(pango_attr_underline_color_new(red, green, blue), true);
end;

constructor TPangoAttribute.CreateVariant(variant: PangoVariant);
begin
  CreateInternal(pango_attr_variant_new(variant), true);
end;

constructor TPangoAttribute.CreateWeight(weight: PangoWeight);
begin
  CreateInternal(pango_attr_weight_new(weight), true);
end;

destructor TPangoAttribute.Destroy;
begin
  if FOwned then
    pango_attribute_destroy(FPangoAttribute);
  inherited;
end;

function TPangoAttribute.Equal(attr: IPangoAttribute): Boolean;
begin
  Result := pango_attribute_equal(FPangoAttribute, PangoAttributeHandle(attr));
end;

function TPangoAttribute.GetHandle: PPangoAttribute;
begin
  Result := FPangoAttribute;
end;

procedure TPangoAttribute.ListChange(list: IPangoAttrList);
begin
  Assert(FOwned);
  pango_attr_list_change(PangoAttrListHandle(list), FPangoAttribute);
  FOwned := false;
end;

procedure TPangoAttribute.ListInsert(list: IPangoAttrList);
begin
  Assert(FOwned);
  pango_attr_list_insert(PangoAttrListHandle(list), FPangoAttribute);
  FOwned := false;
end;

procedure TPangoAttribute.ListInsertBefore(list: IPangoAttrList);
begin
  Assert(FOwned);
  pango_attr_list_insert_before(PangoAttrListHandle(list), FPangoAttribute);
  FOwned := false;
end;

{ TPangoAttrIterator }

function TPangoAttrIterator.Copy: IPangoAttrIterator;
begin

end;

constructor TPangoAttrIterator.CreateInternal(Handle: PPangoAttrIterator);
begin
  Assert(Handle <> nil);
  FPangoAttrIterator := Handle;
end;

destructor TPangoAttrIterator.Destroy;
begin
  pango_attr_iterator_destroy(FPangoAttrIterator);
  inherited;
end;

function TPangoAttrIterator.Get(type_: PangoAttrType): IPangoAttribute;
var
  p: PPangoAttribute;
begin
  p := pango_attr_iterator_get(FPangoAttrIterator, type_);
  if p <> nil then
    Result := TPangoAttribute.CreateInternal(p, false) else
    Result := nil;
end;

function TPangoAttrIterator.GetAttrs: IInterfaceList;
var
  attrs: PGSList;
begin
  Result := TInterfaceList.Create;
  attrs := pango_attr_iterator_get_attrs(FPangoAttrIterator);
  while attrs <> nil do
  begin
    Result.Add(TPangoAttribute.CreateInternal(attrs.data, false));
    attrs := attrs.next;
  end;
end;

procedure TPangoAttrIterator.GetFont(desc: IPangoFontDescription;
  language: PPPangoLanguage; extraAttrs: PPGSList);
begin
  pango_attr_iterator_get_font(FPangoAttrIterator, PangoFontDescriptionHandle(desc), language, extraAttrs);
end;

function TPangoAttrIterator.GetHandle: PPangoAttrIterator;
begin
  Result := FPangoAttrIterator;
end;

function TPangoAttrIterator.Next: Boolean;
begin
  Result := pango_attr_iterator_next(FPangoAttrIterator);
end;

procedure TPangoAttrIterator.Range(start, end_: PInteger);
begin
  pango_attr_iterator_range(FPangoAttrIterator, start, end_);
end;

{ TPangoItem }

function TPangoItem.Copy: IPangoItem;
begin
  TPangoItem.CreateInternal(pango_item_copy(FPangoItem), true);
end;

constructor TPangoItem.Create;
begin
  CreateInternal(pango_item_new, true);
end;

constructor TPangoItem.CreateInternal(Handle: PPangoItem; Owned: Boolean);
begin
  Assert(Handle <> nil);
  FPangoItem := Handle;
  FOwned := Owned;
end;

destructor TPangoItem.Destroy;
begin
  if FOwned then
    pango_item_free(FPangoItem);
  inherited;
end;

function TPangoItem.Split(splitIndex, splitOffset: Integer): IPangoItem;
begin
  Result := TPangoItem.CreateInternal(pango_item_split(FPangoItem, splitIndex, splitOffset), true);
end;

{ TPangoGlyphString }

function TPangoGlyphString.Copy: IPangoGlyphString;
begin

end;

constructor TPangoGlyphString.Create;
begin
  CreateInternal(pango_glyph_string_new);
end;

constructor TPangoGlyphString.CreateInternal(Handle: PPangoGlyphString);
begin
  Assert(Handle <> nil);
  FPangoGlyphString := Handle;
end;

destructor TPangoGlyphString.Destroy;
begin
  pango_glyph_string_free(FPangoGlyphString);
  inherited;
end;

procedure TPangoGlyphString.Extents(font: IPangoFont; inkRect,
  logicalRect: PPangoRectangle);
begin
  pango_glyph_string_extents(FPangoGlyphString, GObjectHandle(font), inkRect, logicalRect);
end;

procedure TPangoGlyphString.ExtentsRange(start, end_: Integer;
  font: IPangoFont; inkRect, logicalRect: PPangoRectangle);
begin
  pango_glyph_string_extents_range(FPangoGlyphString, start, end_, GObjectHandle(font), inkRect, logicalRect);
end;

function TPangoGlyphString.GetHandle: PPangoGlyphString;
begin
  Result := FPangoGlyphString;
end;

procedure TPangoGlyphString.GetLogicalWidths(text: PAnsiChar; length,
  embeddingLevel: Integer; logicalWidths: PInteger);
begin
  pango_glyph_string_get_logical_widths(FPangoGlyphString, text, length, embeddingLevel, logicalWidths);
end;

function TPangoGlyphString.GetWidth: Integer;
begin
  Result := pango_glyph_string_get_width(FPangoGlyphString);
end;

procedure TPangoGlyphString.IndexToX(text: PAnsiChar; length: Integer;
  analysis: PPangoAnalysis; index: Integer; trailing: Boolean; xPos: PInteger);
begin
  pango_glyph_string_index_to_x(FPangoGlyphString, text, length, analysis, index, trailing, xPos);
end;

procedure TPangoGlyphString.SetSize(newLen: Integer);
begin

end;

procedure TPangoGlyphString.XToIndex(text: PAnsiChar; length: Integer;
  analysis: PPangoAnalysis; xPos: Integer; index, trailing: PInteger);
begin
  pango_glyph_string_x_to_index(FPangoGlyphString, text, length, analysis, xPos, index, trailing);
end;

{ TPangoTabArray }

function TPangoTabArray.Copy: IPangoTabArray;
begin
  Result := TPangoTabArray.CreateInternal(pango_tab_array_copy(FPangoTabArray), true);
end;

constructor TPangoTabArray.Create(initialSize: Integer; positionsInPixels: boolean);
begin
  CreateInternal(pango_tab_array_new(initialSize, positionsInPixels), true);
end;

constructor TPangoTabArray.CreateInternal(Handle: PPangoTabArray;
  Owned: Boolean);
begin
  Assert(Handle <> nil);
  FPangoTabArray := Handle;
  FOwned := Owned;
end;

constructor TPangoTabArray.CreateWithPositions(size: Integer;
  positionsInPixels: Boolean; firstAlignment: PangoTabAlign;
  firstPosition: Integer);
begin
  CreateInternal(pango_tab_array_new_with_positions(size, positionsInPixels, firstAlignment, firstPosition), true);
end;

destructor TPangoTabArray.Destroy;
begin
  if FOwned then
    pango_tab_array_free(FPangoTabArray);
  inherited;
end;

function TPangoTabArray.GetHandle: PPangoTabArray;
begin
  Result := FPangoTabArray;
end;

function TPangoTabArray.GetPositionsInPixels: Boolean;
begin
  Result := pango_tab_array_get_positions_in_pixels(FPangoTabArray);
end;

function TPangoTabArray.GetSize: Integer;
begin
  Result := pango_tab_array_get_size(FPangoTabArray);
end;

procedure TPangoTabArray.GetTab(tabIndex: Integer; alignment: PPangoTabAlign;
  location: PInteger);
begin
  pango_tab_array_get_tab(FPangoTabArray, tabIndex, alignment, location);
end;

procedure TPangoTabArray.GetTabs(var alignments: PPangoTabAlign;
  var locations: PInteger);
begin
  pango_tab_array_get_tabs(FPangoTabArray, alignments, locations);
end;

procedure TPangoTabArray.Resize(newSize: Integer);
begin
  pango_tab_array_resize(FPangoTabArray, newSize);
end;

procedure TPangoTabArray.SetTab(tabIndex: Integer; alignment: PangoTabAlign;
  location: Integer);
begin
  pango_tab_array_set_tab(FPangoTabArray, tabIndex, alignment, location);
end;

{ TPangoGlyphItem }

function TPangoGlyphItem.ApplyAttrs(text: PAnsiChar;
  list: IPangoAttrList): IInterfaceList;
begin
  pango_glyph_item_apply_attrs(FPangoGlyphItem, text, PangoAttrListHandle(list));
end;

function TPangoGlyphItem.Copy: IPangoGlyphItem;
begin
  Result := TPangoGlyphItem.CreateInternal(pango_glyph_item_copy(FPangoGlyphItem), true);
end;

constructor TPangoGlyphItem.CreateInternal(Handle: PPangoGlyphItem;
  Owned: Boolean);
begin
  Assert(Handle <> nil);
  FPangoGlyphItem := Handle;
  FOwned := Owned;
end;

destructor TPangoGlyphItem.Destroy;
begin
  if FOwned then
    pango_glyph_item_free(FPangoGlyphItem);
  inherited;
end;

function TPangoGlyphItem.GetHandle: PPangoGlyphItem;
begin
  Result := FPangoGlyphItem;
end;

procedure TPangoGlyphItem.LetterSpace(text: PAnsiChar; logAttrs: PPangoLogAttr;
  letterSpacing: Integer);
begin
  pango_glyph_item_letter_space(FPangoGlyphItem, text, logAttrs, letterSpacing);
end;

function TPangoGlyphItem.Split(text: PAnsiChar;
  splitIndex: Integer): IPangoGlyphItem;
begin
  Result := TPangoGlyphItem.CreateInternal(pango_glyph_item_split(FPangoGlyphItem, text, splitIndex), true);
end;


{ TPangoLayoutLine }

constructor TPangoLayoutLine.CreateInternal(Handle: PPangoLayoutLine);
begin
  Assert(Handle <> nil);
  FPangoLayoutLine := Handle;
end;

destructor TPangoLayoutLine.Destroy;
begin
  pango_layout_line_unref(FPangoLayoutLine);
  inherited;
end;

procedure TPangoLayoutLine.GetExtents(inkRect, logicalRect: PPangoRectangle);
begin
  pango_layout_line_get_extents(FPangoLayoutLine, inkRect, logicalRect);
end;

function TPangoLayoutLine.GetHandle: PPangoLayoutLine;
begin
  Result := FPangoLayoutLine;
end;

procedure TPangoLayoutLine.GetPixelExtents(inkRect,
  logicalRect: PPangoRectangle);
begin
  pango_layout_line_get_pixel_extents(FPangoLayoutLine, inkRect, logicalRect);
end;

procedure TPangoLayoutLine.GetXRanges(startIndex, endIndex: Integer;
  var ranges: PInteger; nRanges: PInteger);
begin
  pango_layout_line_get_x_ranges(FPangoLayoutLine, startIndex, endIndex, ranges, nRanges);
end;

procedure TPangoLayoutLine.IndexToX(index: Integer; trailing: Boolean;
  xPos: PInteger);
begin
  pango_layout_line_index_to_x(FPangoLayoutLine, index, trailing, xPos);
end;

function TPangoLayoutLine.XToIndex(xPos: Integer; index,
  trailing: PInteger): Boolean;
begin
  Result := pango_layout_line_x_to_index(FPangoLayoutLine, xPos, index, trailing)
end;

{ TPangoLayoutIter }

function TPangoLayoutIter.AtLastLine: Boolean;
begin
  Result := pango_layout_iter_at_last_line(FPangoLayoutIter)
end;

function TPangoLayoutIter.Copy: IPangoLayoutIter;
begin
  Result := TPangoLayoutIter.CreateInternale(pango_layout_iter_copy(FPangoLayoutIter));
end;

constructor TPangoLayoutIter.Create(layout: IPangoLayout);
begin
  CreateInternale(pango_layout_get_iter(GObjectHandle(layout)));
end;

constructor TPangoLayoutIter.CreateInternale(Handle: PPangoLayoutIter);
begin
  Assert(Handle <> nil);
  FPangoLayoutIter := Handle;
end;

destructor TPangoLayoutIter.Destroy;
begin
  pango_layout_iter_free(FPangoLayoutIter);
  inherited;
end;

function TPangoLayoutIter.GetBaseline: Integer;
begin
  Result := pango_layout_iter_get_baseline(FPangoLayoutIter)
end;

procedure TPangoLayoutIter.GetCharExtents(logicalRect: PPangoRectangle);
begin
  pango_layout_iter_get_char_extents(FPangoLayoutIter, logicalRect)
end;

procedure TPangoLayoutIter.GetClusterExtents(inkRect,
  logicalRect: PPangoRectangle);
begin
  pango_layout_iter_get_cluster_extents(FPangoLayoutIter, inkRect, logicalRect);
end;

function TPangoLayoutIter.GetIndex: Integer;
begin
  Result := pango_layout_iter_get_index(FPangoLayoutIter);
end;

function TPangoLayoutIter.GetLayout: IPangoLayout;
begin
  Result := TPangoLayout.CreateInternal(pango_layout_iter_get_layout(g_object_ref(FPangoLayoutIter)));
end;

procedure TPangoLayoutIter.GetLayoutExtents(inkRect,
  logicalRect: PPangoRectangle);
begin
  pango_layout_iter_get_layout_extents(FPangoLayoutIter, inkRect, logicalRect);
end;

function TPangoLayoutIter.GetLine: IPangoLayoutLine;
begin
  Result := TPangoLayoutLine.CreateInternal(pango_layout_line_ref(pango_layout_iter_get_line(FPangoLayoutIter)));
end;

procedure TPangoLayoutIter.GetLineExtents(inkRect,
  logicalRect: PPangoRectangle);
begin
  pango_layout_iter_get_line_extents(FPangoLayoutIter, inkRect, logicalRect);
end;

function TPangoLayoutIter.GetLineReadonly: IPangoLayoutLine;
begin
  Result := TPangoLayoutLine.CreateInternal(pango_layout_line_ref(pango_layout_iter_get_line_readonly(FPangoLayoutIter)));
end;

procedure TPangoLayoutIter.GetLineYrange(y0, y1: PInteger);
begin
  pango_layout_iter_get_line_yrange(FPangoLayoutIter, y0, y1);
end;

function TPangoLayoutIter.GetRun: IPangoLayoutRun;
var
  p: PPangoGlyphItem;
begin
  p := PPangoGlyphItem(pango_layout_iter_get_run(FPangoLayoutIter));
  if p <> nil then
    Result := TPangoGlyphItem.CreateInternal(p, false) else
    Result := nil;
end;

procedure TPangoLayoutIter.GetRunExtents(inkRect, logicalRect: PPangoRectangle);
begin
  pango_layout_iter_get_run_extents(FPangoLayoutIter, inkRect, logicalRect);
end;

function TPangoLayoutIter.GetRunReadonly: IPangoLayoutRun;
var
  p: PPangoGlyphItem;
begin
  p := PPangoGlyphItem(pango_layout_iter_get_run_readonly(FPangoLayoutIter));
  if p <> nil then
    Result := TPangoGlyphItem.CreateInternal(p, false) else
    Result := nil;
end;

function TPangoLayoutIter.NextChar: Boolean;
begin
  Result := pango_layout_iter_next_char(FPangoLayoutIter);
end;

function TPangoLayoutIter.NextCluster: Boolean;
begin
  Result := pango_layout_iter_next_cluster(FPangoLayoutIter);
end;

function TPangoLayoutIter.NextLine: Boolean;
begin
  Result := pango_layout_iter_next_line(FPangoLayoutIter);
end;

function TPangoLayoutIter.NextRun: Boolean;
begin
  Result := pango_layout_iter_next_run(FPangoLayoutIter)
end;

end.
