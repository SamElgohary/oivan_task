import 'package:hive/hive.dart';

class HiveBoxProvider {
  const HiveBoxProvider();

  Future<Box<T>> getBox<T>(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<T>(boxName);
    }
    return await Hive.openBox<T>(boxName);
  }
}
