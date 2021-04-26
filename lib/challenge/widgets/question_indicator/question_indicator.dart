import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int length;

  const QuestionIndicatorWidget(
      {Key? key, required this.currentPage, required this.length})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Questão $currentPage', style: AppTextStyles.body),
                Text('de $length', style: AppTextStyles.body),
              ],
            ),
          ),
          ProgressIndicatorWidget(value: currentPage / length)
        ],
      ),
    );
  }
}