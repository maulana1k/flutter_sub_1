import 'package:flutter/material.dart';
import 'package:flutter_submission_1/ui/home.dart';

class Onboard extends StatelessWidget {
  const Onboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(30),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Explore music on our planets",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(children: [
                Expanded(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0.0),
                            backgroundColor: MaterialStateProperty.all(Colors.white)),
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                        },
                        child: const Text(
                          "Get Started",
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                        ))),
              ]),
              const SizedBox(
                height: 20,
              ),
              RichText(
                  text: const TextSpan(text: "Doesnt have an account? ", children: [
                TextSpan(text: "Sign Up", style: TextStyle(fontWeight: FontWeight.bold))
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
