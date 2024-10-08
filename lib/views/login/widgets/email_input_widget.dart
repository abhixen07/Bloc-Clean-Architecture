import 'package:bloc_clean_coding/bloc/login/login_bloc.dart';
import 'package:bloc_clean_coding/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

/// EmailInputWidget is a form field for capturing and validating email input.
/// It integrates with the LoginBloc to handle state changes and validation.
class EmailInputWidget extends StatelessWidget {
  // FocusNode to manage focus state for the email input field
  final FocusNode emailFocusNode;

  // Constructor requires the email focus node to be passed in
  const EmailInputWidget({Key? key, required this.emailFocusNode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      // Rebuild the widget only when the email state changes
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          // Specify email input type
          keyboardType: TextInputType.emailAddress,
          focusNode: emailFocusNode, // Assign the provided focus node
          style: GoogleFonts.montserrat(color: Colors.black),

          // TextField decoration for styling
          decoration: InputDecoration(
            hintText: 'Email', // Placeholder text for the field
            hintStyle: GoogleFonts.montserrat(color: Colors.black),
            border: OutlineInputBorder(), // Outlined border for a professional look
          ),

          // Handle text input changes by dispatching the EmailChanged event to LoginBloc
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailChanged(email: value));
          },

          // Validator to check if the input is a valid email
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter Email'; // Error message if input is empty
            }
            if (!Validations.emailValidator(value)) {
              return 'Enter Valid Email'; // Error message if email is invalid
            }
            return null; // Return null if input is valid
          },

          // Optionally handle form submission
          onFieldSubmitted: (value) {
            // Custom behavior can be implemented here when the user submits the email field
          },
        );
      },
    );
  }
}
