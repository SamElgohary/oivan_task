import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/bookmarks/presentation/bookmark_viewmodel.dart';
import '../../features/users/data/repositories/users_repo_impl.dart';
import '../../features/users/domain/repositories/users_repository.dart';
import '../../features/users/domain/usecases/get_users_usecase.dart';
import '../../features/users/presentation/viewmodels/users_state.dart';
import '../../features/users/presentation/viewmodels/users_viewmodel.dart';
import '../network/api_client.dart';
import '../network/dio_provider.dart';
import '../storage/hive_service.dart';
import '../../features/users/data/datasources/users_remote_ds.dart';
import '../../features/users/data/datasources/users_remote_ds_impl.dart';


// Provides an instance of ApiClient using the Dio instance from dioProvider
final apiClientProvider = Provider<ApiClient>((ref) {
  final dio = ref.read(dioProvider);
  return ApiClient(dio);
});

// Provides an instance of HiveService
final hiveServiceProvider = Provider<HiveService>((ref) {
  return const HiveService();
});




final usersRemoteDataSourceProvider =
Provider<UsersRemoteDataSource>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return UsersRemoteDataSourceImpl(apiClient);
});




final usersRepositoryProvider = Provider<UsersRepository>((ref) {
  final remoteDataSource = ref.read(usersRemoteDataSourceProvider);
  return UsersRepositoryImpl(remoteDataSource);
});



final getUsersUseCaseProvider = Provider<GetUsersUseCase>((ref) {
  final repository = ref.read(usersRepositoryProvider);
  return GetUsersUseCase(repository);
});


final usersViewModelProvider =
NotifierProvider<UsersViewModel, UsersState>(
  UsersViewModel.new,
);


final bookmarkViewModelProvider =
NotifierProvider<BookmarkViewModel, Set<int>>(
  BookmarkViewModel.new,
);
