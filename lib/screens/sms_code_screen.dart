import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myquizapp/global_widgets/my_custom_app_bar.dart';
import 'package:myquizapp/global_widgets/my_custom_button.dart';
import 'package:myquizapp/screens/registration_screen.dart';
import 'package:myquizapp/utils/colors.dart';
import 'package:myquizapp/utils/icons.dart';
import 'package:myquizapp/utils/styles.dart';
import 'package:myquizapp/utils/utility_function.dart';
import 'package:sms_autofill/sms_autofill.dart';

class SMSCodeScreen extends StatefulWidget {
  const SMSCodeScreen({Key? key}) : super(key: key);

  @override
  State<SMSCodeScreen> createState() => _SMSCodeScreenState();
}

class _SMSCodeScreenState extends State<SMSCodeScreen> {
  final TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    textController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyCustomAppBar(
        title: 'Otp',
      ),
      backgroundColor: MyColors.white,
      body: Column(
        children: [
          SizedBox(
            height: 60.h,
          ),
          Image.asset(MyIcons.logo),
          SizedBox(
            height: 130.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Text(
              "Enter your 6 digit here",
              textAlign: TextAlign.center,
              style: MyTextStyle.interRegular400.copyWith(
                  fontSize: 20.sp, color: MyColors.black.withOpacity(0.5)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90),
            child: PinFieldAutoFill(
              codeLength: 6,
              focusNode: focusNode,
              controller: textController,
              decoration: UnderlineDecoration(
                  textStyle: MyTextStyle.interBold700
                      .copyWith(fontSize: 20, color: Colors.black),
                  colorBuilder: const FixedColorBuilder(Colors.black)),
              onCodeSubmitted: (value) {
                focusNode.unfocus();
              },
              onCodeChanged: (value) {
                if (value?.length == 6) {
                  focusNode.unfocus();
                }
              },
            ),
          ),
          SizedBox(height: 50.h),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: MyCustomButton(
              buttonText: "Login",
              onTap: (){
                if(textController.text == "123456"){
                  UtilityFunction.getMyToast(message: "Enter personal info!");
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
                    return const RegistrationScreen();
                  }));
                }else{
                  UtilityFunction.getMyToast(message: "Invalid password");
                }
              },
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Text(
              "login with social media",
              textAlign: TextAlign.center,
              style: MyTextStyle.interRegular400.copyWith(
                fontSize: 20.sp,
                color: MyColors.black.withOpacity(
                  0.5,
                ),
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          Image.asset(MyIcons.otp, height: 100, width: 100,)
        ],
      ),
    );
  }
}
