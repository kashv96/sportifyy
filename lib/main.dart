import 'package:flutter/material.dart';
import 'package:sportifyy/Presentation/HomePageScreen/home_page_screen.dart';
import 'package:sportifyy/Presentation/WelcomeScreen/welcome_screen.dart';
import 'package:sportifyy/injection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'Presentation/LoginPageScreen/login_page_screen.dart';
import 'Presentation/SignUpScreen/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://dluqsheaszradbvoinev.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRsdXFzaGVhc3pyYWRidm9pbmV2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDMzODcxNTgsImV4cCI6MjAxODk2MzE1OH0.ApCNj6wbwc0WqlSa0cEe8hCHdjn_rm8NwyJV_GIcVQI',
  );
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ballzy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        ),
      ),
      home: HomePageScreen(),
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/home': (context) => HomePageScreen()
      },
    );
  }
}
