
import 'package:DevQuiz/challenge/widgets/answer/answer_widget.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/models/question_model.dart';

import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final String title;
  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  const QuizWidget(
      {Key? key,
        required this.title,
        required this.question,
        required this.onSelected})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int? indexSelected;

  awnsers(int index) => widget.question.awnsers[index];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 64),
            Text(
              widget.question.title,
              style: AppTextStyles.heading,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            for (var i = 0; i < widget.question.awnsers.length; i++)
              AnswerWidget(
                awnser: awnsers(i),
                disabled: indexSelected != null,
                isSelected: indexSelected == i,
                onTap: (value) {
                  indexSelected = i;
                  Future.delayed(Duration(seconds: 3));
                  setState(() {});
                  widget.onSelected(value);
                },
              )
          ],
        ),
      ),
    );
  }
}