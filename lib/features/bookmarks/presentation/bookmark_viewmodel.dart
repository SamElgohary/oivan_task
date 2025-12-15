import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/di/providers.dart';
import '../../users/domain/entities/sof_user.dart';
import '../domain/repositories/bookmark_repository.dart';

class BookmarkViewModel extends Notifier<Set<int>> {
  late final BookmarkRepository _repository;

  @override
  Set<int> build() {
    _repository = ref.read(bookmarkRepositoryProvider);
    _loadBookmarks();
    return {};
  }

  Future<void> _loadBookmarks() async {
    final users = await _repository.getBookmarks();
    state = users.map((e) => e.id).toSet();
  }

  Future<void> toggle(SofUser user) async {
    await _repository.toggleBookmark(user);

    final isBookmarked = state.contains(user.id);
    state = {
      if (!isBookmarked) user.id,
      ...state.where((id) => id != user.id),
    };
  }

  bool isBookmarked(int userId) {
    return state.contains(userId);
  }
}
