import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taw_mvvm/ui/providers/bmi_provider.dart';
import 'package:taw_mvvm/ui/screens/bmi_screen.dart';
import 'package:taw_mvvm/ui/screens/search_foods_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static const routeName = "main-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<BmiProvider>(builder: (context, bmiProvider, _) {
              return Text(
                "Your BMI Score: ${bmiProvider.getBmi.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 42),
              );
            }),
            ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(BmiScreen.routeName),
                child: const Text(
                  "Calculate BMI",
                  textAlign: TextAlign.center,
                )),
            ElevatedButton(
                onPressed: () => Navigator.of(context)
                    .pushNamed(SearchFoodsScreen.routeName),
                child: const Text(
                  "Search Foods",
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
    );
  }
}
