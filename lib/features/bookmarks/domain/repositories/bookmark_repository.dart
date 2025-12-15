import '../../../users/domain/entities/sof_user.dart';

abstract class BookmarkRepository {
  Future<List<SofUser>> getBookmarks();
  Future<void> toggleBookmark(SofUser user);
  Future<bool> isBookmarked(int userId);
}
