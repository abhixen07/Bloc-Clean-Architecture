import 'package:bloc/bloc.dart';
import 'package:bloc_clean_coding/repository/auth/login_repository.dart';
import 'package:bloc_clean_coding/services/session_manager/session_controller.dart';
import 'package:bloc_clean_coding/utils/enums.dart';
import 'package:bloc_clean_coding/views/login/widgets/login_button.dart';
import 'package:equatable/equatable.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(const LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_loginApi);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        email: event.email,
      ),
    );
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }

  void _loginApi(LoginApi event, Emitter<LoginState> emit) async {
    Map data = {
      "email": state.email,
      "password": state.password
    };
    emit(
      state.copyWith(postApiStatus: PostApiStatus.loading),
    );
    await loginRepository.loginApi(data).then((value) async {
      if (value.error.isNotEmpty) {
        print('i am here');
        emit(
          state.copyWith(message: value.error.toString(),postApiStatus: PostApiStatus.error),
        );
      } else {

        await SessionController().saveUserInPreference(value);
        await SessionController().getUserFromPreference();
        emit(
          state.copyWith(message: 'Login successful!',postApiStatus: PostApiStatus.success),
        );

      }
    }).onError((error, stackTrace) {
      emit(
        state.copyWith(message: error.toString(),postApiStatus: PostApiStatus.error),
      );
    });
  }



}