import 'package:advansed_app/core/widgets/app_text_button.dart';
import 'package:advansed_app/core/widgets/app_text_form_filed.dart';
import 'package:advansed_app/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:advansed_app/helpers/spacing.dart';
import 'package:advansed_app/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theming/colors.dart';
import 'widgets/dont_have_account_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObsureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Wlcome Back',
                style: TextStyles.font24BlueBold,
              ),
              verticalSpace(8),
              Text(
                'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                style: TextStyles.font14GrayRegular,
              ),
              verticalSpace(36),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const AppTextFormField(
                        hintText: 'Email',
                        backgroundColor: ColorsManager.moreLightGray,
                      ),
                      verticalSpace(18),
                      AppTextFormField(
                        hintText: 'Password',
                        backgroundColor: ColorsManager.moreLightGray,
                        isObscureText: isObsureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObsureText = !isObsureText;
                            });
                          },
                          child: Icon(
                            isObsureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      verticalSpace(24),
                      Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text('Forgot Password?',
                              style: TextStyles.font13BlueRegular)),
                      verticalSpace(40),
                      AppTextButton(
                          buttonText: 'Login',
                          textStyle: TextStyles.font16WhiteSemiBold,
                          onPressed: () {}),
                      verticalSpace(16),
                      const TermsAndConditionsText(),
                      verticalSpace(60),
                      const DontHaveAccountText()
                    ],
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
