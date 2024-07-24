// import 'package:get/get.dart';
// import 'dart:convert';

// class AIController extends GetxController {
//   final String apiKey = 'AIzaSyDzVQPzYcErrnubyy9UmPcDzfmC8hkeQZM';
//   final GenerativeAiClient _client;

//   AIController()
//       : _client = GenerativeAiClient(apiKey: apiKey);

//   Future<Map<String, dynamic>> generateGame(String topic, int numGuesses) async {
//     final prompt = 'Generate a word guessing game. Provide a hint for the topic "$topic" and a list of words related to this topic. The number of guesses allowed is $numGuesses. Format the response as JSON with fields "hint" and "words".';

//     try {
//       final response = await _client.generateText(
//         model: 'gemini-1.5-flash-latest',
//         prompt: prompt,
//         maxTokens: 150,
//       );

//       if (response != null && response.choices.isNotEmpty) {
//         final textResponse = response.choices.first.text;
//         return jsonDecode(textResponse);
//       } else {
//         print('Error: No valid response from the API');
//         throw Exception('Failed to generate game data');
//       }
//     } catch (error) {
//       print('Error: $error');
//       throw Exception('Failed to generate game data');
//     }
//   }
// }
