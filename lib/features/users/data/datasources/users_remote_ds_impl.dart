import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/utils/app_keys.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/sof_user_model.dart';
import 'users_remote_ds.dart';

class UsersRemoteDataSourceImpl implements UsersRemoteDataSource {
  UsersRemoteDataSourceImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<ApiResponse<SofUserModel>> getUsers({
    required int page,
    required int pageSize,
  }) async {
    final response = await _apiClient.get(
      AppEndpoints.users,
      queryParameters: {
        AppKeys.page: page,
        AppKeys.pageSize: pageSize,
      },
    );

    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
          (json) => SofUserModel.fromJson(json as Map<String, dynamic>),
    );
  }
}
