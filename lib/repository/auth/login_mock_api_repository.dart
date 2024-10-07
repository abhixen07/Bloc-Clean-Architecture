import 'package:bloc_clean_coding/models/user_model.dart';
import 'package:bloc_clean_coding/repository/auth/login_repository.dart';

class LoginMockApiRepository implements LoginRepository {

  //Dummy if backend is not provided
  @override
  Future<UserModel> loginApi(dynamic data) async {
    await Future.delayed(const Duration(seconds: 2));
    final response = {
      'token': 'doiejf87rjf8743'
    };
    return UserModel.fromJson(response);
  }
}
