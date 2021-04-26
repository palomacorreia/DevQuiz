import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/home/challenge_controller.dart';
import 'package:DevQuiz/result/result_page.dart';
import 'package:DevQuiz/shared/models/question_model.dart';

import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;
  const ChallengePage({Key? key, required this.questions, required this.title})
      : super(key: key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
        duration: Duration(milliseconds: 100),
        curve: Curves.linear,
      );
  }

  void onSelected(bool value) {
    if (value) {
      controller.amountAnswersRight++;
    }
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: value,
                  length: widget.questions.length,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map((quizz) => QuizWidget(
            title: quizz.title,
            question: quizz,
            onSelected: onSelected,
          ),
        ).toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: ValueListenableBuilder<int>(
          valueListenable: controller.currentPageNotifier,
          builder: (BuildContext context, value, Widget? child) =>
          value == widget.questions.length
              ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: NextButtonWidget.green(
                  label: 'Confirmar',
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ResultPage(
                          title: widget.title,
                          length: widget.questions.length,
                          result: controller.amountAnswersRight,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )
              : Row(
            children: [
              Expanded(
                child: NextButtonWidget.white(
                  label: 'Pular',
                  onTap: () {
                    nextPage();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}