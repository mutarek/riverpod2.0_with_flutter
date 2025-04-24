import 'package:riverpod2/core/utils/app_constant_utils.dart';
import 'package:riverpod2/domain/entities/response/accounting/khat_onujay_list_response.dart';

import '../repositories/user_repository.dart';

class GetUsers {
  final UserRepository repository;
  GetUsers(this.repository);

  Future<KhatOnujayListResponse> call() => repository.getKhatOnujayList(AppConstantUtils.token, "expense");
}