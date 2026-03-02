
module sdl3;

// Types
alias Haptic = void;
alias HapticDirectionType = char;
alias HapticEffectID = int;
alias HapticEffectType = ushort;
alias HapticID = uint;

// Structs
struct HapticCondition {
  /* Header */
  HapticEffectType type;      /**< SDL_HAPTIC_SPRING, SDL_HAPTIC_DAMPER,
                                   SDL_HAPTIC_INERTIA or SDL_HAPTIC_FRICTION */
  HapticDirection direction;  /**< Direction of the effect. */

  /* Replay */
  uint length;            /**< Duration of the effect. */
  ushort delay;           /**< Delay before starting the effect. */

  /* Trigger */
  ushort button;          /**< Button that triggers the effect. */
  ushort interval;        /**< How soon it can be triggered again after button. */

  /* Condition */
  ushort[3] right_sat;    /**< Level when joystick is to the positive side; max 0xFFFF. */
  ushort[3] left_sat;     /**< Level when joystick is to the negative side; max 0xFFFF. */
  ushort[3] right_coeff;  /**< How fast to increase the force towards the positive side. */
  ushort[3] left_coeff;   /**< How fast to increase the force towards the negative side. */
  ushort[3] deadband;     /**< Size of the dead zone; max 0xFFFF: whole axis-range when 0-centered. */
  short[3] center;        /**< Position of the dead zone. */
}
struct HapticConstant {
  /* Header */
  HapticEffectType type;      /**< SDL_HAPTIC_CONSTANT */
  HapticDirection direction;  /**< Direction of the effect. */

  /* Replay */
  uint length;            /**< Duration of the effect. */
  ushort delay;           /**< Delay before starting the effect. */

  /* Trigger */
  ushort button;          /**< Button that triggers the effect. */
  ushort interval;        /**< How soon it can be triggered again after button. */

  /* Constant */
  short level;            /**< Strength of the constant effect. */

  /* Envelope */
  ushort attack_length;   /**< Duration of the attack. */
  ushort attack_level;    /**< Level at the start of the attack. */
  ushort fade_length;     /**< Duration of the fade. */
  ushort fade_level;      /**< Level at the end of the fade. */
}
struct HapticCustom {
  /* Header */
  HapticEffectType type;      /**< SDL_HAPTIC_CUSTOM */
  HapticDirection direction;  /**< Direction of the effect. */

  /* Replay */
  uint length;            /**< Duration of the effect. */
  ushort delay;           /**< Delay before starting the effect. */

  /* Trigger */
  ushort button;          /**< Button that triggers the effect. */
  ushort interval;        /**< How soon it can be triggered again after button. */

  /* Custom */
  char channels;          /**< Axes to use, minimum of one. */
  ushort period;          /**< Sample periods. */
  ushort samples;         /**< Amount of samples. */
  ushort* data;           /**< Should contain channels*samples items. */

  /* Envelope */
  ushort attack_length;   /**< Duration of the attack. */
  ushort attack_level;    /**< Level at the start of the attack. */
  ushort fade_length;     /**< Duration of the fade. */
  ushort fade_level;      /**< Level at the end of the fade. */
}
struct HapticDirection {
  HapticDirectionType type;  /**< The type of encoding. */
  int[3] dir;                /**< The encoded direction. */
}
struct HapticLeftRight {
  /* Header */
  HapticEffectType type;  /**< SDL_HAPTIC_LEFTRIGHT */

  /* Replay */
  uint length;          /**< Duration of the effect in milliseconds. */

  /* Rumble */
  ushort large_magnitude; /**< Control of the large controller motor. */
  ushort small_magnitude; /**< Control of the small controller motor. */
}
struct HapticPeriodic {
  /* Header */
  HapticEffectType type;      /**< SDL_HAPTIC_SINE, SDL_HAPTIC_SQUARE
                                   SDL_HAPTIC_TRIANGLE, SDL_HAPTIC_SAWTOOTHUP or
                                   SDL_HAPTIC_SAWTOOTHDOWN */
  HapticDirection direction;  /**< Direction of the effect. */

  /* Replay */
  uint length;      /**< Duration of the effect. */
  ushort delay;       /**< Delay before starting the effect. */

  /* Trigger */
  ushort button;      /**< Button that triggers the effect. */
  ushort interval;    /**< How soon it can be triggered again after button. */

  /* Periodic */
  ushort period;      /**< Period of the wave. */
  short magnitude;    /**< Peak value; if negative, equivalent to 180 degrees extra phase shift. */
  short offset;       /**< Mean value of the wave. */
  ushort phase;       /**< Positive phase shift given by hundredth of a degree. */

  /* Envelope */
  ushort attack_length;   /**< Duration of the attack. */
  ushort attack_level;    /**< Level at the start of the attack. */
  ushort fade_length;     /**< Duration of the fade. */
  ushort fade_level;      /**< Level at the end of the fade. */
}
struct HapticRamp {
  /* Header */
  HapticEffectType type;      /**< SDL_HAPTIC_RAMP */
  HapticDirection direction;  /**< Direction of the effect. */

  /* Replay */
  uint length;          /**< Duration of the effect. */
  ushort delay;           /**< Delay before starting the effect. */

  /* Trigger */
  ushort button;          /**< Button that triggers the effect. */
  ushort interval;        /**< How soon it can be triggered again after button. */

  /* Ramp */
  short start;           /**< Beginning strength level. */
  short end;             /**< Ending strength level. */

  /* Envelope */
  ushort attack_length;   /**< Duration of the attack. */
  short attack_level;    /**< Level at the start of the attack. */
  ushort fade_length;     /**< Duration of the fade. */
  ushort fade_level;      /**< Level at the end of the fade. */
}
union HapticEffect {
  /* Common for all force feedback effects */
  HapticEffectType type;      /**< Effect type. */
  HapticConstant constant;    /**< Constant effect. */
  HapticPeriodic periodic;    /**< Periodic effect. */
  HapticCondition condition;  /**< Condition effect. */
  HapticRamp ramp;            /**< Ramp effect. */
  HapticLeftRight leftright;  /**< Left/Right effect. */
  HapticCustom custom;        /**< Custom effect. */
}

// Functions
extern fn void closeHaptic(Haptic* haptic) @extern("SDL_CloseHaptic");
extern fn HapticEffectID createHapticEffect(Haptic* haptic, HapticEffect* effect) @extern("SDL_CreateHapticEffect");
extern fn void destroyHapticEffect(Haptic* haptic, HapticEffectID effect) @extern("SDL_DestroyHapticEffect");
extern fn bool getHapticEffectStatus(Haptic* haptic, HapticEffectID effect) @extern("SDL_GetHapticEffectStatus");
extern fn uint getHapticFeatures(Haptic* haptic) @extern("SDL_GetHapticFeatures");
extern fn Haptic* getHapticFromID(HapticID instance_id) @extern("SDL_GetHapticFromID");
extern fn HapticID getHapticID(Haptic* haptic) @extern("SDL_GetHapticID");
extern fn char* getHapticName(Haptic* haptic) @extern("SDL_GetHapticName");
extern fn char* getHapticNameForID(HapticID instance_id) @extern("SDL_GetHapticNameForID");
extern fn HapticID* getHaptics(int* count) @extern("SDL_GetHaptics");
extern fn int getMaxHapticEffects(Haptic* haptic) @extern("SDL_GetMaxHapticEffects");
extern fn int getMaxHapticEffectsPlaying(Haptic* haptic) @extern("SDL_GetMaxHapticEffectsPlaying");
extern fn int getNumHapticAxes(Haptic* haptic) @extern("SDL_GetNumHapticAxes");
extern fn bool hapticEffectSupported(Haptic* haptic, HapticEffect* effect) @extern("SDL_HapticEffectSupported");
extern fn bool hapticRumbleSupported(Haptic* haptic) @extern("SDL_HapticRumbleSupported");
extern fn bool initHapticRumble(Haptic* haptic) @extern("SDL_InitHapticRumble");
extern fn bool isJoystickHaptic(Joystick* joystick) @extern("SDL_IsJoystickHaptic");
extern fn bool isMouseHaptic() @extern("SDL_IsMouseHaptic");
extern fn Haptic* openHaptic(HapticID instance_id) @extern("SDL_OpenHaptic");
extern fn Haptic* openHapticFromJoystick(Joystick* joystick) @extern("SDL_OpenHapticFromJoystick");
extern fn Haptic* openHapticFromMouse() @extern("SDL_OpenHapticFromMouse");
extern fn bool pauseHaptic(Haptic* haptic) @extern("SDL_PauseHaptic");
extern fn bool playHapticRumble(Haptic* haptic, float strength, uint length) @extern("SDL_PlayHapticRumble");
extern fn bool resumeHaptic(Haptic* haptic) @extern("SDL_ResumeHaptic");
extern fn bool runHapticEffect(Haptic* haptic, HapticEffectID effect, uint iterations) @extern("SDL_RunHapticEffect");
extern fn bool setHapticAutocenter(Haptic* haptic, int autocenter) @extern("SDL_SetHapticAutocenter");
extern fn bool setHapticGain(Haptic* haptic, int gain) @extern("SDL_SetHapticGain");
extern fn bool stopHapticEffect(Haptic* haptic, HapticEffectID effect) @extern("SDL_StopHapticEffect");
extern fn bool stopHapticEffects(Haptic* haptic) @extern("SDL_StopHapticEffects");
extern fn bool stopHapticRumble(Haptic* haptic) @extern("SDL_StopHapticRumble");
extern fn bool updateHapticEffect(Haptic* haptic, HapticEffectID effect, HapticEffect* data) @extern("SDL_UpdateHapticEffect");

