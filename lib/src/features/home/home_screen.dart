import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;

import 'package:degime_app/src/routing/app_router.dart';
import 'package:degime_app/src/widgets/custom_image_view.dart';
import 'package:degime_app/src/widgets/custom_text_form_field.dart';
import 'package:degime_app/src/widgets/custom_elevated_button.dart';
import 'package:degime_app/src/app_export.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Opacity(
                      opacity: 0.8,
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.h,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.h, vertical: 95.v),
                                decoration: AppDecoration.fillOnPrimary,
                                child: Column(children: []),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 19.h, vertical: 84.v),
                            decoration: AppDecoration.fillGray.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.customBorderTL10),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(height: 120.v),
                                  CustomImageView(
                                      imagePath: ImageConstant.imgGroup428,
                                      height: 25.v,
                                      width: 65.h,
                                      alignment: Alignment.centerRight),
                                  SizedBox(height: 40.v),
                                  Text(TextConstant.strUsername,
                                      style: CustomTextStyles
                                          .titleMediumFamiljenGroteskBlack900_1),
                                  SizedBox(height: 9.v),
                                  GestureDetector(
                                      onTap: () {
                                        onTapTxtWeburl(context);
                                      },
                                      child: Text(TextConstant.strHttplink,
                                          style: CustomTextStyles
                                              .titleMediumFamiljenGroteskBlack900_1)),
                                  SizedBox(height: 21.v),
                                  _buildSearch(context),
                                  SizedBox(height: 41.v),
                                  _buildTf(context),
                                  SizedBox(height: 36.v),
                                  _buildSNS(context),
                                  SizedBox(height: 36.v),
                                  _buildFive(context),
                                  SizedBox(height: 25.v),
                                  _buildDegime(context),
                                  SizedBox(height: 8.v),
                                  _buildDegime1(context)
                                ]))),
                    _buildWidget(context),
                    CustomImageView(
                        imagePath: ImageConstant.imgAvatar,
                        height: 90.v,
                        width: 82.h,
                        radius: BorderRadius.circular(45.h),
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(top: 182.v)),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  /// Section Widget
  Widget _buildWidget(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
            height: 220.v,
            width: double.maxFinite,
            child: Stack(alignment: Alignment.topLeft, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgMainBG,
                  height: 220.v,
                  width: 375.h,
                  alignment: Alignment.center),
              CustomImageView(
                  imagePath: ImageConstant.imgLogo,
                  height: 80.adaptSize,
                  width: 80.adaptSize,
                  alignment: Alignment.topLeft)
            ])));
  }

  /// Section Widget
  Widget _buildSearch(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 14.h, right: 12.h),
        child: CustomTextFormField(
            controller: searchController,
            hintText: TextConstant.strSearch,
            textInputAction: TextInputAction.done,
            autofocus: false,
            prefix: Container(
                margin: EdgeInsets.fromLTRB(22.h, 5.v, 21.h, 5.v),
                child: CustomImageView(
                    imagePath: ImageConstant.imgSearch,
                    height: 26.adaptSize,
                    width: 26.adaptSize)),
            prefixConstraints: BoxConstraints(maxHeight: 38.v),
            suffix: Container(
                margin: EdgeInsets.fromLTRB(30.h, 7.v, 18.h, 7.v),
                child: CustomImageView(
                    imagePath: ImageConstant.imgVectorGray50,
                    height: 22.adaptSize,
                    width: 22.adaptSize)),
            suffixConstraints: BoxConstraints(maxHeight: 38.v),
            contentPadding: EdgeInsets.symmetric(vertical: 6.v),
            borderDecoration: TextFormFieldStyleHelper.fillGray,
            filled: true,
            fillColor: appTheme.gray300));
  }

  /// Section Widget
  Widget _buildTf(BuildContext context) {
    return CustomElevatedButton(
      height: 44.v,
      text: TextConstant.strOnlineEdit,
      margin: EdgeInsets.only(left: 14.h, right: 12.h),
      rightIcon: Container(
          margin: EdgeInsets.only(left: 30.h),
          child: Transform.rotate(
            angle: 45 * math.pi / 180,
            child: CustomImageView(
                imagePath: ImageConstant.imgVectorGray50,
                height: 31.adaptSize,
                width: 31.adaptSize),
          )),
      buttonStyle: CustomButtonStyles.fillLightBlue,
      buttonTextStyle: CustomTextStyles.titleMediumFamiljenGrotesk,
      onPressed: () {
        context.pushNamed(AppRoute.profile.name);
      },
    );
  }

  /// Section Widget
  Widget _buildSNS(BuildContext context) {
    return CustomElevatedButton(
      height: 44.v,
      text: TextConstant.strSNS,
      margin: EdgeInsets.only(left: 14.h, right: 12.h),
      rightIcon: Container(
          margin: EdgeInsets.only(left: 30.h),
          child: Transform.rotate(
            angle: 45 * math.pi / 180,
            child: CustomImageView(
                imagePath: ImageConstant.imgVectorGray50,
                height: 31.adaptSize,
                width: 31.adaptSize),
          )),
      buttonStyle: CustomButtonStyles.fillLightBlue,
      buttonTextStyle: CustomTextStyles.titleMediumFamiljenGrotesk,
      onPressed: () {
        context.pushNamed(AppRoute.profile.name);
      },
    );
  }

  /// Section Widget
  Widget _buildFive(BuildContext context) {
    return CustomElevatedButton(
        height: 34.v,
        width: 224.h,
        text: TextConstant.strNameManagement,
        buttonStyle: CustomButtonStyles.fillLightGreenTL10,
        buttonTextStyle: CustomTextStyles.titleMediumFamiljenGrotesk);
  }

  /// Section Widget
  Widget _buildDegime(BuildContext context) {
    return CustomElevatedButton(
        height: 34.v,
        width: 224.h,
        text: TextConstant.strWriteCard,
        buttonStyle: CustomButtonStyles.fillDeepOrange,
        buttonTextStyle: CustomTextStyles.titleMediumFamiljenGrotesk);
  }

  /// Section Widget
  Widget _buildDegime1(BuildContext context) {
    return CustomElevatedButton(
        height: 34.v,
        width: 224.h,
        text: TextConstant.strBuyCard,
        buttonStyle: CustomButtonStyles.fillDeepOrangeTL10,
        buttonTextStyle: CustomTextStyles.titleMediumFamiljenGrotesk);
  }

  onTapTxtWeburl(BuildContext context) {
    // TODO: implement Actions
  }
}
