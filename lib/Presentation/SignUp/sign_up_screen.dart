// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:sportifyy/Presentation/HomePage/home_page_screen.dart';
import 'package:sportifyy/Presentation/Welcome/welcome_screen.dart';
import 'package:sportifyy/Providers/user_provider.dart';
import 'package:sportifyy/Widgets/loading_diaglog.dart';
import 'package:sportifyy/Widgets/toast_helper.dart';
import 'package:sportifyy/injection.dart';

import '../../Widgets/custom_text_field.dart';

class SignUpPage extends StatefulWidget with GetItStatefulWidgetMixin {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with GetItStateMixin {
  final UserProvider _userProvider = getIt();
  bool isPlayer = true;
  String? _emailError;
  String? _phoneError;
  String? _usernameError;

  void _handleSignUp(BuildContext context) async {
    LoadingDialog.show(context, message: "Loading your profile...");
    try {
      await _userProvider.signUp();
      await Future.delayed(const Duration(seconds: 2));
      LoadingDialog.hide(context);
      ToastHelper.show('Sign up successful!', textColor: Colors.green);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePageScreen()),
      );
    } on Exception catch (e) {
      LoadingDialog.hide(context);
      setState(() {
        if (e.toString().contains('Email')) {
          _emailError = 'Email already in use';
        } else if (e.toString().contains('Phone number')) {
          _phoneError = 'Phone number already in use';
        } else if (e.toString().contains('Username')) {
          _usernameError = 'Username already taken';
        } else {
          ToastHelper.show(e.toString(), textColor: Colors.red);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/sign_up_page_image.png',
                    height: 120,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Sportifyy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Join now to discover local sports activities!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: screenSize.height * 0.8,
              padding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 34.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  SwitchListTile(
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.black,
                    activeColor: Colors.white,
                    activeTrackColor: Colors.black,
                    title: Text(
                        isPlayer ? 'Sign up as Player' : 'Sign up as Organizer',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        )),
                    value: isPlayer,
                    onChanged: (bool value) {
                      setState(() {
                        isPlayer = value;
                        _userProvider.setIsPlayer(value);
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    label: 'Username',
                    onChanged: (val) => _userProvider.setUsername(val),
                    errorText: _usernameError,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                      label: 'Password',
                      onChanged: (val) => _userProvider.setPassword(val),
                      obscureText: true),
                  const SizedBox(height: 20),
                  CustomTextField(
                      label: 'Full Name',
                      onChanged: (val) => _userProvider.setFullName(val)),
                  const SizedBox(height: 20),
                  CustomTextField(
                    label: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (val) => _userProvider.setEmail(val),
                    errorText: _emailError,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                      label: 'Phone Number',
                      keyboardType: TextInputType.phone,
                      onChanged: (val) => _userProvider.setPhoneNumber(val),
                      errorText: _phoneError,
                      inputFormatters: [
                        FilteringTextInputFormatter
                            .digitsOnly, // Ensures only digits are entered
                        LengthLimitingTextInputFormatter(
                            10), // Limits to 10 digits
                      ]),
                  const SizedBox(height: 35),
                  ElevatedButton(
                    onPressed: () {
                      _handleSignUp(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Join',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed('/login'),
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                            text: 'Already have an account? ',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 16),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Sign In',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ])),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
