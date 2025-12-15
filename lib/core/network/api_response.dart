import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@Freezed(genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    required List<T> items,
    @JsonKey(name: 'has_more') required bool hasMore,
    @JsonKey(name: 'quota_max') int? quotaMax,
    @JsonKey(name: 'quota_remaining') int? quotaRemaining,
  }) = _ApiResponse<T>;

  factory ApiResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object?) fromJsonT,
      ) =>
      _$ApiResponseFromJson(json, fromJsonT);
}
