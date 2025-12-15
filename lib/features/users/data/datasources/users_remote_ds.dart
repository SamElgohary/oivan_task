import '../../../../core/network/api_response.dart';
import '../models/sof_user_model.dart';

abstract class UsersRemoteDataSource {
  Future<ApiResponse<SofUserModel>> getUsers({
    required int page,
    required int pageSize,
  });
}
