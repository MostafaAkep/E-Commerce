import 'package:e_commerce_app/core/theme/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_typography.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/brand_selector.dart';
import '../widgets/home_header.dart';
import '../widgets/new_arrival_section.dart';
import '../widgets/search_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: context.read<HomeCubit>(),
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () =>
                const Center(child: CircularProgressIndicator()),
            success: (products) => SafeArea(
              child: Padding(
                padding: defaultPadding.copyWith(top: 25.h),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 20.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HomeHeader(),
                      const SearchField(),
                      const BrandSelector(),
                      NewArrivalSection(
                        products: products
                            .expand((product) => product.items!)
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            error: (error) => Center(
              child: Text(
                error,
                style: sb28.copyWith(color: Colors.red),
              ),
            ),
          );
        },
      ),
      //////////////////////////////////////////////////////////////////////////
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.purple,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Wishlist",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel_rounded),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet_rounded),
            label: "Payment",
          ),
        ],
      ),
    );
  }
}
