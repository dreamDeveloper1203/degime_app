import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:degime_app/src/features/auth/auth_controllers.dart';
import 'package:degime_app/src/features/auth/login_validators.dart';
import 'package:degime_app/src/routing/app_router.dart';
import 'package:degime_app/src/constants/app_styles.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 400.w,
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: 120,
                      height: 120,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
