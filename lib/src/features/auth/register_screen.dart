import 'package:degime_app/src/features/auth/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:degime_app/src/features/auth/auth_controllers.dart';
import 'package:degime_app/src/features/auth/login_validators.dart';
import 'package:degime_app/src/routing/app_router.dart';
import 'package:degime_app/src/constants/app_styles.dart';
import 'package:degime_app/src/utils/dialogs.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen>
    with EmailAndPasswordValidators {
  final _node = FocusScopeNode();
  final _usermailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isRePasswordVisible = false;

  String get username => _usernameController.text;
  String get password => _passwordController.text;
  String get usermail => _usermailController.text;
  String get repassword => _repasswordController.text;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TextEditingControllers should be always disposed.
    _node.dispose();
    _usermailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _repasswordController.dispose();

    super.dispose();
  }

  void _submit() {
    FocusManager.instance.primaryFocus?.unfocus();
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
    controller.registerUser(username, password, username).then(
      (value) {
        showToast("Register Success");
        context.goNamed(AppRoute.login.name);
      },
    );
  }

  void _emailEditingComplete() {
    if (canSubmitEmail(usermail)) {
      _node.nextFocus();
    }
  }

  void _nameEditingComplete() {
    if (canSubmitName(username)) {
      _node.nextFocus();
    }
  }

  void _passwordEditingComplete() {
    if (canSubmitPassword(password)) {
      _node.nextFocus();
      _node.nextFocus();
    }
  }

  void _repasswordEditingComplete() {
    if (!canSubmitRePassword(password, repassword)) {
      _node.previousFocus();
      _node.previousFocus();
      return;
    }
    _submit();
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
                            Text('新規登録', style: MainTitle),
                            Flexible(flex: 1, child: SizedBox(height: 150.h)),
                            Align(
                              alignment: Alignment.center,
                              child: RichText(
                                  text: TextSpan(
                                      text: 'すでに登録済みの方は',
                                      style: NormalText,
                                      children: <TextSpan>[
                                    TextSpan(
                                        text: 'こちら',
                                        style: NormalLinkText,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LoginScreen(),
                                                ));
                                          }),
                                    TextSpan(
                                        text: 'からログインできます', style: NormalText)
                                  ])),
                            ),
                            Flexible(flex: 1, child: SizedBox(height: 150.h)),
                            SizedBox(
                              height: 100,
                              child: TextField(
                                controller: _usermailController,
                                //validator: (username) => emailErrorText(username ?? ''),
                                autocorrect: false,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                cursorColor: Colors.white,
                                onEditingComplete: () =>
                                    _emailEditingComplete(),
                                decoration: InputDecoration(
                                    labelText: "Eメール",
                                    icon: Icon(Icons.email),
                                    hintText: "メールアドレスを入力してください",
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
                                onEditingComplete: () => _nameEditingComplete(),
                                decoration: InputDecoration(
                                    labelText: "ユーザー名(半角英数字４文字以上)",
                                    icon: Icon(Icons.person),
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
                                textInputAction: TextInputAction.next,
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
                            Flexible(flex: 1, child: SizedBox(height: 30.h)),
                            SizedBox(
                              height: 100,
                              child: TextField(
                                controller: _repasswordController,
                                keyboardType: TextInputType.visiblePassword,
                                //validator: (pwd) => passwordErrorText(pwd ?? ''),
                                obscureText: !_isRePasswordVisible,
                                autocorrect: false,
                                textInputAction: TextInputAction.next,
                                cursorColor: Colors.white,
                                onEditingComplete: () =>
                                    _repasswordEditingComplete(),
                                decoration: InputDecoration(
                                    labelText: "パスワードを再入力してください",
                                    icon: Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      icon: _isRePasswordVisible
                                          ? Icon(Icons.visibility)
                                          : Icon(Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          _isRePasswordVisible =
                                              !_isRePasswordVisible;
                                        });
                                      },
                                    ),
                                    hintText: "パスワード再入力",
                                    border: UnderlineInputBorder()),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                '登録すると、利用規約・プライバシーポリシーに同意したとみなします',
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
                                '新規登録',
                                style: TextStyle(
                                  color: Colors.white, // Text color
                                  fontSize: 16.0, // Text size
                                ),
                              ),
                            ),
                            Flexible(flex: 1, child: SizedBox(height: 300.h)),
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
