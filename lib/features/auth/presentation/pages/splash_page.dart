import 'package:e_commerce_app/core/navigation/app_router.dart';
import 'package:e_commerce_app/core/theme/app_colors.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeOut;

  @override
  void initState() {
    super.initState();

    // 1️⃣ Create animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeOut = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // 2️⃣ Wait for 2.5 seconds (splash display)
    Future.delayed(const Duration(seconds: 2), () async {
      // 3️⃣ Start fade-out animation
      await _controller.forward();

      // 4️⃣ After animation completes → navigate
      if (mounted) {
        context.go(AppRoutes.kSignUp);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: FadeTransition(
        opacity: Tween<double>(
          begin: 1.0,
          end: 0.0,
        ).animate(_fadeOut),
        child: Center(
          child: SvgPicture.asset(
            Assets.logo,
            width: 60.w,
            height: 36.h,
          ),
        ),
      ),
    );
  }
}
