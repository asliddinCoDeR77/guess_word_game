import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guess_word_app/model/quiz_model.dart';

class QuizeGetxController extends GetxController {
  RxList<QuizeModel> quizes = <QuizeModel>[
    QuizeModel(question: "Who's best football player in world?", answer: "CR7"),
    QuizeModel(question: "HOW MANY B'DOR VAN BASTEN HAVE", answer: "3B'DOR"),
    QuizeModel(
        question: "Who won the FIFA World Cup in 2018?", answer: "France"),
    QuizeModel(
        question: "In which year was the first FIFA World Cup held?",
        answer: "1930"),
    QuizeModel(
        question:
            "Who is the all-time top scorer in UEFA Champions League history",
        answer: "Cristiano Ronaldo"),
  ].obs;

  RxList<String> tappedNum = <String>[].obs;
  RxInt index = 0.obs;

  void addQuize(String question, String answer) {
    quizes.add(
      QuizeModel(question: question, answer: answer),
    );
  }

  void restartQuiz() {
    index.value = 0;
  }

  void addTappedLetter(String letter) {
    if (tappedNum.length < quizes[index.value].answer.length) {
      tappedNum.add(letter);

      if (tappedNum.length == quizes[index.value].answer.length) {
        _checkAnswer();
      }
    }
  }

  void _checkAnswer() {
    final currentQuiz = quizes[index.value];
    final correctAnswer = currentQuiz.answer;
    final tappedAnswer = tappedNum.join();

    if (tappedAnswer == correctAnswer) {
      Get.defaultDialog(
        backgroundColor: Color.fromARGB(211, 255, 166, 0),
        title: "YOU ANSWERED CORRECTLY!",
        titleStyle: const TextStyle(color: Colors.blue),
        content: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                width: 110,
                height: 108,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.blue,
                  size: 90,
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
        confirm: FilledButton(
          style: FilledButton.styleFrom(backgroundColor: Colors.orange),
          onPressed: () {
            tappedNum.clear();
            if (index.value < quizes.length - 1) {
              index.value++;
            } else {
              Get.defaultDialog(
                title: "Quiz Finished",
                middleText: "You have completed the quiz!",
                confirm: FilledButton(
                  onPressed: () {
                    Get.back();
                    Get.back();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 20,
                      right: 20,
                    ),
                    child: Text("Ok"),
                  ),
                ),
              );
            }
            Get.back();
          },
          child: const Padding(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 20,
              right: 20,
            ),
            child: Text("Ok"),
          ),
        ),
      );
    } else {
      Get.defaultDialog(
        backgroundColor: Color.fromARGB(211, 255, 166, 0),
        title: "Unfortunalty you answer is incorrect!",
        titleStyle:
            const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        content: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                width: 110,
                height: 108,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: const Icon(
                  Icons.not_interested_outlined,
                  color: Colors.red,
                  size: 40,
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
        confirm: FilledButton(
          style: FilledButton.styleFrom(backgroundColor: Colors.orange),
          onPressed: () {
            tappedNum.clear();
            Get.back();
          },
          child: const Padding(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 20,
              right: 20,
            ),
            child: Text(
              "Ok",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
    }
  }
}
