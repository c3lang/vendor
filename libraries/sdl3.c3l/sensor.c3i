
module sdl3;

// Types
alias Sensor = void;
alias SensorID = uint;

// Enums
enum SensorType : const CInt {
  INVALID = -1,  /**< Returned for an invalid sensor */
  UNKNOWN =  0,  /**< Unknown sensor type */
  ACCEL   =  1,  /**< Accelerometer */
  GYRO    =  2,  /**< Gyroscope */
  ACCEL_L =  3,  /**< Accelerometer for left Joy-Con controller and Wii nunchuk */
  GYRO_L  =  4,  /**< Gyroscope for left Joy-Con controller */
  ACCEL_R =  5,  /**< Accelerometer for right Joy-Con controller */
  GYRO_R  =  6,  /**< Gyroscope for right Joy-Con controller */
  COUNT
}

// Functions
extern fn void closeSensor(Sensor* sensor) @extern("SDL_CloseSensor");
extern fn bool getSensorData(Sensor* sensor, float* data, int num_values) @extern("SDL_GetSensorData");
extern fn Sensor* getSensorFromID(SensorID instance_id) @extern("SDL_GetSensorFromID");
extern fn SensorID getSensorID(Sensor* sensor) @extern("SDL_GetSensorID");
extern fn char* getSensorName(Sensor* sensor) @extern("SDL_GetSensorName");
extern fn char* getSensorNameForID(SensorID instance_id) @extern("SDL_GetSensorNameForID");
extern fn int getSensorNonPortableType(Sensor* sensor) @extern("SDL_GetSensorNonPortableType");
extern fn int getSensorNonPortableTypeForID(SensorID instance_id) @extern("SDL_GetSensorNonPortableTypeForID");
extern fn PropertiesID getSensorProperties(Sensor* sensor) @extern("SDL_GetSensorProperties");
extern fn SensorID* getSensors(int* count) @extern("SDL_GetSensors");
extern fn SensorType getSensorType(Sensor* sensor) @extern("SDL_GetSensorType");
extern fn SensorType getSensorTypeForID(SensorID instance_id) @extern("SDL_GetSensorTypeForID");
extern fn Sensor* openSensor(SensorID instance_id) @extern("SDL_OpenSensor");
extern fn void updateSensors() @extern("SDL_UpdateSensors");

