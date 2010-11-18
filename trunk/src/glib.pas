unit glib;

{$IFDEF FPC}
  {$MODE OBJFPC}{$H+}
  {$PACKRECORDS C}
{$ELSE}
  {$ALIGN ON}
  {$MINENUMSIZE 4}
{$ENDIF}

// cette interface est TEMPORAIRE !!

interface

type
  PGType = ^GType;
  GType = Cardinal;

  Pgunichar = PWideChar;
  gunichar = WideChar;

  Pgchar = PAnsiChar;
  gchar = AnsiChar;

  Pgint = PInteger;
  gint = Integer;

  Pguint = PCardinal;
  guint = Cardinal;

  Pglong = PInteger;
  glong = Integer;

  Pgulong = PCardinal;
  gulong = Cardinal;

  Pguint32 = PCardinal;
  guint32 = Cardinal;

  Pgint64 = PInt64;
  gint64 = Int64;

  Pguint64 = PUInt64;
  guint64 = UInt64;

  Pgfloat = PSingle;
  gfloat = Single;

  Pgdouble = PDouble;
  gdouble = Double;

  Pgpointer = PPointer;
  gpointer = Pointer;

  Pgboolean = ^gboolean;
  gboolean = LongBool;

  Pgsize = ^gsize;
  gsize = Cardinal;

  Pguint8 = ^guint8;
  guint8 = Byte;

  Pgconstpointer = ^gconstpointer;
  gconstpointer = Pointer;

  Pgushort = ^gushort;
  gushort = Word;

  TPAnsiCharArray = array[0..high(integer) div sizeof(PAnsiChar) - 1] of PAnsiChar;
  PPAnsiCharArray = ^TPAnsiCharArray;


  PPGSList = ^PGSList;
  PGSList = ^GSList;
  GSList = record
    data: Pointer;
    next: PGSList;
  end;

  PGlist = ^GList;
  GList = record
    data: Pointer;
    next: PGList;
    prev: PGList;
  end;

  PGTypeClass = ^GTypeClass;
  _GTypeClass = record
    (*< private >*)
    g_type: GType;
  end;
  GTypeClass = _GTypeClass;

  PGTypeInstance = ^GTypeInstance;
  _GTypeInstance = record
    (*< private >*)
    g_class: PGTypeClass;
  end;
  GTypeInstance = _GTypeInstance;

  PGData = ^GData;
  _GData = record end;
  GData = _GData;

  PGObject = ^GObject;
  _GObject = record
    g_type_instance: GTypeInstance;
    (*< private >*)
    ref_count: Cardinal;
    qdata: PGData;
  end;
  GObject = _GObject;

  GParamFlags = (
    G_PARAM_READABLE            = 1 shl 0,
    G_PARAM_WRITABLE            = 1 shl 1,
    G_PARAM_CONSTRUCT	          = 1 shl 2,
    G_PARAM_CONSTRUCT_ONLY      = 1 shl 3,
    G_PARAM_LAX_VALIDATION      = 1 shl 4,
    G_PARAM_STATIC_NAME	        = 1 shl 5,
  //#ifndef G_DISABLE_DEPRECATED
    G_PARAM_PRIVATE	      = G_PARAM_STATIC_NAME,
  //#endif
    G_PARAM_STATIC_NICK	        = 1 shl 6,
    G_PARAM_STATIC_BLURB	      = 1 shl 7
  );

  PPGParamSpec = ^PGParamSpec;
  PGParamSpec = ^GParamSpec;
  _GParamSpec = record
    g_type_instance: GTypeInstance;
    name: PAnsiChar;
    flags: GParamFlags;
    value_type: GType;
    owner_type: GType; (* class or interface using this property *)

    (*< private >*)
    _nick: PAnsiChar;
    _blurb: PAnsiChar;
    qdata: PGData;
    ref_count: Cardinal;
    param_id: Cardinal;	(* sort-criteria *)
  end;
  GParamSpec = _GParamSpec;

  PGValue = ^GValue;
  _GValue = record
    (*< private >*)
    g_type: GType;
    (* public for GTypeValueTable methods *)
    data: array[0..1] of record
    case byte of
      0: (v_int: gint);
      1: (v_uint: guint);
      2: (v_long: glong);
      3: (v_ulong: gulong);
      4: (v_int64: gint64);
      5: (v_uint64: guint64);
      6: (v_float: gfloat);
      7: (v_double: gdouble);
      8: (v_pointer: gpointer);
    end;
  end;
  GValue = _GValue;

  PGObjectConstructParam = ^GObjectConstructParam;
  _GObjectConstructParam = record
    pspec: PGParamSpec;
    value: PGValue;
  end;
  GObjectConstructParam = _GObjectConstructParam;

  PGObjectClass = ^GObjectClass;
  _GObjectClass = record
    g_type_class: GTypeClass;

    (*< private >*)
    construct_properties: PGSList;

    (*< public >*)
    (* seldomly overidden *)
    constructor_: function(type_: GType; n_construct_properties: Cardinal; construct_properties: PGObjectConstructParam): PGObject; cdecl;
    (* overridable methods *)
    set_property: procedure(obj: PGObject; property_id: Cardinal; const value: PGValue; pspec: PGParamSpec); cdecl;
    get_property: procedure(obj: PGObject; property_id: guint; value: PGValue; pspec: PGParamSpec); cdecl;
    dispose: procedure(obj: PGObject); cdecl;
    finalize: procedure(obj: PGObject); cdecl;
    (* seldomly overidden *)
    dispatch_properties_changed: procedure(obj: PGObject; n_pspecs: guint; pspecs: PPGParamSpec); cdecl;
    (* signals *)
    notify: procedure(obj: PGObject; pspec: PGParamSpec); cdecl;

    (* called when done constructing *)
    constructed: procedure(obj: PGObject); cdecl;

    (*< private >*)
    (* padding *)
    pdummy: array[0..6] of gpointer;
  end;
  GObjectClass = _GObjectClass;

  PGTypeModule = ^GTypeModule;
  _GTypeModule = record
    parent_instance: GObject;
    use_count: guint;
    type_infos: PGSList;
    interface_infos: PGSList;
    (*< public >*)
    name: PAnsiChar;
  end;
  GTypeModule = _GTypeModule;

  PGString = ^GString;
  _GString = record
    str: PAnsiChar;
    len: gsize;
    allocated_len: gsize;
  end;
  GString = _GString;

 // GTypeDebugFlags = (
const
  G_TYPE_DEBUG_NONE	= 0;
  G_TYPE_DEBUG_OBJECTS	= 1 shl 0;
  G_TYPE_DEBUG_SIGNALS	= 1 shl 1;
  G_TYPE_DEBUG_MASK	= $03;
 // );

  procedure g_object_unref(obj: Pointer); cdecl;
  function g_object_ref(obj: Pointer): Pointer; cdecl;
  function g_object_new(object_type: GType; const first_property_name: PAnsiChar): Pointer; varargs; cdecl;
  procedure g_type_init; cdecl;
  procedure g_type_init_with_debug_flags(debug_flags: Integer); cdecl;
  procedure g_free(mem: Pointer); cdecl;
  procedure g_list_free(list: PGList); cdecl;

type
  IGObject = interface
    ['{01E9588C-7ED5-4173-99A3-D59F6EE24B73}']
    function GetHandle: Pointer;
    property Handle: Pointer read GetHandle;
  end;

  TGObject = class(TInterfacedObject, IGObject)
  private
    FHandle: Pointer;
  protected
    function GetHandle: Pointer;
  public
    constructor CreateInternal(Handle: Pointer); virtual;
    destructor Destroy; override;
  end;

  function GObjectHandle(const o: IGObject): Pointer; inline;
implementation
const
  GOBJECT_LIB = 'libgobject-2.0-0.dll';
  GLIB_LIB = 'libglib-2.0-0.dll';

  procedure g_object_unref(obj: Pointer); cdecl; external GOBJECT_LIB;
  function g_object_ref(obj: Pointer): Pointer; cdecl; external GOBJECT_LIB;
  procedure g_free(mem: Pointer); cdecl; external GLIB_LIB;
  function g_object_new(object_type: GType; const first_property_name: PAnsiChar): Pointer; varargs; cdecl; external GOBJECT_LIB;
  procedure g_type_init; cdecl; external GOBJECT_LIB;
  procedure g_type_init_with_debug_flags(debug_flags: Integer); cdecl; external GOBJECT_LIB;
   procedure g_list_free(list: PGList); cdecl; external GLIB_LIB;

  function GObjectHandle(const o: IGObject): Pointer; inline;
  begin
    if o <> nil then result := o.Handle else result := nil;
  end;

  { TGObject }

  constructor TGObject.CreateInternal(Handle: Pointer);
  begin
    Assert(Handle <> nil);
    FHandle := Handle;
  end;

  destructor TGObject.Destroy;
  begin
    g_object_unref(FHandle);
    inherited;
  end;

  function TGObject.GetHandle: Pointer;
  begin
    Result := FHandle;
  end;

initialization
  //g_type_init;
{$IFDEF DEBUG}
  g_type_init_with_debug_flags(G_TYPE_DEBUG_OBJECTS or G_TYPE_DEBUG_SIGNALS);
{$ELSE}
  g_type_init;
{$ENDIF}

end.