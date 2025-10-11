import 'package:e_commerce_app/core/theme/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandSelector extends StatelessWidget {
  const BrandSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final brands = ["Adidas", "Nike", "Fila", "Puma", "Reebok"];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader("Choose Brand"),
        SizedBox(height: 15.h),
        SizedBox(
          height: 50.h,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: brands.length,
            separatorBuilder: (_, __) => SizedBox(width: 10.w),
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 18.w,
                  vertical: 10.h,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.checkroom_outlined, size: 18),
                    SizedBox(width: 18.w),
                    Text(brands[index], style: m15),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _sectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: m17),
        Text("View All", style: r13.copyWith(color: AppColors.grey)),
      ],
    );
  }
}
