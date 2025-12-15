import '../entities/sof_user.dart';

abstract class UsersRepository {
  Future<List<SofUser>> getUsers({
    required int page,
    required int pageSize,
  });
}
