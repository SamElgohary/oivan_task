import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../network/api_client.dart';
import '../network/dio_provider.dart';
import '../storage/hive_service.dart';



// Provides an instance of ApiClient using the Dio instance from dioProvider
final apiClientProvider = Provider<ApiClient>((ref) {
  final dio = ref.read(dioProvider);
  return ApiClient(dio);
});

// Provides an instance of HiveService
final hiveServiceProvider = Provider<HiveService>((ref) {
  return const HiveService();
});
