import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/views/searchview.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff005f83),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/weather.jpg"),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: SizedBox(
                height: 80,
                child: AnimatedTextKit(animatedTexts: [
                  TypewriterAnimatedText(
                    "Discover the weather in your city ",
                    textStyle: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontFamily: "PlayfairDisplay",
                        fontWeight: FontWeight.bold),
                    speed: Duration(milliseconds: 100),
                  ),
                  TyperAnimatedText(
                    "Start the search by pressing on get started below...",
                    textStyle: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontFamily: "PlayfairDisplay",
                        fontWeight: FontWeight.bold),
                    speed: const Duration(milliseconds: 100),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  builder: (context) {
                    return const Searchview();
                  },
                ), (route) => false);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: double.infinity,
                  height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(colors: [
                      Color(0xff22a0b6),
                      Color(0xff99dfe3),
                    ]),
                  ),
                  child: const Text(
                    "Get started",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
