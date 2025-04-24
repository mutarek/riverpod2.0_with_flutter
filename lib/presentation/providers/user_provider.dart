import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2/domain/entities/response/accounting/khat_onujay_list_response.dart';

import '../../core/network/api_service.dart';
import '../../data/repository/user_reposity_impl.dart';
import '../../domain/usecase/user_usecase.dart';

final apiServiceProvider = Provider((ref) => ApiService());
final userRepositoryProvider = Provider((ref) => UserRepositoryImpl(ref.watch(apiServiceProvider)));
final getUsersProvider = Provider((ref) => GetUsers(ref.watch(userRepositoryProvider)));

final userListProvider = FutureProvider<KhatOnujayListResponse>((ref) async {
  final usecase = ref.watch(getUsersProvider);
  return usecase();
});