unit pangowin32;

interface
uses windows, glib, pangowin32lib, pango;

type
  IPangoWin32FontCache = interface
    ['{2F9C4B95-B405-4625-A5D8-9D542DDB9001}']
    function  Load(logfont: PLOGFONTA): HFONT;
    function  Loadw(logfont: PLOGFONTW): HFONT;
    procedure Unload(hfont: HFONT);
  end;

  IPangoWin32FontMap = interface(IPangoFontMap)
    ['{581D7944-BF2F-4767-811E-527024BBC284}']
    function GetFontCache: IPangoWin32FontCache;
  end;


  TPangoWin32FontMap = class(TPangoFontMap, IPangoWin32FontMap)
  protected
    function GetFontCache: IPangoWin32FontCache;
  public
    constructor Create; virtual;
  end;

  TPangoWin32FontCache = class(TInterfacedObject, IPangoWin32FontCache)
  private
    FPangoWin32FontCache: PPangoWin32FontCache;
    FOwned: Boolean;
    constructor CreateInternal(Handle: PPangoWin32FontCache; Owned: Boolean);
  protected
    function Load(logfont: PLOGFONTA): HFONT;
    function Loadw(logfont: PLOGFONTW): HFONT;
    procedure Unload(hfont: HFONT);
  public
    constructor Create; virtual;
    destructor Destroy; override;
  end;

implementation

{ TPangoWin32FontCache }

constructor TPangoWin32FontCache.Create;
begin
  CreateInternal(pango_win32_font_cache_new, true);
end;

constructor TPangoWin32FontCache.CreateInternal(Handle: PPangoWin32FontCache; Owned: Boolean);
begin
  Assert(Handle <> nil);
  FPangoWin32FontCache := Handle;
  FOwned := Owned;
end;

destructor TPangoWin32FontCache.Destroy;
begin
  pango_win32_font_cache_free(FPangoWin32FontCache);
  inherited;
end;

function TPangoWin32FontCache.Load(logfont: PLOGFONTA): HFONT;
begin
  Result := pango_win32_font_cache_load(FPangoWin32FontCache, logfont);
end;

function TPangoWin32FontCache.Loadw(logfont: PLOGFONTW): HFONT;
begin
  Result := pango_win32_font_cache_loadw(FPangoWin32FontCache, logfont);
end;

procedure TPangoWin32FontCache.Unload(hfont: HFONT);
begin
    pango_win32_font_cache_unload(FPangoWin32FontCache, hfont);
end;

{ TPangoWin32FontMap }

constructor TPangoWin32FontMap.Create;
begin
  CreateInternal(g_object_ref(pango_win32_font_map_for_display));
end;

function TPangoWin32FontMap.GetFontCache: IPangoWin32FontCache;
begin
  TPangoWin32FontCache.CreateInternal(g_object_ref(pango_win32_font_map_get_font_cache(GetHandle)), false);
end;

end.