
module sdl3;

// Types
alias PenID = int;

// Bitstructs
bitstruct PenInputFlags : uint {
  bool down    : 0;
  bool button1 : 1;
  bool button2 : 2;
  bool button3 : 3;
  bool button4 : 4;
  bool button5 : 5;
  bool eraserTip   : 30;
  bool inProximity : 31;
}

// Enums
enum PenAxis {
  PRESSURE,  /**< Pen pressure.  Unidirectional: 0 to 1.0 */
  XTILT,     /**< Pen horizontal tilt angle.  Bidirectional: -90.0 to 90.0 (left-to-right). */
  YTILT,     /**< Pen vertical tilt angle.  Bidirectional: -90.0 to 90.0 (top-to-down). */
  DISTANCE,  /**< Pen distance to drawing surface.  Unidirectional: 0.0 to 1.0 */
  ROTATION,  /**< Pen barrel rotation.  Bidirectional: -180 to 179.9 (clockwise, 0 is facing up, -180.0 is facing down). */
  SLIDER,    /**< Pen finger wheel or slider (e.g., Airbrush Pen).  Unidirectional: 0 to 1.0 */
  TANGENTIAL_PRESSURE,    /**< Pressure from squeezing the pen ("barrel pressure"). */
  COUNT,      /**< Total known pen axis types in this version of SDL. This number may grow in future releases! */
}
enum PenDeviceType : const CInt {
  INVALID  = -1, /**< Not a valid pen device. */
  UNKNOWN  =  0, /**< Don't know specifics of this pen. */
  DIRECT   =  1, /**< Pen touches display. */
  INDIRECT =  2, /**< Pen touches something that isn't the display. */
}

// Functions
extern fn PenDeviceType getPenDeviceType(PenID instance_id) @extern("SDL_GetPenDeviceType");

