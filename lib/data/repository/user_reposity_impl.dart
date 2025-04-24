import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod2/core/network/api_service.dart';
import 'package:riverpod2/domain/entities/response/accounting/khat_onujay_list_response.dart';

import '../../core/utils/app_constant_utils.dart';
import '../../core/utils/url_utils.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final ApiService apiService;

  UserRepositoryImpl(this.apiService);

  @override
  Future<KhatOnujayListResponse> getKhatOnujayList(String token, String keyword) async{
      try {
        Response response = await apiService.dio.get(
          "${UrlUtils.getKhatOnujayListUrl}$keyword",
          options: Options(
            headers: {
              'Module': AppConstantUtils.module,
              'Content-Type': 'application/json',
              'Authorization': token
            },
          ),
        );
        return KhatOnujayListResponse.fromJson(response.data);
      } catch (e) {
        var errorMessage = e.toString();
        if (e is DioException) {
          //errorMessage = DioExceptions.fromDioError(e).toString();
        }
        if (kDebugMode) {
          print(errorMessage);
        }

        return KhatOnujayListResponse(issuccess: false, message: "", payload: null);
      }
    }
}
