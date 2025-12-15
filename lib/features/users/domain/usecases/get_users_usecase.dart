import '../entities/paginated_users.dart';
import '../repositories/users_repository.dart';

class GetUsersUseCase {
  const GetUsersUseCase(this._repository);

  final UsersRepository _repository;

  Future<PaginatedUsers> call({
    required int page,
    required int pageSize,
  }) {
    return _repository.getUsers(
      page: page,
      pageSize: pageSize,
    );
  }
}
