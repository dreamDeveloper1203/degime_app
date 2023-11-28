import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:degime_app/src/features/auth/auth_controllers.dart';
import 'package:degime_app/src/features/auth/login_validators.dart';
import 'package:degime_app/src/routing/app_router.dart';
import 'package:degime_app/src/constants/app_styles.dart';
import 'package:degime_app/src/utils/dialogs.dart';

import 'package:degime_app/src/features/home/home_screen.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen>
    with EmailAndPasswordValidators {
  final _node = FocusScopeNode();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  String get username => _usernameController.text;
  String get password => _passwordController.text;

  @override
  void initState() {
    super.initState();
    getLoginFlag();
  }

  @override
  void dispose() {
    // TextEditingControllers should be always disposed.
    _node.dispose();
    _usernameController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void _submit() {
    FocusManager.instance.primaryFocus?.unfocus();
    showToast('ddd');
    // check username textfield's validation.
    final emailError = emailErrorText(username, context);
    if (emailError != null) {
      showToast(emailError);
      return;
    }

    // check password textfield's validation.
    final pwdError = passwordErrorText(password, context);
    if (pwdError != null) {
      showToast(pwdError);
      return;
    }

    // try to login with input data.
    final controller = ref.read(loginControllerProvider.notifier);
    controller.doLogin(username, password).then(
      (value) {
        // go home only if login success.
        if (value == true) {
          showToast("Login Success");
          context.goNamed(AppRoute.home.name);
        }
      },
    );
  }

  void _emailEditingComplete() {
    if (canSubmitEmail(username)) {
      _node.nextFocus();
    }
  }

  void _passwordEditingComplete() {
    if (!canSubmitEmail(username)) {
      _node.previousFocus();
      return;
    }

    // i can't understand why this called multiple...
    //if (ref.watch(loginControllerProvider).isLoading) return;
    _submit();
  }

  Future<void> getLoginFlag() async {
    final controller = ref.read(loginControllerProvider.notifier);
    controller.getLoggedInID();
    bool data = await controller.isLogin();
    // if (data) {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const HomeScreen(),
    //       ));
    // }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: FocusScope(
            node: _node,
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('新規登録', style: MainTilte),
                            Flexible(flex: 1, child: SizedBox(height: 150.h)),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'すでに登録済みの方は、こちらからログインできます',
                                style: NormalText,
                              ),
                            ),
                            Flexible(flex: 1, child: SizedBox(height: 150.h)),
                            SizedBox(
                              height: 100,
                              child: TextField(
                                controller: _usernameController,
                                //validator: (username) => emailErrorText(username ?? ''),
                                autocorrect: false,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                cursorColor: Colors.white,
                                onEditingComplete: () =>
                                    _emailEditingComplete(),
                                decoration: InputDecoration(
                                    labelText: "ユーザー名(半角英数字４文字以上)",
                                    icon: Icon(Icons.email),
                                    hintText: "ユーザー名を入力してください",
                                    border: UnderlineInputBorder()),
                              ),
                            ),
                            Flexible(flex: 1, child: SizedBox(height: 30.h)),
                            SizedBox(
                              height: 100,
                              child: TextField(
                                controller: _usernameController,
                                //validator: (username) => emailErrorText(username ?? ''),
                                autocorrect: false,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                cursorColor: Colors.white,
                                onEditingComplete: () =>
                                    _emailEditingComplete(),
                                decoration: InputDecoration(
                                    labelText: "ユーザー名かメールアドレスを入力してください",
                                    icon: Icon(Icons.email),
                                    hintText: "ユーザー名を入力してください",
                                    border: UnderlineInputBorder()),
                              ),
                            ),
                            Flexible(flex: 1, child: SizedBox(height: 30.h)),
                            SizedBox(
                              height: 100,
                              child: TextField(
                                controller: _passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                //validator: (pwd) => passwordErrorText(pwd ?? ''),
                                obscureText: !_isPasswordVisible,
                                autocorrect: false,
                                textInputAction: TextInputAction.done,
                                cursorColor: Colors.white,
                                onEditingComplete: () =>
                                    _passwordEditingComplete(),
                                decoration: InputDecoration(
                                    labelText: "パスワード",
                                    icon: Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      icon: _isPasswordVisible
                                          ? Icon(Icons.visibility)
                                          : Icon(Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          _isPasswordVisible =
                                              !_isPasswordVisible;
                                        });
                                      },
                                    ),
                                    hintText: "半角英数字６文字以上",
                                    border: UnderlineInputBorder()),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'パスワードを忘れた方',
                                style: SmallText,
                              ),
                            ),
                            Flexible(flex: 1, child: SizedBox(height: 160.h)),
                            // Rounded Login Button
                            ElevatedButton(
                              onPressed: () => _submit(),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue, // Background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      90.0), // Rounded corners
                                ),
                                padding: EdgeInsets.symmetric(vertical: 15.0),
                                minimumSize: Size(double.infinity,
                                    50.0), // Adjust vertical padding
                              ),
                              child: Text(
                                'ログイン',
                                style: TextStyle(
                                  color: Colors.white, // Text color
                                  fontSize: 16.0, // Text size
                                ),
                              ),
                            ),
                            Flexible(flex: 1, child: SizedBox(height: 100.h)),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
