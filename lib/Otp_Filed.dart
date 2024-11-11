import 'package:flutter/material.dart';

class OtpInputField extends StatelessWidget {
  final TextEditingController otpController;
  final int otpLength;
  final String? Function(String?)? validator;

  OtpInputField(
      {required this.otpController,
        this.otpLength = 4,
        this.validator}); // Set length to 4 or adjust as needed

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(otpLength, (index) {
        return SizedBox(
          width: 50, // Adjust width as per your design
          child: TextFormField(
            maxLength: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              counterText: "",
              filled: true,
              fillColor: Colors.white, // Fills input background with white
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onChanged: (value) {
              // Check if the entered value is a digit
              if (value.isNotEmpty && int.tryParse(value) != null) {
                // Set the entered value into the controller

                // Automatically move to the next field
                if (index < otpLength - 1) {
                  FocusScope.of(context).nextFocus();
                } else if (value.isEmpty) {
                  // If the user clears a field, move to the previous one
                  if (index > 0) {
                    FocusScope.of(context).previousFocus();
                  }
                }
              }
            },
            controller: TextEditingController(
                text: otpController.text.isNotEmpty
                    ? otpController.text[index]
                    : ''),
          ),
        );
      }),
    );
  }
}
