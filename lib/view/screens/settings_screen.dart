import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:guess_word_app/view/screens/main_screen.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double _soundVolume = 0.5;
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playSound() async {
    await _audioPlayer.play(AssetSource('assets/sound/sound.mp3'),
        volume: _soundVolume);
    setState(() {
      _isPlaying = true;
    });
  }

  void _pauseSound() async {
    await _audioPlayer.pause();
    setState(() {
      _isPlaying = false;
    });
  }

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
            children: [
              SizedBox(
                height: 80.0,
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      Get.to(
                        const HomeScreen(),
                        transition: Transition.circularReveal,
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.blue,
                    ),
                  ),
                  title: const Text(
                    'Settings',
                    style: TextStyle(color: Colors.blue),
                  ),
                  centerTitle: true,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sound',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Adjust the sound volume:',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Slider(
                        activeColor: Colors.blue,
                        value: _soundVolume,
                        min: 0.0,
                        max: 1.0,
                        divisions: 10,
                        label: (_soundVolume * 100).round().toString(),
                        onChanged: (value) {
                          setState(() {
                            _soundVolume = value;
                          });
                          _audioPlayer.setVolume(_soundVolume);
                        },
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Current Volume: ${(_soundVolume * 100).round()}%',
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(390, 50),
                            backgroundColor: Colors.blue),
                        onPressed: _isPlaying ? _pauseSound : _playSound,
                        child: Text(
                          _isPlaying ? 'Pause Sound' : 'Play Sound',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
