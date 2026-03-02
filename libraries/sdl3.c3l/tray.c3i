
module sdl3;

// Types
alias Tray = void;
alias TrayEntry = void;
alias TrayMenu = void;
alias TrayCallback = fn void(void* userdata, TrayEntry* entry);
alias TrayClickCallback = fn bool(void* userdata, Tray* tray);

// Bitstructs
bitstruct TrayEntryFlags : uint {
  bool button:    0;
  bool checkbox:  1;
  bool submenu:   2;
  bool checked:  30;
  bool disabled: 31;
}

// Functions
extern fn void clickTrayEntry(TrayEntry* entry) @extern("SDL_ClickTrayEntry");
extern fn Tray * createTray(Surface* icon, char* tooltip) @extern("SDL_CreateTray");
extern fn TrayMenu* createTrayMenu(Tray* tray) @extern("SDL_CreateTrayMenu");
extern fn TrayMenu* createTraySubmenu(TrayEntry* entry) @extern("SDL_CreateTraySubmenu");
extern fn Tray* createTrayWithProperties(PropertiesID props) @extern("SDL_CreateTrayWithProperties");
extern fn void destroyTray(Tray* tray) @extern("SDL_DestroyTray");
extern fn TrayEntry** getTrayEntries(TrayMenu* menu, int* count) @extern("SDL_GetTrayEntries");
extern fn bool getTrayEntryChecked(TrayEntry* entry) @extern("SDL_GetTrayEntryChecked");
extern fn bool getTrayEntryEnabled(TrayEntry* entry) @extern("SDL_GetTrayEntryEnabled");
extern fn char* getTrayEntryLabel(TrayEntry* entry) @extern("SDL_GetTrayEntryLabel");
extern fn TrayMenu* getTrayEntryParent(TrayEntry* entry) @extern("SDL_GetTrayEntryParent");
extern fn TrayMenu* getTrayMenu(Tray* tray) @extern("SDL_GetTrayMenu");
extern fn TrayEntry* getTrayMenuParentEntry(TrayMenu* menu) @extern("SDL_GetTrayMenuParentEntry");
extern fn Tray* getTrayMenuParentTray(TrayMenu* menu) @extern("SDL_GetTrayMenuParentTray");
extern fn TrayMenu* getTraySubmenu(TrayEntry* entry) @extern("SDL_GetTraySubmenu");
extern fn TrayEntry* insertTrayEntryAt(TrayMenu* menu, int pos, char* label, TrayEntryFlags flags) @extern("SDL_InsertTrayEntryAt");
extern fn void removeTrayEntry(TrayEntry* entry) @extern("SDL_RemoveTrayEntry");
extern fn void setTrayEntryCallback(TrayEntry* entry, TrayCallback callback, void *userdata) @extern("SDL_SetTrayEntryCallback");
extern fn void setTrayEntryChecked(TrayEntry* entry, bool checked) @extern("SDL_SetTrayEntryChecked");
extern fn void setTrayEntryEnabled(TrayEntry* entry, bool enabled) @extern("SDL_SetTrayEntryEnabled");
extern fn void setTrayEntryLabel(TrayEntry* entry, char* label) @extern("SDL_SetTrayEntryLabel");
extern fn void setTrayIcon(Tray* tray, Surface* icon) @extern("SDL_SetTrayIcon");
extern fn void setTrayTooltip(Tray* tray, char* tooltip) @extern("SDL_SetTrayTooltip");
extern fn void updateTrays() @extern("SDL_UpdateTrays");

