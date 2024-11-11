import 'dart:async';
import 'dart:convert';

import 'package:macfoxl/InputTextField.dart';
import 'package:macfoxl/Login/Button_Reuseable.dart';
import 'package:macfoxl/Login/OTP_Phone_Number.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PhoneLoginScreen extends StatefulWidget {
  PhoneLoginScreen({super.key});

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  TextEditingController Phonenumbercontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String phoneNumber = '';

  // Regular expression for phone number validation (10 digits)
  final RegExp _phoneRegExp = RegExp(
    r'^[0-9]{10}$',
  );

  // Validation function for phone number
  String? _validateInput(String value) {
    if (value.isEmpty) {
      return 'Please enter a phone number';
    } else if (value.length != 10) {
      return 'Phone number must be exactly 10 digits';
    } else if (!_phoneRegExp.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  // Submit function to send phone number and request OTP
  Future<void> _submit(String phonenumber) async {
    var url = Uri.parse('https://chitsoft.in/wapp/api/mobile2/index.php');

    // Log the phone number and URL for debugging
    print('Sending request to: $url');
    print('Phone number: +91${Phonenumbercontroller.text}');

    var response = await http.post(
      url,
      body: jsonEncode(<String, String>{
        'type': '2',
        'cid': '21472147',
        'mobile': '9500981938',
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print('Response from API: $jsonResponse');

      if (jsonResponse['otp'] == true) {
        // OTP successfully sent
        print('OTP sent successfully');
        Phonenumbercontroller.clear(); // Clear input field

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('OTP sent successfully.'),
          ),
        );

        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PhoneOTPScreen(
              phoneNumber: '+91${Phonenumbercontroller.text}',
            ),
          ),
        );
      } else {
        // Error in sending OTP
        print('OTP not sent, check server response');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to send OTP. Please try again.'),
          ),
        );
      }
    } else {
      // Handle HTTP error
      print('Error: ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error ${response.statusCode}: Failed to send the phone number. Please try again.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen height and width
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
              backgroundColor: Color.fromARGB(255, 36, 63, 121),
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
            right: -screenWidth * 0.035,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      'Welcome Back',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 30,
                        height: 40.35 / 30,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.06),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: SizedBox(
                      width: screenWidth * 0.9,
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Mobile number',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: SizedBox(
                      width: screenWidth * 0.9,
                      child: InputTextField(
                        hint: 'Enter Mobile no:',
                        controller: Phonenumbercontroller,
                        // validator: (value) => _validateInput(value ?? ''),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  const SizedBox(height: 20),
                  Mybutton(
                    buttontext: 'Send',
                    OnTap: () async {
                      await _submit(Phonenumbercontroller
                          .text); // Await the asynchronous function inside a synchronous handler
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
