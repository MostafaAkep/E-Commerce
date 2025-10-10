import 'package:e_commerce_app/core/navigation/app_router.dart';
import 'package:e_commerce_app/core/theme/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_typography.dart';
import 'package:e_commerce_app/core/validators/validators.dart';
import 'package:e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController(
    text: 'Esther Howard',
  );
  final _passwordController = TextEditingController(
    text: 'HJ@#9783kja',
  );
  bool rememberMe = true;

  String get passWordStrength =>
      Validators.passwordStrength(_passwordController.text);

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: defaultPadding,
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Text('Welcome', style: sb28),
                            SizedBox(height: 6.h),
                            Text(
                              'Please enter your data to continue',
                              style: r13.copyWith(
                                color: AppColors.grey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 56.h),
                      CustomTextField(
                        label: 'Username',
                        controller: _usernameController,
                        suffixIcon: const Icon(
                          Icons.check,
                          color: AppColors.green,
                        ),
                      ),
                      SizedBox(height: 22.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  label: 'Password',
                                  controller: _passwordController,
                                ),
                              ),

                              SizedBox(width: 10.w),
                              Padding(
                                padding: EdgeInsets.only(bottom: 6.h),
                                child: Text(
                                  passWordStrength,
                                  style: r13.copyWith(
                                    color:
                                        passWordStrength == 'Strong'
                                        ? AppColors.green
                                        : AppColors.orange,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 18.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(50.w, 24.h),
                            tapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Forgot password?',
                            style: r13.copyWith(
                              color: const Color(0xFFFF6F6F),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 18.h),
                      Row(
                        children: [
                          Text(
                            'Remember me',
                            style: r13.copyWith(
                              color: AppColors.grey,
                            ),
                          ),
                          const Spacer(),
                          Switch(
                            value: rememberMe,
                            onChanged: (value) =>
                                setState(() => rememberMe = value),
                            activeThumbColor: Colors.white,
                            activeTrackColor: AppColors.green,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Text(
                  'By connecting your account confirm that you agree\nwith our Term and Condition',
                  textAlign: TextAlign.center,
                  style: r13.copyWith(
                    color: AppColors.grey,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    context.push(AppRoutes.kSignUp);
                  },
                  child: Container(
                    height: 75.h,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    decoration: BoxDecoration(
                      color: AppColors.purple,
                    ),
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: m17.copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
