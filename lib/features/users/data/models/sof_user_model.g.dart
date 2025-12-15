// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sof_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SofUserModelImpl _$$SofUserModelImplFromJson(Map<String, dynamic> json) =>
    _$SofUserModelImpl(
      userId: (json['user_id'] as num).toInt(),
      displayName: json['display_name'] as String,
      profileImage: json['profile_image'] as String,
      reputation: (json['reputation'] as num).toInt(),
      location: json['location'] as String?,
      acceptRate: (json['accept_rate'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SofUserModelImplToJson(_$SofUserModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'display_name': instance.displayName,
      'profile_image': instance.profileImage,
      'reputation': instance.reputation,
      'location': instance.location,
      'accept_rate': instance.acceptRate,
    };
