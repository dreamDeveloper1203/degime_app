import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:degime_app/src/app_export.dart';
import 'package:degime_app/src/routing/app_router.dart';
import 'package:degime_app/src/widgets/custom_image_view.dart';
import 'package:degime_app/src/widgets/custom_text_form_field.dart';
import 'package:degime_app/src/widgets/custom_elevated_button.dart';
import 'package:go_router/go_router.dart';

class SNSProfileScreen extends ConsumerStatefulWidget {
  const SNSProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SNSProfileScreen> createState() => _SNSProfileScreenState();
}

class _SNSProfileScreenState extends ConsumerState<SNSProfileScreen> {
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
                    _buildEditColumn(context),
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
  Widget _buildEditColumn(BuildContext context) {
    return SizedBox(
      height: 286.v,
      width: 321.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.h,
                vertical: 11.v,
              ),
              decoration: AppDecoration.outlineDeepPurpleA.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgEdit,
                height: 24.adaptSize,
                width: 24.adaptSize,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                left: 101.h,
                right: 110.h,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 45.h,
                vertical: 33.v,
              ),
              decoration: AppDecoration.outlineBlack9006.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder55,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 2.v),
                  Text(
                    TextConstant.strPlus,
                    style: theme.textTheme.headlineLarge,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(
                right: 28.h,
                bottom: 29.v,
              ),
              child: Text(
                "lbl71",
                style: CustomTextStyles.bodyMediumOnPrimary14,
              ),
            ),
          ),
        ],
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
      onPressed: () {
        // context.goNamed(AppRoute.profile_sns.name);
        showToast("Success");
        context.goNamed(AppRoute.profile.name);
      },
    );
  }
}
