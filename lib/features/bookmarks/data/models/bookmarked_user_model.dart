import 'package:hive/hive.dart';
import '../../../users/domain/entities/sof_user.dart';

part 'bookmarked_user_model.g.dart';

@HiveType(typeId: 1)
class BookmarkedUserModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String displayName;

  @HiveField(2)
  final String profileImage;

  @HiveField(3)
  final int reputation;

  BookmarkedUserModel({
    required this.id,
    required this.displayName,
    required this.profileImage,
    required this.reputation,
  });

  factory BookmarkedUserModel.fromEntity(SofUser user) {
    return BookmarkedUserModel(
      id: user.id,
      displayName: user.displayName,
      profileImage: user.profileImage,
      reputation: user.reputation,
    );
  }

  SofUser toEntity() {
    return SofUser(
      id: id,
      displayName: displayName,
      profileImage: profileImage,
      reputation: reputation,
    );
  }
}
