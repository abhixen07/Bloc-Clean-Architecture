import 'package:bloc_clean_coding/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

/// PasswordInputWidget is a form field for capturing and validating password input.
/// It integrates with the LoginBloc to handle state changes and validation.
class PasswordInputWidget extends StatelessWidget {
  // FocusNode to manage focus state for the password input field
  final FocusNode passwordFocusNode;

  // Constructor requires the password focus node to be passed in
  const PasswordInputWidget({Key? key, required this.passwordFocusNode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      // Rebuild the widget only when the password state changes
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          // Specify text input type and obscure the text for password input
          keyboardType: TextInputType.text,
          focusNode: passwordFocusNode, // Assign the provided focus node
          obscureText: true, // Hide the text input (for passwords)
          style: GoogleFonts.montserrat(color: Colors.black),

          // TextField decoration for styling
          decoration: InputDecoration(
            hintText: 'Password', // Placeholder text for the password field
            hintStyle: GoogleFonts.montserrat(color: Colors.black),
            border: OutlineInputBorder(), // Outlined border for a clean UI
          ),

          // Handle text input changes by dispatching the PasswordChanged event to LoginBloc
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChanged(password: value));
          },

          // Validator to check if the input is a valid password
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter Password'; // Error message if input is empty
            }
            if (value.length < 6) {
              return 'Please enter a password greater than 6 characters'; // Error message for short passwords
            }
            return null; // Return null if input is valid
          },

          // Optionally handle form submission
          onFieldSubmitted: (value) {
            // Custom behavior can be implemented here when the user submits the password field
          },
        );
      },
    );
  }
}
