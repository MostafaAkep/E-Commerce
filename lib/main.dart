import 'package:e_commerce_app/core/injection/injection.dart';
import 'package:e_commerce_app/core/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await configureDependencies();
    await getIt.allReady();
    runApp(const MyApp());
  } catch (e, stack) {
    debugPrint('Initialization error: \$e');
    debugPrintStack(stackTrace: stack);
  }
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
