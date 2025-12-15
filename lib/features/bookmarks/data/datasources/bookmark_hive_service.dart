import 'package:hive/hive.dart';
import '../../../../core/storage/hive_box_provider.dart';
import '../models/bookmarked_user_model.dart';

class BookmarkHiveService {
  static const String boxName = 'bookmarks';

  BookmarkHiveService(this._boxProvider);

  final HiveBoxProvider _boxProvider;

  Future<Box<BookmarkedUserModel>> _box() {
    return _boxProvider.getBox<BookmarkedUserModel>(boxName);
  }

  Future<List<BookmarkedUserModel>> getAll() async {
    final box = await _box();
    return box.values.toList();
  }

  Future<void> add(BookmarkedUserModel user) async {
    final box = await _box();
    await box.put(user.id, user);
  }

  Future<void> remove(int userId) async {
    final box = await _box();
    await box.delete(userId);
  }

  Future<bool> contains(int userId) async {
    final box = await _box();
    return box.containsKey(userId);
  }
}
