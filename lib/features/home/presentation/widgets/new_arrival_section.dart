import 'package:e_commerce_app/core/theme/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_typography.dart';
import 'package:e_commerce_app/features/home/domain/entities/items_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewArrivalSection extends StatelessWidget {
  const NewArrivalSection({super.key, required this.products});
  final List<ItemsEntity> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader("New Arrival"),
        SizedBox(height: 10.h),
        GridView.builder(
          itemCount: products.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12.h,
            crossAxisSpacing: 12.w,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            final item = products[index];
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

  Widget _productCard(ItemsEntity item) {
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
                  child: Image.network(
                    item.coverPictureUrl ?? "",
                    width: double.infinity,
                    fit: BoxFit.cover,
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
                Text(item.name ?? '', style: m11),
                SizedBox(height: 5.h),
                Text('${item.price}\$', style: sb13),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
