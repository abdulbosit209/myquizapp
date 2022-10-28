import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myquizapp/global_widgets/my_custom_app_bar.dart';
import 'package:myquizapp/global_widgets/my_custom_button.dart';
import 'package:myquizapp/global_widgets/my_custom_input.dart';
import 'package:myquizapp/screens/sms_code_screen.dart';
import 'package:myquizapp/utils/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:myquizapp/utils/icons.dart';
import 'package:myquizapp/utils/styles.dart';
import 'package:myquizapp/utils/utility_function.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController textController = TextEditingController();
  late final focusNode;

  @override
  void initState() {
    focusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyCustomAppBar(
        title: "Login",
      ),
      backgroundColor: MyColors.white,
      body: Column(
        children: [
          Lottie.asset(MyIcons.loginLottie),
          SizedBox(height: 30.h),
          Padding(padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: MyCustomInput(
              hintText: 'Enter your mobile number',
              textController: textController,
              keyType: TextInputType.phone,
              valueChanged: (value) {
                if (value.length == 13) {
                  focusNode.unfocus();
                }
              },
              focusNode: focusNode,
              isPassword: false,
            ),
          ),
          SizedBox(height: 50.h),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: MyCustomButton(
              buttonText: "Login",
              onTap: () {
                if (textController.text == "+998991234567") {
                  UtilityFunction.getMyToast(message: "Enter SMS Code!");
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return const SMSCodeScreen();
                      }));
                } else {
                  UtilityFunction.getMyToast(message: "Invalid number!");
                }
              },
            ),
          ),
          Expanded(child: SizedBox()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.h),
            child: Text(
              "term’s and conditons apply  POWERD BY - sparrowdevops.com",
              textAlign: TextAlign.center,
              style: MyTextStyle.interRegular400.copyWith(
                  fontSize: 16.sp,
                  color: MyColors.black.withOpacity(0.5)
              ),),
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
