import 'package:DevQuiz/home/widgets/app_bar/app_bar_widget.dart';
import 'package:DevQuiz/home/widgets/level_button/level_button_widget.dart';
import 'package:DevQuiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LevelButtonWidget(label: "Facil"),
                LevelButtonWidget(label: "Medio"),
                LevelButtonWidget(label: "Dificil"),
                LevelButtonWidget(label: "Perito"),
              ],
            ),
            SizedBox(height:24),
            Expanded(
                child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: [
                      QuizCardWidget(),
                      QuizCardWidget(),
                      QuizCardWidget(),
                      QuizCardWidget(),
                    ])
            )
          ],
        ),
      ),
    );
  }
}