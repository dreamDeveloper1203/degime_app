import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:degime_app/src/network/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  String? _uid; // AuthRepository will not use data model.

  String? get uid => _uid;

  set setUid(String str) {
    _uid = str;
  }

  Future<bool> doLogIn(String username, String password) async {
    final data = await DioClient.postLogin(username, password);
    developer.log('doLogin() returned: $data');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', false);
    await prefs.setString('token', '');

    var result = data['message'];
    if (result == 'OK') {
      _uid = data['id'].toString();
      await prefs.setBool('isLogin', true);
      await prefs.setString("token", data['data']['accessToken'].toString());
      return true;
    } else if (result == 'Invalid User') {
    } else if (result == 'Invalid Password') {}

    return false;
  }

  Future<bool> doSendMobile(String phone) async {
    await Future.delayed(const Duration(seconds: 1));

    return true;
  }

  Future<bool> doVerifyOTP(String otp) async {
    await Future.delayed(const Duration(seconds: 1));

    return true;
  }

  Future<bool> doResetPwd(String newPwd) async {
    await Future.delayed(const Duration(seconds: 1));

    return true;
  }

  Future<void> doLogOut() async {
    _uid = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('login_id', 'not');
    prefs.setBool('isLogin', false);
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});
