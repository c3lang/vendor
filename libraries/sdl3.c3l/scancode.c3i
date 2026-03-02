
module sdl3;

// Enums
enum Scancode : const CInt {
  UNKNOWN = 0,

  A = 4,
  B = 5,
  C = 6,
  D = 7,
  E = 8,
  F = 9,
  G = 10,
  H = 11,
  I = 12,
  J = 13,
  K = 14,
  L = 15,
  M = 16,
  N = 17,
  O = 18,
  P = 19,
  Q = 20,
  R = 21,
  S = 22,
  T = 23,
  U = 24,
  V = 25,
  W = 26,
  X = 27,
  Y = 28,
  Z = 29,

  CODE_1 = 30,
  CODE_2 = 31,
  CODE_3 = 32,
  CODE_4 = 33,
  CODE_5 = 34,
  CODE_6 = 35,
  CODE_7 = 36,
  CODE_8 = 37,
  CODE_9 = 38,
  CODE_0 = 39,

  RETURN = 40,
  ESCAPE = 41,
  BACKSPACE = 42,
  TAB = 43,
  SPACE = 44,

  MINUS = 45,
  EQUALS = 46,
  LEFTBRACKET = 47,
  RIGHTBRACKET = 48,
  BACKSLASH = 49,

  NONUSHASH = 50,
  SEMICOLON = 51,
  APOSTROPHE = 52,
  GRAVE = 53,
  COMMA = 54,
  PERIOD = 55,
  SLASH = 56,

  CAPSLOCK = 57,

  F1 = 58,
  F2 = 59,
  F3 = 60,
  F4 = 61,
  F5 = 62,
  F6 = 63,
  F7 = 64,
  F8 = 65,
  F9 = 66,
  F10 = 67,
  F11 = 68,
  F12 = 69,

  PRINTSCREEN = 70,
  SCROLLLOCK = 71,
  PAUSE = 72,
  INSERT = 73,
  HOME = 74,
  PAGEUP = 75,
  DELETE = 76,
  END = 77,
  PAGEDOWN = 78,
  RIGHT = 79,
  LEFT = 80,
  DOWN = 81,
  UP = 82,

  NUMLOCKCLEAR = 83,
  KP_DIVIDE = 84,
  KP_MULTIPLY = 85,
  KP_MINUS = 86,
  KP_PLUS = 87,
  KP_ENTER = 88,
  KP_1 = 89,
  KP_2 = 90,
  KP_3 = 91,
  KP_4 = 92,
  KP_5 = 93,
  KP_6 = 94,
  KP_7 = 95,
  KP_8 = 96,
  KP_9 = 97,
  KP_0 = 98,
  KP_PERIOD = 99,

  NONUSBACKSLASH = 100,
  APPLICATION = 101,
  POWER = 102,
  KP_EQUALS = 103,
  F13 = 104,
  F14 = 105,
  F15 = 106,
  F16 = 107,
  F17 = 108,
  F18 = 109,
  F19 = 110,
  F20 = 111,
  F21 = 112,
  F22 = 113,
  F23 = 114,
  F24 = 115,
  EXECUTE = 116,
  HELP = 117,
  MENU = 118,
  SELECT = 119,
  STOP = 120,
  AGAIN = 121,
  UNDO = 122,
  CUT = 123,
  COPY = 124,
  PASTE = 125,
  FIND = 126,
  MUTE = 127,
  VOLUMEUP = 128,
  VOLUMEDOWN = 129,
  /* not sure whether there's a reason to enable these */
  /*     LOCKINGCAPSLOCK = 130,  */
  /*     LOCKINGNUMLOCK = 131, */
  /*     LOCKINGSCROLLLOCK = 132, */
  KP_COMMA = 133,
  KP_EQUALSAS400 = 134,

  INTERNATIONAL1 = 135,
  INTERNATIONAL2 = 136,
  INTERNATIONAL3 = 137,
  INTERNATIONAL4 = 138,
  INTERNATIONAL5 = 139,
  INTERNATIONAL6 = 140,
  INTERNATIONAL7 = 141,
  INTERNATIONAL8 = 142,
  INTERNATIONAL9 = 143,
  LANG1 = 144, /**< Hangul/English toggle */
  LANG2 = 145, /**< Hanja conversion */
  LANG3 = 146, /**< Katakana */
  LANG4 = 147, /**< Hiragana */
  LANG5 = 148, /**< Zenkaku/Hankaku */
  LANG6 = 149, /**< reserved */
  LANG7 = 150, /**< reserved */
  LANG8 = 151, /**< reserved */
  LANG9 = 152, /**< reserved */

  ALTERASE = 153,
  SYSREQ = 154,
  CANCEL = 155,
  CLEAR = 156,
  PRIOR = 157,
  RETURN2 = 158,
  SEPARATOR = 159,
  OUT = 160,
  OPER = 161,
  CLEARAGAIN = 162,
  CRSEL = 163,
  EXSEL = 164,

  KP_00 = 176,
  KP_000 = 177,
  THOUSANDSSEPARATOR = 178,
  DECIMALSEPARATOR = 179,
  CURRENCYUNIT = 180,
  CURRENCYSUBUNIT = 181,
  KP_LEFTPAREN = 182,
  KP_RIGHTPAREN = 183,
  KP_LEFTBRACE = 184,
  KP_RIGHTBRACE = 185,
  KP_TAB = 186,
  KP_BACKSPACE = 187,
  KP_A = 188,
  KP_B = 189,
  KP_C = 190,
  KP_D = 191,
  KP_E = 192,
  KP_F = 193,
  KP_XOR = 194,
  KP_POWER = 195,
  KP_PERCENT = 196,
  KP_LESS = 197,
  KP_GREATER = 198,
  KP_AMPERSAND = 199,
  KP_DBLAMPERSAND = 200,
  KP_VERTICALBAR = 201,
  KP_DBLVERTICALBAR = 202,
  KP_COLON = 203,
  KP_HASH = 204,
  KP_SPACE = 205,
  KP_AT = 206,
  KP_EXCLAM = 207,
  KP_MEMSTORE = 208,
  KP_MEMRECALL = 209,
  KP_MEMCLEAR = 210,
  KP_MEMADD = 211,
  KP_MEMSUBTRACT = 212,
  KP_MEMMULTIPLY = 213,
  KP_MEMDIVIDE = 214,
  KP_PLUSMINUS = 215,
  KP_CLEAR = 216,
  KP_CLEARENTRY = 217,
  KP_BINARY = 218,
  KP_OCTAL = 219,
  KP_DECIMAL = 220,
  KP_HEXADECIMAL = 221,

  LCTRL = 224,
  LSHIFT = 225,
  LALT = 226,
  LGUI = 227,
  RCTRL = 228,
  RSHIFT = 229,
  RALT = 230,
  RGUI = 231,

  MODE = 257,

    /* @} *//* Usage page 0x07 */
    /**
     *  \name Usage page 0x0C
     *
     *  These values are mapped from usage page 0x0C (USB consumer page).
     *
     *  There are way more keys in the spec than we can represent in the
     *  current scancode range, so pick the ones that commonly come up in
     *  real world usage.
     */
    /* @{ */

  SLEEP = 258,                   /**< Sleep */
  WAKE = 259,                    /**< Wake */

  CHANNEL_INCREMENT = 260,       /**< Channel Increment */
  CHANNEL_DECREMENT = 261,       /**< Channel Decrement */

  MEDIA_PLAY = 262,          /**< Play */
  MEDIA_PAUSE = 263,         /**< Pause */
  MEDIA_RECORD = 264,        /**< Record */
  MEDIA_FAST_FORWARD = 265,  /**< Fast Forward */
  MEDIA_REWIND = 266,        /**< Rewind */
  MEDIA_NEXT_TRACK = 267,    /**< Next Track */
  MEDIA_PREVIOUS_TRACK = 268, /**< Previous Track */
  MEDIA_STOP = 269,          /**< Stop */
  MEDIA_EJECT = 270,         /**< Eject */
  MEDIA_PLAY_PAUSE = 271,    /**< Play / Pause */
  MEDIA_SELECT = 272,        /* Media Select */

  AC_NEW = 273,              /**< AC New */
  AC_OPEN = 274,             /**< AC Open */
  AC_CLOSE = 275,            /**< AC Close */
  AC_EXIT = 276,             /**< AC Exit */
  AC_SAVE = 277,             /**< AC Save */
  AC_PRINT = 278,            /**< AC Print */
  AC_PROPERTIES = 279,       /**< AC Properties */

  AC_SEARCH = 280,           /**< AC Search */
  AC_HOME = 281,             /**< AC Home */
  AC_BACK = 282,             /**< AC Back */
  AC_FORWARD = 283,          /**< AC Forward */
  AC_STOP = 284,             /**< AC Stop */
  AC_REFRESH = 285,          /**< AC Refresh */
  AC_BOOKMARKS = 286,        /**< AC Bookmarks */

    /* @} *//* Usage page 0x0C */
    /**
     *  \name Mobile keys
     *
     *  These are values that are often used on mobile phones.
     */
    /* @{ */
  SOFTLEFT = 287,
  SOFTRIGHT = 288,
  CALL = 289, /**< Used for accepting phone calls. */
  ENDCALL = 290, /**< Used for rejecting phone calls. */

    /* @} *//* Mobile keys */

    /* Add any other keys here. */

  RESERVED = 400,    /**< 400-500 reserved for dynamic keycodes */

  COUNT = 512 /**< not a key, just marks the number of scancodes for array bounds */
}

