import 'package:DevQuiz/shared/models/user_model.dart';

import '../../../core/core.dart';
import 'package:flutter/material.dart';


class ChartWidget extends StatelessWidget {
  final UserModel user;
  const ChartWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: Stack(children: [
        Center(
          child: Container(
            height: 80,
            width: 80,
            child: CircularProgressIndicator(
              strokeWidth: 10,
              value: user.score,
              backgroundColor: AppColors.chartSecondary,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
            ),
          ),
        ),
        Center(
            child: Text(
              "${user.score.toString().substring(2)}%",
              style: AppTextStyles.heading,
            )
        )
      ]),
    );
  }
}