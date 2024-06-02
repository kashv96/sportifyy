import 'package:flutter/material.dart';
import 'package:sportifyy/Presentation/GameEvent/add_game_event.dart';
import 'package:sportifyy/Presentation/HomePage/home_page_screen.dart';
import 'package:sportifyy/Presentation/Welcome/welcome_screen.dart';
import 'package:sportifyy/Providers/game_provider.dart';
import 'package:sportifyy/Services/game_service.dart';
import 'package:sportifyy/injection.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'Presentation/LoginPage/login_page_screen.dart';
import 'Presentation/SignUp/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://awqcivkxfipobaquwaim.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF3cWNpdmt4Zmlwb2JhcXV3YWltIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTY3NjY4MDcsImV4cCI6MjAzMjM0MjgwN30.B9dXOLU6uCiYE887UW7gkYqbK_N5JDmm8D9PaBwA_AQ');
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => getIt<GameProvider>())],
      child: MaterialApp(
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
          '/home': (context) => HomePageScreen(),
          '/create-game-event': (context) => AddGameEventPage()
        },
      ),
    );
  }
}
