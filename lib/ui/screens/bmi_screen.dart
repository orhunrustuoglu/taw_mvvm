import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taw_mvvm/ui/providers/bmi_provider.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({super.key});
  static const routeName = "bmi-screen";

  @override
  Widget build(BuildContext context) {
    var wCont = TextEditingController();
    var hCont = TextEditingController();
    var aCont = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: wCont,
            ),
            TextField(
              controller: hCont,
            ),
            TextField(
              controller: aCont,
            ),
            ElevatedButton(
                onPressed: () =>
                    Provider.of<BmiProvider>(context, listen: false).setBmi(
                      int.parse(wCont.text),
                      int.parse(hCont.text),
                      int.parse(aCont.text),
                    ),
                child: const Text("press"))
          ],
        ),
      ),
    );
  }
}
