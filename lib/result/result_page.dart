import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:DevQuiz/core/core.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;

  const ResultPage({
    Key? key,
    required this.title,
    required this.length,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text(
                  result == 0 ? 'Não fique triste' : 'Parabéns!',
                  style: AppTextStyles.heading40,
                ),
                SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                    text: result == 0
                        ? 'Leve esse resultado como aprendizado, \n e estude os assuntos que você nao acertou'
                        : 'Você concluiu nosso desafio! ',
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(
                        text: '\n $title ',
                        style: AppTextStyles.bodyBold,
                      ),
                      TextSpan(
                        text: 'com $result de $length acertos!',
                        style: AppTextStyles.bodyBold,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68.0),
                        child: NextButtonWidget.purple(
                          label: 'Compartilhar',
                          onTap: () {
                           /* Share.share(
                              'DevQuiz NLW 5 - Flutter: Resultado do Quiz $title\n Obtive ${result / length}% de acertos!',
                            );*/
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68.0),
                        child: NextButtonWidget.transparent(
                          label: 'Voltar ao inicio',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}