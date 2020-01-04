import 'package:d5_cylinder/models/device_task_model_entity.dart';
import 'package:d5_cylinder/models/cnc_model_entity.dart';
import 'package:d5_cylinder/models/home_device_model_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "DeviceTaskModelEntity") {
      return DeviceTaskModelEntity.fromJson(json) as T;
    } else if (T.toString() == "CncModelEntity") {
      return CncModelEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeDeviceModelEntity") {
      return HomeDeviceModelEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}