import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    var screenWidth = size.width;

    return Scaffold(
      backgroundColor: Colors
          .white, // Set the background color to match the animation background
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/json/player_animation.json',
            width: screenWidth,
            height: screenHeight * 0.4, // Adjusted for aspect ratio
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 36), // Add a little top margin to the text
          const Text(
            'Sportifyy',
            style: TextStyle(
              fontSize: 36, // Adjust font size as needed
              fontWeight: FontWeight
                  .w800, // Set to FontWeight.w500 for a medium bold look
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 14.0),
            child: Text(
              'Join sports events effortlessly',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors
                    .black54, // Adjust the text color to give a softer look
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 32.0, horizontal: 50.0), // Add more margin as needed
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black, // Button text color
                minimumSize: const Size(
                    double.infinity, 50), // Set the button to be a bit larger
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20), // Increase text size inside the button
              ),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/signup'); // Navigate to the login route
              },
              child: const Text('Get Started'),
            ),
          ),
        ],
      ),
    );
  }
}
