import 'package:e_commerce_app/core/theme/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? suffixText;
  final Color? suffixTextColor;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.suffixText,
    this.suffixTextColor,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                obscureText: obscureText,
                onChanged: onChanged,
                decoration: InputDecoration(
                  label: Text(label),
                  labelStyle: r15.copyWith(color: AppColors.grey),
                  floatingLabelStyle: r13.copyWith(
                    color: AppColors.grey,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 8.w),
                ),
                style: m15,
              ),
            ),
            if (suffixIcon != null) suffixIcon!,
            if (suffixText != null)
              Text(
                suffixText!,
                style: TextStyle(
                  color: suffixTextColor ?? Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
          ],
        ),
        Divider(thickness: 1, height: 1.h),
      ],
    );
  }
}
