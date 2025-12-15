import '../../domain/entities/paginated_users.dart';
import '../../domain/repositories/users_repository.dart';
import '../datasources/users_remote_ds.dart';

class UsersRepositoryImpl implements UsersRepository {
  UsersRepositoryImpl(this._remoteDataSource);

  final UsersRemoteDataSource _remoteDataSource;

  @override
  Future<PaginatedUsers> getUsers({
    required int page,
    required int pageSize,
  }) async {
    final response = await _remoteDataSource.getUsers(
      page: page,
      pageSize: pageSize,
    );

    final users = response.items
        .map((model) => model.toEntity())
        .toList();

    return PaginatedUsers(
      users: users,
      hasMore: response.hasMore,
    );
  }
}
