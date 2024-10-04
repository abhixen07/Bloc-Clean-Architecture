import 'package:bloc_clean_coding/config/appurl/app_url.dart';
import 'package:bloc_clean_coding/data/network/network_api_services.dart';
import 'package:bloc_clean_coding/models/user_model.dart';

class LoginRepository {
  final _api = NetworkApiServices();

  Future<UserModel> loginApi(dynamic data) async {
    final response = await _api.postApi(AppUrl.loginApi, data);
    return UserModel.fromJson(response);
  }
}
