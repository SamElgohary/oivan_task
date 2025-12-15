import '../entities/paginated_users.dart';

abstract class UsersRepository {
  Future<PaginatedUsers> getUsers({
    required int page,
    required int pageSize,
  });
}
