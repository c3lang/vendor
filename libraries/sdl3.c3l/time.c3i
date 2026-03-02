
module sdl3;

// Structs
struct DateTime {
  int year, month, day;
  int hour, minute;
  int second, nanosecond;
  int day_of_week;
  int utc_offset;
}

// Enums
enum DateFormat {
  YYYYMMDD, /**< Year/Month/Day */
  DDMMYYYY, /**< Day/Month/Year */
  MMDDYYYY, /**< Month/Day/Year */
}
enum TimeFormat {
  HR24, /**< 24 hour time */
  HR12, /**< 12 hour time */
}

// Functions
extern fn bool dateTimeToTime(DateTime* dt, Time* ticks) @extern("SDL_DateTimeToTime");
extern fn bool getCurrentTime(Time* ticks) @extern("SDL_GetCurrentTime");
extern fn bool getDateTimeLocalePreferences(DateFormat* dateFormat, TimeFormat* timeFormat) @extern("SDL_GetDateTimeLocalePreferences");
extern fn int getDayOfWeek(int year, int month, int day) @extern("SDL_GetDayOfWeek");
extern fn int getDayOfYear(int year, int month, int day) @extern("SDL_GetDayOfYear");
extern fn int getDaysInMonth(int year, int month) @extern("SDL_GetDaysInMonth");
extern fn Time timeFromWindows(uint dwLowDateTime, uint dwHighDateTime) @extern("SDL_TimeFromWindows");
extern fn bool timeToDateTime(Time ticks, DateTime* dt, bool localTime) @extern("SDL_TimeToDateTime");
extern fn void timeToWindows(Time ticks, uint* dwLowDateTime, uint* dwHighDateTime) @extern("SDL_TimeToWindows");

