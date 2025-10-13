import 'package:e_commerce_app/core/injection/injection.dart';
import 'package:e_commerce_app/features/auth/presentation/pages/get_started_page.dart';
import 'package:e_commerce_app/features/auth/presentation/pages/log_in_page.dart';
import 'package:e_commerce_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:e_commerce_app/features/auth/presentation/pages/splash_page.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String kSplash = '/';
  static const String kGetStarted = '/GetStarted';
  static const String kSignUp = '/SignUp';
  static const String kLogIn = '/LogIn';
  static const String kHome = '/Home';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: kGetStarted,
        builder: (context, state) => const GetStartedPage(),
      ),
      GoRoute(
        path: kSignUp,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: kLogIn,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: kHome,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<HomeCubit>()..getProducts(),
          child: const HomePage(),
        ),
      ),
    ],
  );
}
