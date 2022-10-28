import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myquizapp/utils/styles.dart';

class SelectTestItem extends StatelessWidget {
  const SelectTestItem({
    Key? key,
    required this.gradientColors,
    required this.text,
    required this.questionCount,
    required this.iconPath,
    required this.direction,
    required this.onTab,
  }) : super(key: key);

  final List<Color> gradientColors;
  final String text;
  final int questionCount;
  final String iconPath;
  final int direction;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 35),
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: gradientColors)),
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Column(
                    crossAxisAlignment: direction == 1
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: [
                      Text(text,
                          style: MyTextStyle.interBold700
                              .copyWith(fontSize: 38.sp, color: Colors.white)),
                      const SizedBox(height: 5),
                      Text("Question Count: $questionCount ",
                          style: MyTextStyle.interBold700
                              .copyWith(fontSize: 20.sp, color: Colors.white))
                    ],
                  ),
                )),
              ],
            ),
          ),
          direction == 1
              ? Positioned(
                  right: 0,
                  top: 0,
                  child: Image.asset(
                    iconPath,
                    width: 100,
                    height: 100,
                  ),
                )
              : Positioned(
                  left: 0,
                  top: 0,
                  child: Image.asset(
                    iconPath,
                    width: 100,
                    height: 100,
                  ),
                )
        ],
      ),
    );
  }
}
