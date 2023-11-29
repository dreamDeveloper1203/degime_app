import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:degime_app/src/features/auth/login_screen.dart';
import 'package:degime_app/src/features/home/home_screen.dart';
import 'package:degime_app/src/features/auth/register_screen.dart';

enum AppRoute { login, home, register }

final GoRouteProvider = Provider<GoRouter>((ref) {
  return GoRouter(initialLocation: '/', debugLogDiagnostics: false, routes: [
    GoRoute(
      path: '/',
      name: AppRoute.login.name,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        fullscreenDialog: true,
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: '/register',
      name: AppRoute.register.name,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        fullscreenDialog: true,
        child: const RegisterScreen(),
      ),
    ),
    GoRoute(
      path: '/home',
      name: AppRoute.home.name,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        fullscreenDialog: true,
        child: const HomeScreen(),
      ),
    )
  ]);
});
