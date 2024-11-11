import 'dart:convert';

import 'package:macfoxl/Login/Button_Reuseable.dart';
import 'package:macfoxl/Otp_Filed.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PhoneOTPScreen extends StatefulWidget {
  final String phoneNumber;
  PhoneOTPScreen({super.key, required this.phoneNumber});

  @override
  State<PhoneOTPScreen> createState() => _PhoneOTPScreenState();
}

class _PhoneOTPScreenState extends State<PhoneOTPScreen> {
  TextEditingController otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Function to validate OTP input
  String? _validateOtp(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the OTP';
    }
    if (value.length != 6) {
      return 'OTP must be 4 digits long'; // Adjust the length to 4
    }
    return null;
  }

  final String _baseUrl = 'https://chitsoft.in/wapp/api/mobile2/index.php';

  // OTP Verification Function
  Future<void> verifyOtp(String phoneNumber, String otp) async {
    final url = Uri.parse(_baseUrl);
    final response = await http.post(url, body: {
      'type': '3',
      'cid': '21472147', // Type for verifying OTP
      'phone_number': phoneNumber,
      'otp': otp,
    });

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);

      if (responseData is Map<String, dynamic>) {
        // Check the correct condition based on the actual API response
        if (responseData['error_mgs'] == null) {
          // OTP verification successful
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: const Color.fromARGB(255, 10, 115, 48),
              content: const Text(
                'Otp verified successfully',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );

          // Uncomment and navigate to the next screen if needed
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => TopicButton(), // Replace with your target screen
          //   ),
          // );
        } else {
          // Handle invalid OTP
          final errorMessage = responseData['error_mgs'] ?? 'Invalid OTP';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                errorMessage,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        }
      } else {
        // Handle unexpected response structure
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: const Text(
              'Unexpected response from the server.',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    } else {
      // Handle server-side or connection errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: const Text(
            'Failed to verify OTP. Please try again.',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      print('Failed to verify OTP: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            width: screenWidth,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/LoginpageBGimage.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: -screenHeight * 0.04,
            right: -screenWidth * 0.05,
            child: CircleAvatar(
              radius: screenWidth * 0.24,
              backgroundImage: const AssetImage('assets/Circle.png'),
            ),
          ),
          Positioned(
            top: screenHeight * 0.01,
            right: screenWidth * 0.02,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: screenWidth * 0.18,
              backgroundImage: const AssetImage('assets/FOXL Logo.png'),
            ),
          ),
          Positioned(
            top: screenHeight * 0.20,
            right: screenWidth * 0.045,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Enter OTP',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 26,
                      height: 40.35 / 26,
                      fontWeight: FontWeight.w700,
                    ),
                    // Aligns text to the left
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  const Text(
                    'Please Enter The 6 Digit Code Sent to',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    widget.phoneNumber,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.9,
                        child: OtpInputField(
                          otpController: otpController,
                          otpLength: 6,
                          validator: (value) {
                            // Call the validate function here
                            return _validateOtp(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  const Text(
                    'Resend Code',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Mybutton(
                    buttontext: 'VERIFY',
                    OnTap: () async {
                      String otp = otpController.text;
                      await verifyOtp(widget.phoneNumber, otp);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
