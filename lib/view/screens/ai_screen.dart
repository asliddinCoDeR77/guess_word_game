// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:guess_word_app/controller/ai_controller.dart';
// import 'package:guess_word_app/view/game/game_screen.dart';

// class AiScreen extends StatefulWidget {
//   const AiScreen({super.key});

//   @override
//   State<AiScreen> createState() => _ChooseOptionScreenState();
// }

// class _ChooseOptionScreenState extends State<AiScreen> {
//   final TextEditingController topicController = TextEditingController();
//   final TextEditingController guessesController = TextEditingController();
//   final AIController aiController = Get.put(AIController());

//   void generateGame() async {
//     final topic = topicController.text.trim();
//     final numGuesses = int.tryParse(guessesController.text) ?? 0;

//     if (topic.isEmpty || numGuesses <= 0) {
//       Get.snackbar('Error', 'Please enter a valid topic and number of guesses.');
//       return;
//     }

//     try {
//       final gameData = await aiController.generateGame(topic, numGuesses);
//       Get.to(() => GameScreen(gameData: gameData));
//     } catch (error) {
//       Get.snackbar('Error', 'Failed to generate game. Please try again.');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           // Background image
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/background.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           // Content
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   'Enter Topic and Number of Guesses',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 20),
//                 TextField(
//                   controller: topicController,
//                   decoration: const InputDecoration(
//                     labelText: 'Enter Topic',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 TextField(
//                   controller: guessesController,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                     labelText: 'Enter Number of Guesses',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: generateGame,
//                   child: const Text('Generate Game'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
