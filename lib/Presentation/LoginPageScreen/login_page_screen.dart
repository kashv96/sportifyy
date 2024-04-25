import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 24.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              const SizedBox(height: 24),
              const Text(
                'Discover Local Sports!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30, // Slightly larger for emphasis
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Join local sports activities effortlessly.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54, // Darker for better contrast
                ),
              ),
              const SizedBox(height: 32),
              _buildTextField(label: 'Username'),
              const SizedBox(height: 16),
              _buildTextField(label: 'Password', obscureText: true),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Implement login logic
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black, // Text color
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  minimumSize: const Size(double.infinity, 50), // Full width
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Log in', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Forgot password logic
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, // No padding to align text left
                  alignment: Alignment.centerLeft,
                ),
                child: const Text(
                  'Forgot your login details?',
                  style: TextStyle(color: Colors.black87), // Darker text
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(child: Divider(color: Colors.black54)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'or  join  now',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.black54)),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildSocialButton(
                    label: 'Google',
                    onPressed: () {
                      // Google login logic
                    },
                  ),
                  _buildSocialButton(
                    label: 'Facebook',
                    onPressed: () {
                      // Facebook login logic
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              InkWell(
                onTap: () => Navigator.of(context).pushNamed('/signup'),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                        text: 'New to Sportifyy? ',
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Create Account',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ])),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25), // Slightly less rounded
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black, // Button background color
        shape: const StadiumBorder(),
        minimumSize: const Size(130, 50), // Larger size
      ),
      child: Text(
        label,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
