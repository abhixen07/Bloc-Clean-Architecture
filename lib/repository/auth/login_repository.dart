import 'package:bloc_clean_coding/config/appurl/app_url.dart';
import 'package:bloc_clean_coding/data/network/network_api_services.dart';
import 'package:bloc_clean_coding/models/user/user_model.dart';

abstract class LoginRepository {

  @override
  Future<UserModel> loginApi(dynamic data);
}
