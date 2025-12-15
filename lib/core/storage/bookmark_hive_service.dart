import 'package:hive/hive.dart';
import '../../features/bookmarks/data/models/bookmarked_user_model.dart';

class BookmarkHiveService {
  static const String _boxName = 'bookmarks';

  Future<Box<BookmarkedUserModel>> _openBox() async {
    return Hive.openBox<BookmarkedUserModel>(_boxName);
  }

  Future<List<BookmarkedUserModel>> getAll() async {
    final box = await _openBox();
    return box.values.toList();
  }

  Future<void> add(BookmarkedUserModel user) async {
    final box = await _openBox();
    await box.put(user.id, user);
  }

  Future<void> remove(int userId) async {
    final box = await _openBox();
    await box.delete(userId);
  }

  Future<bool> isBookmarked(int userId) async {
    final box = await _openBox();
    return box.containsKey(userId);
  }
}
