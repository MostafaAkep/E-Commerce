import 'package:e_commerce_app/core/theme/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_typography.dart';
import 'package:e_commerce_app/core/validators/validators.dart';
import 'package:e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool rememberMe = true;
  String get passWordStrength =>
      Validators.passwordStrength(_passwordController.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: defaultPadding,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text('Sign Up', style: sb28)),
                    SizedBox(height: 152.h),
                    CustomTextField(
                      label: 'Username',
                      controller: _usernameController,
                      suffixIcon: const Icon(
                        Icons.check,
                        color: AppColors.green,
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      label: 'Password',
                      controller: _passwordController,
                      obscureText: true,
                      suffixText: passWordStrength,
                      suffixTextColor: passWordStrength == 'Strong'
                          ? AppColors.green
                          : AppColors.orange,
                      onChanged: (_) => setState(() {}),
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      label: 'Email Address',
                      controller: _emailController,
                      suffixIcon: const Icon(
                        Icons.check,
                        color: AppColors.green,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Text('Remember me', style: r13),
                        const Spacer(),
                        Switch(
                          value: rememberMe,
                          onChanged: (value) =>
                              setState(() => rememberMe = value),
                          activeThumbColor: Colors.green,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              decoration: BoxDecoration(color: AppColors.purple),
              width: double.infinity,
              child: Center(
                child: Text(
                  'Sign Up',
                  style: m17.copyWith(color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
