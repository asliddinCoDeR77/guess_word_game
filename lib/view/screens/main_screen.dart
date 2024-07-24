import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guess_word_app/view/screens/choose_screen.dart';
import 'package:guess_word_app/view/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isPressedStart = false;
  bool _isPressedSettings = false;

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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/logo.png'))),
              ),
              const SizedBox(
                height: 53,
              ),
              _build3DButton('START GAME', _isPressedStart, () {
                setState(() {
                  _isPressedStart = true;
                });
                Future.delayed(const Duration(milliseconds: 100), () {
                  setState(() {
                    _isPressedStart = false;
                  });
                  Get.to(const ChooseOptionScreen());
                });
              }),
              const SizedBox(height: 30),
              _build3DButton('SETTINGS', _isPressedSettings, () {
                setState(() {
                  _isPressedSettings = true;
                });
                Future.delayed(const Duration(milliseconds: 100), () {
                  setState(() {
                    _isPressedSettings = false;
                  });
                  Get.to(const SettingsPage(),
                      transition: Transition.circularReveal);
                });
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _build3DButton(String text, bool isPressed, VoidCallback onTap) {
    return AnimatedScale(
      scale: isPressed ? 0.9 : 1.0,
      duration: const Duration(milliseconds: 100),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 200,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(3, 9),
                blurRadius: 23,
              ),
            ],
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
