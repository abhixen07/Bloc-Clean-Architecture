import 'package:bloc_clean_coding/config/appurl/app_url.dart';
import 'package:bloc_clean_coding/data/network/network_api_services.dart';
import 'package:bloc_clean_coding/models/user/user_model.dart';
import 'package:bloc_clean_coding/repository/auth/login_repository.dart';

class LoginHttpApiRepository implements LoginRepository{
  final _api = NetworkApiServices();

  @override
  Future<UserModel> loginApi(dynamic data) async {
    final response = await _api.postApi(AppUrl.loginApi, data);
    return UserModel.fromJson(response);
  }
}
