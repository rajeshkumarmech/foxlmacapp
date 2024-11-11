import 'package:macfoxl/Google_signIn_Button_reuseable.dart';
import 'package:macfoxl/InputTextField.dart';
import 'package:macfoxl/Login/Button_Reuseable.dart';
import 'package:macfoxl/Login/OTP_Screen.dart';
import 'package:macfoxl/Text_Button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController regmobilecontroller = TextEditingController();
  TextEditingController regnamecontroller = TextEditingController();
  TextEditingController regemailcontroller = TextEditingController();

  bool value = false;
  final _formKey = GlobalKey<FormState>();

  final RegExp _emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  final RegExp _phoneRegExp = RegExp(
    r'^[0-9]\d{9}$',
  );

  // Validation function
  String? _validateReg(String value) {
    if (value.isEmpty) {
      return 'Please enter an E-mail';
      // } else if (_phoneRegExp.hasMatch(value)) {
      //   if (value.length != 10) {
      //     return 'Phone number must be exactly 10 digits';
      //   }
    } else if (!_emailRegExp.hasMatch(value)) {
      return 'Please enter a valid Email';
    }
    return null;
  }

  Future<void> _Rsubmit() async {
    const String url = 'https://chitsoft.in/wapp/api/mobile2/verify_user.php';
    try {
      if (_formKey.currentState?.validate() == true) {
        regemailcontroller.text = '';
        regmobilecontroller.text = '';
        regnamecontroller.text = '';
        final response = await http
            .post(Uri.parse(url), body: {'type': '2', 'cid': '21472147'});

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OTPScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              ' Enter a valid user ID and password',
            ),
          ),
        );
      }
    } catch (error) {}
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
            top: screenHeight * 0.2,
            right: -screenWidth * 0.04,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Create a New Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 26,
                      height: 40.35 / 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  SizedBox(
                    width: screenWidth * 0.9,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Name',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  SizedBox(
                    width: screenWidth * 0.9,
                    child: InputTextField(
                      hint: 'Name',
                      controller: regnamecontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your User id';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  SizedBox(
                    width: screenWidth * 0.9,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'E-Mail',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  SizedBox(
                    width: screenWidth * 0.9,
                    child: InputTextField(
                      hint: 'E-Mail',
                      controller: regemailcontroller,
                      validator: (value) => _validateReg(value ?? ''),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  SizedBox(
                    width: screenWidth * 0.9,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Mobile',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  SizedBox(
                    width: screenWidth * 0.9,
                    child: InputTextField(
                      hint: 'Mobile',
                      controller: regmobilecontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Phone number';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Mybutton(
                    buttontext: 'REGISTER',
                    OnTap: () {
                      _Rsubmit();
                    },
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: screenWidth * 0.5,
                        height: 0.5,
                        color: const Color(0xff514B6B),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'Or',
                        style: TextStyle(
                          color: Color(0xff514B6B),
                          fontSize: 12,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        width: screenWidth * 0.5,
                        height: 0.5,
                        color: const Color(0xff514B6B),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  GoogleSigninButton(
                    Googletext: 'Sign in with Google',
                    imagePath: 'assets/GoogleImage.png',
                    GoogleSignin: () {},
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  TextButtonUser(
                    textreg: 'Sign in',
                    newbuttonregister: () {},
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
