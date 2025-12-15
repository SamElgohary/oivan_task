import '../../domain/entities/sof_user.dart';
import '../../domain/repositories/users_repository.dart';
import '../datasources/users_remote_ds.dart';

class UsersRepositoryImpl implements UsersRepository {
  UsersRepositoryImpl(this._remoteDataSource);

  final UsersRemoteDataSource _remoteDataSource;

  @override
  Future<List<SofUser>> getUsers({
    required int page,
    required int pageSize,
  }) async {
    final response = await _remoteDataSource.getUsers(
      page: page,
      pageSize: pageSize,
    );

    return response.items
        .map((model) => model.toEntity())
        .toList();
  }
}
