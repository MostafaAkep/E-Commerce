#!/usr/bin/env python3
"""
create_flutter_structure.py

Usage:
  python create_flutter_structure.py MyApp

What it does:
- Runs `flutter create <app_name>`
- Replaces the `lib/` folder with a project structure matching your provided core files
- Writes sample files (main.dart, core/navigation/app_router.dart, core/theme/app_colors.dart, core/utils/app_typography.dart,
  core/injection/injection.dart, core/injection/injection.config.dart (placeholder),
  core/networking/api_constants.dart, core/networking/api_result.dart, core/networking/api_error_handler.dart,
  core/validators/validators.dart, features/auth/presentation/pages/splash_page.dart)
- Replaces the Dart package import root (example: package:e_commerce_app/...) with `package:<app_name>/...`
- Runs `flutter pub add` to install common deps and `flutter pub get`.
- Runs build_runner once to generate files (freezed/injectable placeholders).

Note: this script requires `flutter` to be on PATH and Python 3.8+.

Be careful: it will delete the generated project's lib/ folder and replace it.
"""

import os
import shutil
import subprocess
import sys
from pathlib import Path

DEPENDENCIES = [
    "go_router",
    "get_it",
    "injectable",
    "flutter_bloc",
    "google_fonts",
    "flutter_screenutil",
    "dio",
    "freezed_annotation",
    "build_runner",
    "freezed",
]

# Files content templates. We inject the package name wherever {package} appears.
FILES = {
    "lib/main.dart": """import 'package:{package}/core/injection/injection.dart';
import 'package:{package}/core/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await getIt.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          theme: ThemeData(textTheme: GoogleFonts.interTextTheme()),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRoutes.router,
        );
      },
    );
  }
}
""",

    "lib/core/navigation/app_router.dart": """import 'package:{package}/core/injection/injection.dart';
import 'package:{package}/features/auth/presentation/pages/get_started_page.dart';
import 'package:{package}/features/auth/presentation/pages/log_in_page.dart';
import 'package:{package}/features/auth/presentation/pages/sign_up_page.dart';
import 'package:{package}/features/auth/presentation/pages/splash_page.dart';
import 'package:{package}/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:{package}/features/home/presentation/pages/home_page.dart';
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
""",

    "lib/core/theme/app_colors.dart": """import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundColor = Color(0xFF9775FA);
  static const Color grey = Color(0xff8F959E);
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffffffff);
  static const Color green = Color(0xff4CAF50);
  static const Color yellow = Color(0xFFFFE53B);
  static const Color purple = Color(0xFF9775FA);
  static const Color orange = Color(0xFFFFA500);
}
""",

    "lib/core/utils/app_typography.dart": """import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double font_40Size = 40.sp;
double font_28Size = 28.sp;
double font_22Size = 22.sp;
double font_20Size = 20.sp;
double font_18Size = 18.sp;
double font_17Size = 17.sp;
double font_16Size = 16.sp;
double font_15Size = 15.sp;
double font_14Size = 14.sp;
double font_13Size = 13.sp;
double font_12Size = 12.sp;
double font_11Size = 11.sp;
double font_10Size = 10.sp;
double font_9Size = 9.sp;
double font_8Size = 8.sp;
double font_6Size = 6.sp;

final defaultPadding = EdgeInsets.only(
  left: 20.w,
  right: 20.w,
  top: 105.h,
);
//sb = bold 700
//sm = Medium 500
//sr = regular 400

// sb = bold 700
TextStyle sb28 = TextStyle(
  fontSize: font_28Size,
  fontWeight: FontWeight.w600,
);
TextStyle sb13 = TextStyle(
  fontSize: font_13Size,
  fontWeight: FontWeight.w600,
);
TextStyle m17 = TextStyle(
  fontSize: font_17Size,
  fontWeight: FontWeight.w500,
);
TextStyle m15 = TextStyle(
  fontSize: font_15Size,
  fontWeight: FontWeight.w500,
);
TextStyle m11 = TextStyle(
  fontSize: font_11Size,
  fontWeight: FontWeight.w500,
);
TextStyle r15 = TextStyle(
  fontSize: font_15Size,
  fontWeight: FontWeight.w400,
);
TextStyle r13 = TextStyle(
  fontSize: font_13Size,
  fontWeight: FontWeight.w400,
);
""",

    "lib/core/injection/injection.dart": """import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async => getIt.init();
""",

    # Provide a small placeholder for the generated file so build_runner doesn't immediately fail
    "lib/core/injection/injection.config.dart": """// GENERATED CODE - placeholder
// Run `flutter pub run build_runner build` to generate this file from @injectable annotations in your project.

// This placeholder allows the structure script to create a compilable project skeleton.

void init() {}
""",

    "lib/core/networking/api_constants.dart": """class ApiConstants {
  static const String baseUrl =
      \"https://accessories-eshop.runasp.net/api/\";
  static const String products = \"products\";
}

class ApiErrors {
  static const String badRequestError = \"badRequestError\";
  static const String noContent = \"noContent\";
  static const String forbiddenError = \"forbiddenError\";
  static const String unauthorizedError = \"unauthorizedError\";
  static const String notFoundError = \"notFoundError\";
  static const String conflictError = \"conflictError\";
  static const String internalServerError = \"internalServerError\";
  static const String unknownError = \"unknownError\";
  static const String timeoutError = \"timeoutError\";
  static const String defaultError = \"defaultError\";
  static const String cacheError = \"cacheError\";
  static const String noInternetError = \"noInternetError\";
  static const String loadingMessage = \"loading_message\";
  static const String retryAgainMessage = \"retry_again_message\";
  static const String ok = \"Ok\";
}
""",

    "lib/core/networking/api_result.dart": """import 'package:{package}/core/networking/api_error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_result.freezed.dart';

@Freezed()
abstract class ApiResult<T> with _\$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(ErrorHandler errorHandler) =
      Failure<T>;
}
""",

    "lib/core/networking/api_error_handler.dart": """import 'package:dio/dio.dart';

import 'api_constants.dart';
import 'api_error_model.dart';

// TODO: wallahy I will refactor this .. Omar Ahmed
enum DataSource {
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  // API_LOGIC_ERROR,
  DEFAULT,
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT =
      201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED =
      401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR =
      500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found
  static const int API_LOGIC_ERROR = 422; // API , lOGIC ERROR

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String NO_CONTENT =
      ApiErrors.noContent; // success with no data (no content)
  static const String BAD_REQUEST =
      ApiErrors.badRequestError; // failure, API rejected request
  static const String UNAUTORISED =
      ApiErrors.unauthorizedError; // failure, user is not authorised
  static const String FORBIDDEN =
      ApiErrors.forbiddenError; //  failure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      ApiErrors.internalServerError; // failure, crash in server side
  static const String NOT_FOUND =
      ApiErrors.notFoundError; // failure, crash in server side

  // local status code
  static String CONNECT_TIMEOUT = ApiErrors.timeoutError;
  static String CANCEL = ApiErrors.defaultError;
  static String RECIEVE_TIMEOUT = ApiErrors.timeoutError;
  static String SEND_TIMEOUT = ApiErrors.timeoutError;
  static String CACHE_ERROR = ApiErrors.cacheError;
  static String NO_INTERNET_CONNECTION = ApiErrors.noInternetError;
  static String DEFAULT = ApiErrors.defaultError;
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    switch (this) {
      case DataSource.NO_CONTENT:
        return ApiErrorModel(
          statusCode: ResponseCode.NO_CONTENT,
          message: ResponseMessage.NO_CONTENT,
        );
      case DataSource.BAD_REQUEST:
        return ApiErrorModel(
          statusCode: ResponseCode.BAD_REQUEST,
          message: ResponseMessage.BAD_REQUEST,
        );
      case DataSource.FORBIDDEN:
        return ApiErrorModel(
          statusCode: ResponseCode.FORBIDDEN,
          message: ResponseMessage.FORBIDDEN,
        );
      case DataSource.UNAUTORISED:
        return ApiErrorModel(
          statusCode: ResponseCode.UNAUTORISED,
          message: ResponseMessage.UNAUTORISED,
        );
      case DataSource.NOT_FOUND:
        return ApiErrorModel(
          statusCode: ResponseCode.NOT_FOUND,
          message: ResponseMessage.NOT_FOUND,
        );
      case DataSource.INTERNAL_SERVER_ERROR:
        return ApiErrorModel(
          statusCode: ResponseCode.INTERNAL_SERVER_ERROR,
          message: ResponseMessage.INTERNAL_SERVER_ERROR,
        );
      case DataSource.CONNECT_TIMEOUT:
        return ApiErrorModel(
          statusCode: ResponseCode.CONNECT_TIMEOUT,
          message: ResponseMessage.CONNECT_TIMEOUT,
        );
      case DataSource.CANCEL:
        return ApiErrorModel(
          statusCode: ResponseCode.CANCEL,
          message: ResponseMessage.CANCEL,
        );
      case DataSource.RECIEVE_TIMEOUT:
        return ApiErrorModel(
          statusCode: ResponseCode.RECIEVE_TIMEOUT,
          message: ResponseMessage.RECIEVE_TIMEOUT,
        );
      case DataSource.SEND_TIMEOUT:
        return ApiErrorModel(
          statusCode: ResponseCode.SEND_TIMEOUT,
          message: ResponseMessage.SEND_TIMEOUT,
        );
      case DataSource.CACHE_ERROR:
        return ApiErrorModel(
          statusCode: ResponseCode.CACHE_ERROR,
          message: ResponseMessage.CACHE_ERROR,
        );
      case DataSource.NO_INTERNET_CONNECTION:
        return ApiErrorModel(
          statusCode: ResponseCode.NO_INTERNET_CONNECTION,
          message: ResponseMessage.NO_INTERNET_CONNECTION,
        );
      case DataSource.DEFAULT:
        return ApiErrorModel(
          statusCode: ResponseCode.DEFAULT,
          message: ResponseMessage.DEFAULT,
        );
    }
  }
}

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      apiErrorModel = _handleError(error);
    } else {
      // default error
      apiErrorModel = DataSource.DEFAULT.getFailure();
    }
  }
}

ApiErrorModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.unknown:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.DEFAULT.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.DEFAULT.getFailure();
  }
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
""",

    "lib/core/validators/validators.dart": """class Validators {
  static String passwordStrength(String password) {
    if (password.length >= 8 &&
        RegExp(r'[A-Z]').hasMatch(password) &&
        RegExp(r'[0-9]').hasMatch(password) &&
        RegExp(r'[!@#\\$%^&*(),.?\":{}|<>]').hasMatch(password)) {
      return 'Strong';
    }
    return 'Weak';
  }
}
""",

    # Simple splash page and some placeholder pages referenced by router
    "lib/features/auth/presentation/pages/splash_page.dart": """import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      // navigate to get started after splash
      Navigator.of(context).pushReplacementNamed('/GetStarted');
    });

    return const Scaffold(
      body: Center(
        child: Text('Splash'),
      ),
    );
  }
}
""",

    "lib/features/auth/presentation/pages/get_started_page.dart": """import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Get Started')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).pushNamed('/LogIn'),
          child: const Text('Go to Login'),
        ),
      ),
    );
  }
}
""",

    "lib/features/auth/presentation/pages/log_in_page.dart": """import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: const Center(child: Text('Login Page')),
    );
  }
}
""",

    "lib/features/auth/presentation/pages/sign_up_page.dart": """import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: const Center(child: Text('Sign Up Page')),
    );
  }
}
""",

    # Placeholder home cubit and page so imports resolve
    "lib/features/home/presentation/manager/cubit/home_cubit.dart": """import 'package:bloc/bloc.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(0);

  void getProducts() async {
    // placeholder
    await Future.delayed(const Duration(milliseconds: 200));
    emit(1);
  }
}
""",

    "lib/features/home/presentation/pages/home_page.dart": """import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Home Page')),
    );
  }
}
""",
}


def safe_mkdir(path: Path):
    if not path.exists():
        path.mkdir(parents=True, exist_ok=True)


def write_file(path: Path, content: str, package_name: str):
    content = content.replace('{package}', package_name)
    safe_mkdir(path.parent)
    path.write_text(content, encoding='utf-8')


def run(cmd, cwd=None):
    print('RUN:', ' '.join(cmd))
    subprocess.run(cmd, check=True, cwd=cwd)


def main():
    if len(sys.argv) < 2:
        print('Usage: python create_flutter_structure.py <AppName>')
        sys.exit(1)

    app_name = sys.argv[1]
    project_dir = Path.cwd() / app_name

    # 1) create flutter project
    try:
        run(['flutter', 'create', app_name])
    except subprocess.CalledProcessError as e:
        print('Error creating flutter project:', e)
        sys.exit(1)

    # 2) replace lib folder
    lib_dir = project_dir / 'lib'
    if lib_dir.exists():
        print('Removing existing lib/ folder...')
        shutil.rmtree(lib_dir)

    # 3) write files
    for rel_path, content in FILES.items():
        target = project_dir / rel_path
        print('Writing', target)
        write_file(target, content, app_name)

    # 4) run flutter pub add for dependencies
    try:
        for dep in DEPENDENCIES:
            run(['flutter', 'pub', 'add', dep], cwd=project_dir)

        # ensure packages are fetched
        run(['flutter', 'pub', 'get'], cwd=project_dir)

        # run build_runner to generate files (may take time)
        run(['flutter', 'pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'], cwd=project_dir)

    except subprocess.CalledProcessError as e:
        print('Warning: one of the flutter/pub commands failed.', e)
        print('You can run them manually inside', project_dir)

    print('\nDone. Your Flutter skeleton is ready at:', project_dir)
    print('Open it with VS Code and run `flutter run`')


if __name__ == '__main__':
    main()
