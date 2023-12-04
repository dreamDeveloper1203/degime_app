import 'package:degime_app/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:degime_app/src/app_export.dart';
import 'package:degime_app/src/widgets/custom_image_view.dart';
import 'package:degime_app/src/widgets/custom_text_form_field.dart';
import 'package:degime_app/src/widgets/custom_lined_button.dart';
import 'package:degime_app/src/widgets/custom_elevated_button.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserEditScreen extends ConsumerStatefulWidget {
  const UserEditScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UserEditScreen> createState() => _UserEditScreenState();
}

class _UserEditScreenState extends ConsumerState<UserEditScreen> {
  TextEditingController searchController = TextEditingController();

  List<String> buttonList = [
    TextConstant.str1ImageAdd,
    TextConstant.str2ImageAdd,
    TextConstant.str3ImageAdd,
    TextConstant.str4ImageAdd,
    TextConstant.strVideoAdd,
    TextConstant.strMapAdd,
    TextConstant.strLinkAdd,
    TextConstant.strBlankAdd,
    TextConstant.strSelfProfileAdd,
    TextConstant.strSlideAdd
  ];

  List<String> itemList = [
    TextConstant.str1ImageAdd,
    TextConstant.str2ImageAdd,
    TextConstant.str3ImageAdd
  ];

  List<String> inputList = [
    TextConstant.strProfile,
    TextConstant.strCompanyName,
    TextConstant.strRole,
    TextConstant.strPhone,
    TextConstant.strMobile,
    TextConstant.strEmail,
    TextConstant.strAddress
  ];

  File? _backImg;
  File? _avatarImg;

  @override
  void initState() {
    super.initState();
  }

  Future<File?> uploadImage() async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return null;
    final File image = File(pickedFile.path);
    return image;
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
            child: SizedBox(
              width: mediaQueryData.size.width,
              height: mediaQueryData.size.height,
              child: ListView(
                children: [
                  _buildButtonBar(context),
                  _buildSetting(context),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 32.h,
                        right: 32.h,
                        bottom: 100.v,
                      ),
                      decoration: AppDecoration.fillGray.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderTL10),
                      child: Column(
                        children: [
                          _buildBackgroundWidget(context),
                          SizedBox(height: 10.v),
                          _buildGroup141(context),
                          SizedBox(height: 44.v),
                          _buildInputs(context),
                          SizedBox(height: 20.v),
                          _buildElements(context),
                          SizedBox(height: 20.v),
                          _buildButtons(context),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget _buildButtonBar(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: AppDecoration.fillGray
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL10),
        padding: EdgeInsets.only(top: 20.v, right: 32.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Icon(Icons.subdirectory_arrow_left,
                  color: appTheme.deepPurpleA400),
            ),
            CustomElevatedButton(
              height: 24.v,
              width: 84.h,
              margin: EdgeInsets.symmetric(horizontal: 1.h),
              text: TextConstant.strPublish,
              buttonStyle: CustomButtonStyles.fillDeepOrangeR6,
              buttonTextStyle: CustomTextStyles.bodyMediumOnPrimary14,
            ),
            CustomElevatedButton(
              height: 24.v,
              width: 95.h,
              text: TextConstant.strPreview,
              buttonStyle: CustomButtonStyles.fillDeepPurpleA400R6,
              buttonTextStyle: CustomTextStyles.bodyMediumOnPrimary14,
            ),
            CustomElevatedButton(
              height: 24.v,
              width: 85.h,
              text: TextConstant.strSNSBtn,
              buttonStyle: CustomButtonStyles.fillDeepOrangeR6,
              buttonTextStyle: CustomTextStyles.bodyMediumOnPrimary14,
              onPressed: () {
                context.pushReplacementNamed(AppRoute.profile_sns.name);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSetting(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: AppDecoration.fillGray
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL10),
        padding: EdgeInsets.only(top: 10.v),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 40.h,
              margin: EdgeInsets.only(top: 3.v, left: 260.h),
              padding: EdgeInsets.symmetric(
                horizontal: 7.h,
                vertical: 2.v,
              ),
              decoration: AppDecoration.fillDeepOrange.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder7,
              ),
              child: Text(
                TextConstant.strBackground,
                style: CustomTextStyles.bodyMediumOnPrimary14,
              ),
            ),
            Container(
              width: 26.adaptSize,
              margin: EdgeInsets.only(top: 3.v, right: 40.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgSetting,
                height: 26.adaptSize,
                width: 26.adaptSize,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget

  Widget _buildBackgroundWidget(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 290.v,
        width: 370.h,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: _backImg == null
                  ? CustomImageView(
                      imagePath: ImageConstant.imgRectangleNoBorder,
                      height: 250.v,
                      width: 360.h,
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      border: Border.all(
                          width: 5.h, color: appTheme.deepPurpleA700),
                      radius: BorderRadius.all(Radius.circular(6.h)),
                    )
                  : Container(
                      alignment: Alignment.center,
                      child: Image.file(
                        _backImg!,
                        fit: BoxFit.cover,
                        height: 250.v,
                        width: 360.h,
                      ),
                    ),
            ),
            Padding(
              padding: EdgeInsets.all(20.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgEdit,
                height: 25.adaptSize,
                width: 25.adaptSize,
                alignment: Alignment.topRight,
                onTap: () async {
                  File? image = await uploadImage();
                  setState(() {
                    _backImg = image;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

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

  Widget _buildGroup141(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.topLeft,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Container(
                alignment: Alignment.center,
                child: _avatarImg == null
                    ? CircleAvatar(
                        radius: 50.h,
                        backgroundColor: appTheme.blueGray100,
                        backgroundImage:
                            AssetImage(ImageConstant.imgRectangleNoBorder),
                      )
                    : CircleAvatar(
                        radius: 50.h,
                        backgroundColor: appTheme.blueGray100,
                        backgroundImage: FileImage(_avatarImg!),
                      ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 40.h, left: 40.h, bottom: 30.h, right: 30.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgPlus,
                height: 25.adaptSize,
                width: 25.adaptSize,
                alignment: Alignment.topRight,
                onTap: () async {
                  File? image = await uploadImage();
                  setState(() {
                    _avatarImg = image;
                  });
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 13.h),
          child: Column(
            children: [
              _buildGroup140(context),
              SizedBox(height: 15.v),
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
    );
  }

  Widget _buildInputs(BuildContext context) {
    List<Widget> inputWidgets = [];

    for (String inputText in inputList) {
      inputWidgets.add(
        Padding(
          padding: EdgeInsets.only(left: 27.h, right: 27.h, top: 10.v),
          child: CustomTextFormField(
            hintText: inputText,
            hintStyle: CustomTextStyles.titleMediumFamiljenGroteskBlack900,
            autofocus: false,
          ),
        ),
      );
    }

    return Column(
      children: [
        ...inputWidgets,
      ],
    );
  }

  Widget _buildButtons(BuildContext context) {
    List<Widget> buttonWidgets = [];

    for (String buttonText in buttonList) {
      buttonWidgets.add(
        Padding(
          padding: EdgeInsets.only(left: 27.h, right: 27.h, top: 10.v),
          child: CustomLinedButton(
            height: 40.v,
            width: 255.h,
            text: buttonText,
            margin: EdgeInsets.only(top: 1.v, bottom: 1.v),
            buttonStyle: CustomButtonStyles.fillLightGray,
            buttonTextStyle:
                CustomTextStyles.titleMediumFamiljenGroteskBlack900,
            alignment: Alignment.topCenter,
            onPressed: () {},
          ),
        ),
      );
    }

    return Column(
      children: [
        ...buttonWidgets,
      ],
    );
  }

  Widget _buildElements(BuildContext context) {
    return SizedBox(
      height: (itemList.length + 1.5) * 40.v,
      child: ReorderableListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return ListTile(
            key: Key('$index'),
            title: CustomLinedButton(
              height: 40.v,
              width: 255.h,
              text: itemList[index],
              margin: EdgeInsets.only(top: 1.v, bottom: 1.v),
              buttonStyle: CustomButtonStyles.fillLightGray,
              buttonTextStyle:
                  CustomTextStyles.titleMediumFamiljenGroteskBlack900,
              alignment: Alignment.topCenter,
              onPressed: () {},
            ),
          );
        },
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final String item = itemList.removeAt(oldIndex);
            itemList.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
