import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taw_mvvm/ui/providers/bmi_provider.dart';
import 'package:taw_mvvm/ui/providers/food_api_provider.dart';
import 'package:taw_mvvm/ui/screens/bmi_screen.dart';
import 'package:taw_mvvm/ui/screens/search_foods_screen.dart';
import 'package:taw_mvvm/ui/screens/splash_screen.dart';
import '/ui/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(create: (_) => BmiProvider()),
        ListenableProvider(create: (_) => FoodApiProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            useMaterial3: true,
            appBarTheme: const AppBarTheme(backgroundColor: Colors.deepPurple)),
        routes: {
          "/": (context) => const SplashScreen(),
          MainScreen.routeName: (context) => const MainScreen(),
          BmiScreen.routeName: (context) => const BmiScreen(),
          SearchFoodsScreen.routeName: (context) => const SearchFoodsScreen(),
        },
      ),
    );
  }
}
