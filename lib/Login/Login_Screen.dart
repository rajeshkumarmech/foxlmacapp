import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Bottom_Navigation.dart';
import '../Chits/chits.dart';
import '../Google_signIn_Button_reuseable.dart';
import '../InputTextField.dart';
import '../Text_Button.dart';
import 'Button_Reuseable.dart';
import 'Forgot_password.dart';
import 'Phone_Number_Login.dart';
import 'Sign_Up_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController useridcontroller = TextEditingController();
  TextEditingController userpsdcontroller = TextEditingController();
  bool value = false;
  final _formKey = GlobalKey<FormState>();

  // Regular expression for email validation
  final RegExp _emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  // Regular expression for phone number validation (10 digits, starting with [6-9])
  final RegExp _phoneRegExp = RegExp(
    r'^[0-9]\d{9}$',
  );

  // Validation function

  String? _validateInput(String value) {
    if (value.isEmpty) {
      return 'Please enter an email or phone number';
    } else if (_phoneRegExp.hasMatch(value)) {
      if (value.length != 10) {
        return 'Phone number must be exactly 10 digits';
      }
    } else if (!_emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email or phone number';
    }
    return null;
  }

  Future<void> _submit() async {
    if (_formKey.currentState?.validate() == true) {
      try {
        const String url =
            'https://chitsoft.in/wapp/api/mobile3/login_user_api.php';

        final String userId = useridcontroller.text;
        final String userPassword = userpsdcontroller.text;
        final response = await http.post(
          Uri.parse(url),
          // headers: {
          //   'Content-Type': 'application/json', // Specify JSON content type
          // },
          body: jsonEncode({
            'user': userId,
            'password': userPassword,
          }),
        );
        print(response.body);
        if (response.statusCode == 200) {
          final Map<String, dynamic> responseData = jsonDecode(response.body);
          final errorMsg = responseData['error_msg'] ?? 'Unknownerror';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMsg),
            ),
          );
          useridcontroller..clear();
          userpsdcontroller.clear();

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Bottomnavbar(),
            ),
          );
        } else if (response.statusCode == 400) {
          final Map<String, dynamic> responseData = jsonDecode(response.body);
          final errorMsg = responseData['error_msg'] ?? 'Unknownerror';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMsg),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${response.statusCode}'),
            ),
          );
        }
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
          ),
        );
      }
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Enter valid Username and Password",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen height and width using MediaQuery
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
              backgroundColor: const Color.fromARGB(255, 36, 63, 121),
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
            top: screenHeight * 0.18,
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
                      textAlign: TextAlign.left, // Aligns text to the left
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
                          'User Name :',
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
                        hint: 'Enter user name',
                        controller: useridcontroller,
                        validator: (value) {
                          if(value==null){
                            return "Enter a valid user id";
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: SizedBox(
                      width: screenWidth * 0.9,
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password :',
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
                        hint: 'Enter Password',
                        controller: userpsdcontroller,
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Password';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: SizedBox(
                      width: screenWidth * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: screenHeight * 0.03,
                                  width: screenHeight * 0.03,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2.0),
                                    borderRadius: BorderRadius.circular(3.0),
                                    color: Colors.white,
                                  ),
                                  child: Transform.scale(
                                    scale: 1.1,
                                    child: Checkbox(
                                      checkColor: Colors.black,
                                      side:
                                          const BorderSide(color: Colors.white),
                                      value: value,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          value = newValue!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Remember Me',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordScreen()),
                              );
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Mybutton(
                    buttontext: 'LOGIN',
                    OnTap: () async {
                      await _submit();
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
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
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhoneLoginScreen()));
                    },
                    child: const Text(
                      'Login with Phone number',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  GoogleSigninButton(
                    Googletext: 'Sign in with Google',
                    imagePath: 'assets/GoogleImage.png',
                    GoogleSignin: () {},
                  ),
                  TextButtonUser(
                    textreg: 'Sign up',
                    newbuttonregister: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
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
