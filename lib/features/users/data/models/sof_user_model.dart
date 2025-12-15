import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/sof_user.dart';

part 'sof_user_model.freezed.dart';
part 'sof_user_model.g.dart';

@freezed
class SofUserModel with _$SofUserModel {
  const SofUserModel._();

  const factory SofUserModel({
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'display_name') required String displayName,
    @JsonKey(name: 'profile_image') required String profileImage,
    required int reputation,

    // optional extras
    String? location,
    @JsonKey(name: 'accept_rate') int? acceptRate,
  }) = _SofUserModel;

  factory SofUserModel.fromJson(Map<String, dynamic> json) =>
      _$SofUserModelFromJson(json);

  SofUser toEntity() => SofUser(
    id: userId,
    displayName: displayName,
    profileImage: profileImage,
    reputation: reputation,
  );
}
