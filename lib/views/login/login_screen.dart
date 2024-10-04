import 'package:bloc_clean_coding/bloc/login_bloc.dart';
import 'package:bloc_clean_coding/models/user_model.dart';
import 'package:bloc_clean_coding/views/login/widgets/email_input_widget.dart';
import 'package:bloc_clean_coding/views/login/widgets/login_button.dart';
import 'package:bloc_clean_coding/views/login/widgets/password_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  late LoginBloc _loginBloc;
  UserModel userModel = UserModel();

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
        centerTitle: true,
      ),
      body: BlocProvider(
          create: (_) => _loginBloc,
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EmailInputWidget(emailFocusNode: emailFocusNode),
                  const SizedBox(
                    height: 12,
                  ),
                  PasswordInputWidget(passwordFocusNode: passwordFocusNode),
                  const SizedBox(
                    height: 50,
                  ),
                  LoginButton(formKey: _formKey),
                ],
              ),
            )
        ),
      ),
    );
  }
}
