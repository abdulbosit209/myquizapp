import 'package:flutter/material.dart';
import 'package:myquizapp/utils/colors.dart';
import 'package:myquizapp/utils/icons.dart';
import 'package:myquizapp/utils/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VariantItem extends StatelessWidget {
  const VariantItem({
    Key? key,
    required this.variantText,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final String variantText;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: MyColors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 7,
                spreadRadius: 5,
                color: Colors.grey.shade300,
                offset: const Offset(1, 3)),
          ],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                variantText,
                style: MyTextStyle.interMedium500
                    .copyWith(color: Colors.black, fontSize: 16),
                maxLines: 10,
              ),
            ),
            isSelected
                ? SvgPicture.asset(
                    MyIcons.tick,
                    width: 30,
                    height: 30,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
