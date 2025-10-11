import 'package:e_commerce_app/core/navigation/app_router.dart';
import 'package:e_commerce_app/core/theme/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_typography.dart';
import 'package:e_commerce_app/core/widgets/rich_app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: defaultPadding,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text('Let’s Get Started', style: sb28)],
              ),
            ),
          ),
          Spacer(),
          RichAppText(
            'Already have an account?',
            'Sign In',
            onTapFun: () => context.push(AppRoutes.kLogIn),
          ),
          SizedBox(height: 25.h),
          GestureDetector(
            onTap: () {
              context.push(AppRoutes.kSignUp);
            },
            child: Container(
              height: 75.h,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              decoration: BoxDecoration(color: AppColors.purple),
              width: double.infinity,
              child: Center(
                child: Text(
                  'create an account',
                  style: m17.copyWith(color: AppColors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
