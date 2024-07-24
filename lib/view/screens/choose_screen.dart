import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guess_word_app/view/game/offine_game_screen.dart';

class ChooseOptionScreen extends StatefulWidget {
  const ChooseOptionScreen({super.key});

  @override
  State<ChooseOptionScreen> createState() => _ChooseOptionScreenState();
}

class _ChooseOptionScreenState extends State<ChooseOptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _build3DButton('START WITH AI', () {
                  print('START WITH AI button pressed');
                }),
                const SizedBox(height: 20),
                _build3DButton('START OFFLINE', () {
                  Get.to(OffineGameScreen());
                  print('START OFFLINE button pressed');
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _build3DButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
