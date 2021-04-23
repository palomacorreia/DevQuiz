import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/home/widgets/level_button/level_button_widget.dart';
import 'package:DevQuiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:DevQuiz/shared/enum/home_state_enum.dart';
import 'package:flutter/material.dart';

import 'home_controller.dart';
import 'widgets/app_bar/app_bar_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeControler();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
          appBar: AppBarWidget(user: controller.user!),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LevelButtonWidget(title: "Fácil"),
                    LevelButtonWidget(title: "Médio"),
                    LevelButtonWidget(title: "Difícil"),
                    LevelButtonWidget(title: "Perito"),
                  ],
                ),
                SizedBox(height: 24),
                Expanded(
                    child: GridView.count(
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      crossAxisCount: 2,
                      children: controller.quizzes!
                          .map((quiz) => QuizCardWidget(
                        title: quiz.title,
                        percent:
                        quiz.questionAnswered / quiz.questions.length,
                        questionAnswered:
                        "${quiz.questionAnswered}/${quiz.questions.length}",
                      ))
                          .toList(),
                    )),
              ],
            ),
          ));
    } else {
      return Scaffold(
        body: Center(
            child: CircularProgressIndicator(
                valueColor:
                AlwaysStoppedAnimation<Color>(AppColors.darkGreen))),
      );
    }
  }
}