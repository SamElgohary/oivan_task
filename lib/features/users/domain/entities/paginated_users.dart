import 'package:equatable/equatable.dart';
import 'sof_user.dart';

class PaginatedUsers extends Equatable {
  const PaginatedUsers({
    required this.users,
    required this.hasMore,
  });

  final List<SofUser> users;
  final bool hasMore;

  @override
  List<Object?> get props => [users, hasMore];
}
