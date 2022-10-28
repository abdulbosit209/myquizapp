import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myquizapp/utils/icons.dart';

import '../utils/styles.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    Key? key,
    required this.totalQuestionCount,
    required this.trueAnswersCount,
  }) : super(key: key);

  final int totalQuestionCount;
  final int trueAnswersCount;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Lottie.asset(MyIcons.resultLottie),
            Expanded(child: Text( "Congratulations, true answers count: ${widget.trueAnswersCount}",
              style: MyTextStyle.interSemiBold600.copyWith(fontSize: 20),),)
          ],
        ),
      ),
    );
  }
}
