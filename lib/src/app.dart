import 'package:degime_app/src/routing/app_router.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DegimeApp extends ConsumerWidget {
  const DegimeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
        designSize: const Size(1125, 2436),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          final goRouter = ref.watch(GoRouteProvider);
          return MaterialApp.router(
            routerConfig: goRouter,
            debugShowCheckedModeBanner: false,
            title: 'Degime App',
            theme: ThemeData(fontFamily: 'FamiljenGrotesk'),
          );
        });
  }
}
