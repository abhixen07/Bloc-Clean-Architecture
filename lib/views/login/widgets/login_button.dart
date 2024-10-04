import 'package:bloc_clean_coding/bloc/login_bloc.dart';
import 'package:bloc_clean_coding/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  final formKey;

  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc,LoginState>(
        listener: (context,state){
          if(state.postApiStatus == PostApiStatus.error){
            ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(content: Text(state.message.toString())),
                );
          }

          if(state.postApiStatus == PostApiStatus.success){
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text(state.message.toString())),
              );
          }

          if(state.postApiStatus == PostApiStatus.loading){
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text('Submitting...'),
              ));
          }
        },
      child: BlocBuilder<LoginBloc, LoginState>(
          buildWhen: (current,previous) => false,
          builder: (context,state){
            return ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(LoginApi());
                  }
                },
                child: const Text('Login'));
          }
      ),
    );
  }
}
