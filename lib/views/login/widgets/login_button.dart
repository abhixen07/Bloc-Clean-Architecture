import 'package:bloc_clean_coding/bloc/login/login_bloc.dart';
import 'package:bloc_clean_coding/config/routes/routes_name.dart';
import 'package:bloc_clean_coding/utils/enums.dart';
import 'package:bloc_clean_coding/utils/flush_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

/// LoginButton widget is responsible for handling the login action.
/// It listens for the API status and reacts to success or error messages,
/// while providing visual feedback during API call execution.
class LoginButton extends StatelessWidget {
  // Key to validate the form passed from the parent widget
  final GlobalKey<FormState> formKey;

  // Constructor requiring the form key to be passed in
  const LoginButton({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      // Rebuild the widget only when the postApiStatus changes
      listenWhen: (previous, current) => previous.postApiStatus != current.postApiStatus,

      // Listener to handle different API states (success, error)
      listener: (context, state) {
        // Show an error message if API call fails
        if (state.postApiStatus == PostApiStatus.error) {
          FlushBarHelper.flushBarErrorMessage(state.message ?? 'Login Failed', context);
        }

        // Show a success message if API call succeeds
        if (state.postApiStatus == PostApiStatus.success) {
          Navigator.pushNamed(context, RoutesName.homeScreen);
          FlushBarHelper.flushBarSuccessMessage('Login Successful', context);
        }
      },

      // BlocBuilder rebuilds the button based on the postApiStatus state
      child: BlocBuilder<LoginBloc, LoginState>(
        // Rebuild only when the postApiStatus changes
        buildWhen: (previous, current) => previous.postApiStatus != current.postApiStatus,

        builder: (context, state) {
          return ElevatedButton(
            // Trigger form validation and login API call
            onPressed: () {
              if (formKey.currentState!.validate()) {
                // Dispatch the LoginApi event to initiate login
                context.read<LoginBloc>().add(LoginApi());
              }
            },

            // Show a loading indicator when the API is in progress
            child: state.postApiStatus == PostApiStatus.loading
                ? const CircularProgressIndicator(color: Colors.black,) // Display a loader during the API call
                : Text('Login',style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),), // Default button text when not loading

            // Styling for the button (optional, can be customized further)
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              textStyle: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // Rounded corners
              ),
            ),
          );
        },
      ),
    );
  }
}
