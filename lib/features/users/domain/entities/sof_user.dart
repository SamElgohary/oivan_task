import 'package:equatable/equatable.dart';

class SofUser extends Equatable {
  const SofUser({
    required this.id,
    required this.displayName,
    required this.profileImage,
    required this.reputation,
  });

  /// StackOverflow user id
  final int id;

  /// User display name
  final String displayName;

  /// Avatar image URL
  final String profileImage;

  /// Total reputation score
  final int reputation;

  @override
  List<Object?> get props => [
    id,
    displayName,
    profileImage,
    reputation,
  ];
}
