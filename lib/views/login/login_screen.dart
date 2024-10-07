import 'package:bloc_clean_coding/bloc/login_bloc.dart';
import 'package:bloc_clean_coding/main.dart';
import 'package:bloc_clean_coding/models/user_model.dart';
import 'package:bloc_clean_coding/repository/auth/login_repository.dart';
import 'package:bloc_clean_coding/views/login/widgets/email_input_widget.dart';
import 'package:bloc_clean_coding/views/login/widgets/login_button.dart';
import 'package:bloc_clean_coding/views/login/widgets/password_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

/// LoginScreen serves as the UI for user authentication.
/// It utilizes the Bloc pattern to manage user state and interactions.
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Focus nodes to manage input field focus
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  // GlobalKey for form validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Bloc to handle login logic
  late LoginBloc _loginBloc;

  // User model to hold input data
  UserModel userModel = UserModel();

  @override
  void initState() {
    super.initState();
    // Initialize the login bloc
    //Dependency Injection
    // _loginBloc = LoginBloc(loginRepository: LoginRepository());

    //Dependency Injection general kr dia
    _loginBloc = LoginBloc(loginRepository: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with title for the login screen
      appBar: AppBar(
        title: Text('لاگ ان اسکرین',style: GoogleFonts.notoNastaliqUrdu()),
        // title: Text('Login Screen',style: GoogleFonts.montserrat()),
        backgroundColor: Colors.grey,
        centerTitle: true, // Center the title
      ),
      // Provide the LoginBloc to the widget tree below
      body: BlocProvider(
        create: (_) => _loginBloc,
        child: Form(
          key: _formKey, // Assign the form key for validation
          child: Padding(
            padding: const EdgeInsets.all(12.0), // Add padding for better layout
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Email input field
                EmailInputWidget(emailFocusNode: emailFocusNode),
                const SizedBox(height: 12), // Spacing between fields
                // Password input field
                PasswordInputWidget(passwordFocusNode: passwordFocusNode),
                const SizedBox(height: 50), // Spacing before login button
                // Login button to submit form and trigger login action
                LoginButton(formKey: _formKey),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the focus nodes when not needed
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _loginBloc.close(); // Close the bloc to avoid memory leaks
    super.dispose();
  }
}
