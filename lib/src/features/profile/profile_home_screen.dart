import 'package:degime_app/src/features/profile/sns_profile_screen.dart';
import 'package:degime_app/src/features/profile/user_profie_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:degime_app/src/app_export.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with TickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height,
            child: SizedBox(
              height: 768.v,
              width: double.maxFinite,
              child: Stack(alignment: Alignment.bottomCenter, children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 33.v,
                              width: 300.h,
                              margin: EdgeInsets.only(left: 26.h),
                              child: TabBar(
                                  controller: tabviewController,
                                  labelPadding: EdgeInsets.zero,
                                  labelColor: appTheme.deepPurpleA20001,
                                  labelStyle: TextStyle(
                                      fontSize: 16.fSize,
                                      fontFamily: 'Familjen Grotesk',
                                      fontWeight: FontWeight.w700),
                                  unselectedLabelColor: appTheme.black900,
                                  unselectedLabelStyle: TextStyle(
                                      fontSize: 16.fSize,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700),
                                  indicatorColor: appTheme.deepPurpleA20001,
                                  tabs: [
                                    Tab(
                                        child:
                                            Text(TextConstant.strSNSProfile)),
                                    Tab(
                                        child:
                                            Text(TextConstant.strUserProfile))
                                  ])),
                          SizedBox(
                            height: 780.v,
                            child: TabBarView(
                                controller: tabviewController,
                                children: [
                                  UserProfileScreen(),
                                  SNSProfileScreen(),
                                ]),
                          ),
                        ]),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
