import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InternetExceptionWidget extends StatelessWidget {

  final VoidCallback onPress;
  const InternetExceptionWidget({super.key,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .15,
        ),
        const Icon(
          Icons.cloud_off,
          color: Colors.red,
          size: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Text(
              'We’re unable to show results.\nPlease check your data\nconnection.',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 20),
            ), // Text
          ), // Center
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .05,
        ),
        ElevatedButton(
            onPressed: onPress,
            child: Text(
                'RETRY',
              style: Theme.of(context).textTheme.bodySmall,

            )

        )// Padding
      ],
    );
  }
}
