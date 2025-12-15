import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  const HiveService();

  static const String bookmarksBox = 'bookmarks';

  Future<void> init() async {
    await Hive.openBox<int>(bookmarksBox);
  }

  Box<int> get bookmarks => Hive.box<int>(bookmarksBox);
}
