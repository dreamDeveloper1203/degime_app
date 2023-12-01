import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:degime_app/src/app_export.dart';
import 'package:degime_app/src/routing/app_router.dart';
import 'package:degime_app/src/widgets/custom_text_form_field.dart';
import 'package:degime_app/src/widgets/custom_elevated_button.dart';
import 'package:degime_app/src/widgets/custom_image_view.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends ConsumerState<UserProfileScreen> {
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
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height,
            child: Column(
              children: [
                SizedBox(height: 28.v),
                Column(
                  children: [
                    _buildEditText(context),
                    SizedBox(height: 10.v),
                    _buildGroup141(context),
                    SizedBox(height: 44.v),
                    _buildFrame4(context),
                    SizedBox(height: 7.v),
                    _buildFrame10(context),
                    SizedBox(height: 50.v),
                    _buildTf(context)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEditText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: CustomImageView(
        imagePath: ImageConstant.imgRectangle,
        height: 240.adaptSize,
        width: 375.adaptSize,
      ),
    );
  }

  /// Section Widget
  Widget _buildGroup140(BuildContext context) {
    return CustomTextFormField(
      width: 184.h,
      hintText: TextConstant.strName,
      hintStyle: CustomTextStyles.titleMediumFamiljenGroteskBlack900,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 7.v,
      ),
      borderDecoration: TextFormFieldStyleHelper.outlineBlackTL5,
      filled: true,
      autofocus: false,
      fillColor: theme.colorScheme.onPrimary.withOpacity(1),
    );
  }

  /// Section Widget
  Widget _buildGroup141(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 31.h,
        right: 37.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 14.v,
              bottom: 9.v,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 46.h,
              vertical: 31.v,
            ),
            decoration: AppDecoration.fillBluegray100.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder55,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 8.v),
                Text(
                  TextConstant.strPlus,
                  style: theme.textTheme.headlineLarge,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 13.h),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.h),
                    child: Text(
                      "lbl71",
                      style: CustomTextStyles.bodyMediumOnPrimary14,
                    ),
                  ),
                ),
                SizedBox(height: 14.v),
                _buildGroup140(context),
                SizedBox(height: 28.v),
                SizedBox(
                  width: 182.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40.adaptSize,
                        padding: EdgeInsets.symmetric(
                          horizontal: 11.h,
                          vertical: 1.v,
                        ),
                        decoration: AppDecoration.fillBluegray100,
                        child: Text(
                          TextConstant.strPlus,
                          style: theme.textTheme.headlineLarge,
                        ),
                      ),
                      Container(
                        width: 40.adaptSize,
                        padding: EdgeInsets.symmetric(
                          horizontal: 11.h,
                          vertical: 1.v,
                        ),
                        decoration: AppDecoration.fillBluegray100,
                        child: Text(
                          TextConstant.strPlus,
                          style: theme.textTheme.headlineLarge,
                        ),
                      ),
                      Container(
                        width: 40.adaptSize,
                        padding: EdgeInsets.symmetric(
                          horizontal: 11.h,
                          vertical: 1.v,
                        ),
                        decoration: AppDecoration.fillBluegray100,
                        child: Text(
                          TextConstant.strPlus,
                          style: theme.textTheme.headlineLarge,
                        ),
                      ),
                      Container(
                        width: 40.adaptSize,
                        padding: EdgeInsets.symmetric(
                          horizontal: 11.h,
                          vertical: 1.v,
                        ),
                        decoration: AppDecoration.fillBluegray100,
                        child: Text(
                          TextConstant.strPlus,
                          style: theme.textTheme.headlineLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame4(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 60.h,
        right: 43.h,
      ),
      child: CustomTextFormField(
        hintText: TextConstant.strProfile,
        hintStyle: CustomTextStyles.titleMediumFamiljenGroteskBlack900,
        autofocus: false,
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame10(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 60.h,
        right: 43.h,
      ),
      child: CustomTextFormField(
        hintText: TextConstant.strCompanyName,
        hintStyle: CustomTextStyles.titleMediumFamiljenGroteskBlack900,
        textInputAction: TextInputAction.done,
        borderDecoration: TextFormFieldStyleHelper.outlineBlackTL81,
        autofocus: false,
      ),
    );
  }

  /// Section Widget
  Widget _buildTf(BuildContext context) {
    return CustomElevatedButton(
      height: 40.v,
      width: 272.h,
      text: TextConstant.strSelectTheme,
      margin: EdgeInsets.only(top: 22.v),
      buttonStyle: CustomButtonStyles.fillLightBlue,
      buttonTextStyle: CustomTextStyles.bodyMediumInterOnPrimary,
      alignment: Alignment.topCenter,
    );
  }

  /// Section Widget
  Widget _buildSelectTheme(BuildContext context) {
    return SizedBox(
      height: 96.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildTf(context),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 96.v,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: appTheme.blueGray100.withOpacity(0.44),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
