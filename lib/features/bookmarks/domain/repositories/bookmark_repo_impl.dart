import '../../../users/domain/entities/sof_user.dart';
import '../../data/datasources/bookmark_hive_service.dart';
import '../../data/models/bookmarked_user_model.dart';
import '../../domain/repositories/bookmark_repository.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  BookmarkRepositoryImpl(this._service);

  final BookmarkHiveService _service;

  @override
  Future<List<SofUser>> getBookmarks() async {
    final items = await _service.getAll();
    return items.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> toggleBookmark(SofUser user) async {
    final exists = await _service.contains(user.id);

    if (exists) {
      await _service.remove(user.id);
    } else {
      await _service.add(
        BookmarkedUserModel.fromEntity(user),
      );
    }
  }

  @override
  Future<bool> isBookmarked(int userId) {
    return _service.contains(userId);
  }
}
