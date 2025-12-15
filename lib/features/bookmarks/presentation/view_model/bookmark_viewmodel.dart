import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/providers.dart';
import '../../../users/domain/entities/sof_user.dart';
import '../../domain/repositories/bookmark_repository.dart';



class BookmarkViewModel extends Notifier<List<SofUser>> {
  late final BookmarkRepository _repository;

  @override
  List<SofUser> build() {
    _repository = ref.read(bookmarkRepositoryProvider);
    _loadBookmarks();
    return [];
  }

  Future<void> _loadBookmarks() async {
    final users = await _repository.getBookmarks();
    state = users;
  }

  Future<void> toggle(SofUser user) async {
    await _repository.toggleBookmark(user);

    final exists = state.any((u) => u.id == user.id);

    if (exists) {
      state = state.where((u) => u.id != user.id).toList();
    } else {
      state = [...state, user];
    }
  }

  bool isBookmarked(int userId) {
    return state.any((u) => u.id == userId);
  }
}
