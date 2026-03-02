
module sdl3;

// Enums
enum PowerState : const CInt {
  ERROR      = -1,   /**< error determining power status */
  UNKNOWN    =  0,   /**< cannot determine power status */
  ON_BATTERY =  1,   /**< Not plugged in, running on the battery */
  NO_BATTERY =  2,   /**< Plugged in, no battery available */
  CHARGING   =  3,   /**< Plugged in, charging battery */
  CHARGED    =  4,   /**< Plugged in, battery charged */
}

// Functions
extern fn PowerState getPowerInfo(int* seconds, int* percent) @extern("SDL_GetPowerInfo");

