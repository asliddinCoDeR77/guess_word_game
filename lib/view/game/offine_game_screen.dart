import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guess_word_app/controller/offine_game_controller.dart';
import 'package:guess_word_app/view/widgets/keybord_widget.dart';
import 'package:guess_word_app/view/widgets/question_widget.dart';

class OffineGameScreen extends StatelessWidget {
  OffineGameScreen({super.key});

  final QuizeGetxController getxcontroller = Get.put(QuizeGetxController());
  final questionController = TextEditingController();
  final answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          final quizes = getxcontroller.quizes;
          final index = getxcontroller.index.value;

          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  "assets/images/background.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 60,
                right: 140,
                child: Container(
                  width: 80,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      (index + 1).toString(),
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 70,
                left: 15,
                child: Container(
                  width: 80,
                  height: 33,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 20,
                          color: Colors.yellow,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "1",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 70,
                right: 15,
                child: Container(
                  width: 80,
                  height: 33,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10, right: 5),
                    child: Row(
                      children: [
                        Text(
                          "50",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.diamond_outlined,
                          size: 25,
                          color: Color.fromARGB(255, 234, 74, 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Image.asset(
                      "assets/images/wait.gif",
                      width: 300,
                      height: 300,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Text(
                        quizes[index].question,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    AnswerWidget(
                      countLength: quizes[index].answer.length,
                    ),
                    const SizedBox(height: 100),
                    SingleChildScrollView(
                      child: KeybordWidget(
                        textKeybord: quizes[index].answer,
                        answerLength: quizes[index].answer.length,
                      ),
                    ),
                  ],
                ),
              ),
              if (index == quizes.length - 1)
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120, 120),
                      shape: BeveledRectangleBorder(),
                    ),
                    onPressed: () {
                      getxcontroller.restartQuiz();
                    },
                    child: Icon(
                      Icons.restart_alt_outlined,
                      size: 34,
                    ),
                  ),
                ),
            ],
          );
        },
      ),

      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: const Color.fromARGB(91, 33, 149, 243),
      //   onPressed: () {
      //     Get.defaultDialog(
      //       backgroundColor: const Color.fromARGB(237, 65, 166, 248),
      //       title: "Add Quiz",
      //       titleStyle: const TextStyle(color: Colors.white),
      //       content: Padding(
      //         padding: const EdgeInsets.all(10),
      //         child: Column(
      //           children: [
      //             const SizedBox(height: 20),
      //             TextFormField(
      //               controller: questionController,
      //               keyboardType: TextInputType.name,
      //               decoration: InputDecoration(
      //                 border: OutlineInputBorder(
      //                   borderRadius: BorderRadius.circular(8),
      //                 ),

      //                 labelText: "Input Question",
      //                 labelStyle: const TextStyle(
      //                   color: Colors.white,
      //                 ),
      //               ),
      //             ),
      //             const SizedBox(height: 20),
      //             TextFormField(
      //               controller: answerController,
      //               keyboardType: TextInputType.name,
      //               decoration: InputDecoration(
      //                 border: OutlineInputBorder(
      //                   borderRadius: BorderRadius.circular(8),
      //                 ),
      //                 labelText: "Input Answer",
      //                 labelStyle: const TextStyle(
      //                   color: Colors.white,
      //                 ),
      //               ),
      //             ),
      //             const SizedBox(height: 50),
      //           ],
      //         ),
      //       ),
      //       textConfirm: "Add",
      //       onConfirm: () {
      //         getxcontroller.addQuize(
      //           questionController.text,
      //           answerController.text,
      //         );
      //         Get.back();
      //       },
      //       textCancel: "Cancel",
      //     );
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
