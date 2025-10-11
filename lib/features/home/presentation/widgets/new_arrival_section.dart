import 'package:e_commerce_app/core/theme/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_typography.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewArrivalSection extends StatelessWidget {
  const NewArrivalSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        "image": Assets.whiteMan1,
        "title": "Nike Sportswear Club Fleece",
        "price": "\$99",
      },
      {
        "image": Assets.whiteMan2,
        "title": "Trail Running Jacket Nike Windrunner",
        "price": "\$95",
      },
      {
        "image": Assets.blackMan1,
        "title": "Trail Running Jacket Nike Windrunner",
        "price": "\$9",
      },
      {
        "image": Assets.blackMan2,
        "title": "Trail Running Jacket Nike Windrunner",
        "price": "\$919",
      },
      {
        "image": Assets.blackMan1,
        "title": "Trail Running Jacket Nike Windrunner",
        "price": "\$959",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader("New Arrival"),
        SizedBox(height: 10.h),
        GridView.builder(
          itemCount: items.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12.h,
            crossAxisSpacing: 12.w,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return _productCard(item);
          },
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

  Widget _productCard(Map<String, String> item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                  child: Image.asset(
                    item["image"]!,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(
                    Icons.favorite_border,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item["title"]!, style: m11),
                SizedBox(height: 5.h),
                Text(item["price"]!, style: sb13),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
