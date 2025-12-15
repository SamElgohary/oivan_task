import 'package:hive_flutter/hive_flutter.dart';
import '../../features/bookmarks/data/models/bookmarked_user_model.dart';

class HiveManager {
  HiveManager._();

  static Future<void> init() async {
    await Hive.initFlutter();

    // Register adapters here
    Hive.registerAdapter(BookmarkedUserModelAdapter());
    
  }
}
