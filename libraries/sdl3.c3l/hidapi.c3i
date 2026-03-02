
module sdl3::hid;

// Types
alias Device = void;

// Structs
struct DeviceInfo {
  char* path;            /** Platform-specific device path */
  ushort vendor_id;      /** Device Vendor ID */
  ushort product_id;     /** Device Product ID */
  char* serial_number;   /** Serial Number */
  ushort release_number; /** Device Release Number in binary-coded decimal, also known as Device Version Number */
  char* manufacturer_string; /** Manufacturer String */
  char* product_string;  /** Product string */
  ushort usage_page;     /** Usage Page for this Device/Interface (Windows/Mac/hidraw only) */
  ushort usage;          /** Usage for this Device/Interface (Windows/Mac/hidraw only) */
  int interface_number;  /** The USB interface which this logical device represents. */
                         /** Valid only if the device is a USB HID device. Set to -1 in all other cases. */
  /** Additional information about the USB interface. Valid on libusb and Android implementations. */
  int interface_class;
  int interface_subclass;
  int interface_protocol;

  BusType bus_type;      /** Underlying bus type */
  DeviceInfo* next;      /** Pointer to the next device */
}

// Enums
enum BusType {
  /** Unknown bus type */
  UNKNOWN,

  /** USB bus
     Specifications:
     https://usb.org/hid */
  USB,

  /** Bluetooth or Bluetooth LE bus
     Specifications:
     https://www.bluetooth.com/specifications/specs/human-interface-device-profile-1-1-1/
     https://www.bluetooth.com/specifications/specs/hid-service-1-0/
     https://www.bluetooth.com/specifications/specs/hid-over-gatt-profile-1-0/ */
  BLUETOOTH,

  /** I2C bus
     Specifications:
     https://docs.microsoft.com/previous-versions/windows/hardware/design/dn642101(v=vs.85) */
  I2C,

  /** SPI bus
     Specifications:
     https://www.microsoft.com/download/details.aspx?id=103325 */
  SPI,
}

// Functions
extern fn void ble_scan(bool active) @extern("SDL_hid_ble_scan");
extern fn int close(Device* dev) @extern("SDL_hid_close");
extern fn uint device_change_count() @extern("SDL_hid_device_change_count");
extern fn DeviceInfo* enumerate(ushort vendor_id, ushort product_id) @extern("SDL_hid_enumerate");
extern fn int exit() @extern("SDL_hid_exit");
extern fn void free_enumeration(DeviceInfo* devs) @extern("SDL_hid_free_enumeration");
extern fn DeviceInfo* get_device_info(Device* dev) @extern("SDL_hid_get_device_info");
extern fn int get_feature_report(Device* dev, char* data, usz length) @extern("SDL_hid_get_feature_report");
extern fn int get_indexed_string(Device* dev, int string_index, char* string, usz maxlen) @extern("SDL_hid_get_indexed_string");
extern fn int get_input_report(Device* dev, char* data, usz length) @extern("SDL_hid_get_input_report");
extern fn int get_manufacturer_string(Device* dev, char* string, usz maxlen) @extern("SDL_hid_get_manufacturer_string");
extern fn int get_product_string(Device* dev, char* string, usz maxlen) @extern("SDL_hid_get_product_string");
extern fn PropertiesID get_properties(Device* dev) @extern("SDL_hid_get_properties");
extern fn int get_report_descriptor(Device* dev, char* buf, usz buf_size) @extern("SDL_hid_get_report_descriptor");
extern fn int get_serial_number_string(Device* dev, char* string, usz maxlen) @extern("SDL_hid_get_serial_number_string");
extern fn int init() @extern("SDL_hid_init");
extern fn Device* open(ushort vendor_id, ushort product_id, char* serial_number) @extern("SDL_hid_open");
extern fn Device* open_path(char* path) @extern("SDL_hid_open_path");
extern fn int read(Device* dev, char* data, usz length) @extern("SDL_hid_read");
extern fn int read_timeout(Device* dev, char* data, usz length, int milliseconds) @extern("SDL_hid_read_timeout");
extern fn int send_feature_report(Device* dev, char* data, usz length) @extern("SDL_hid_send_feature_report");
extern fn int set_nonblocking(Device* dev, int nonblock) @extern("SDL_hid_set_nonblocking");
extern fn int write(Device* dev, char* data, usz length) @extern("SDL_hid_write");

