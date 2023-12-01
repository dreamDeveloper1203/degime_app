import 'package:degime_app/src/utils/string_validators.dart';
import 'package:flutter/cupertino.dart';

/// Mixin class to be used for client-side email & password validation
mixin EmailAndPasswordValidators {
  final StringValidator emailSubmitValidator =
      NonEmptyStringValidator(); //EmailSubmitRegexValidator();
  final StringValidator passwordSignInSubmitValidator =
      NonEmptyStringValidator();

  bool canSubmitEmail(String email) {
    return emailSubmitValidator.isValid(email);
  }

  bool canSubmitName(String name) {
    return emailSubmitValidator.isValid(name) && name.length >= 4;
  }

  bool canSubmitPassword(String password) {
    return passwordSignInSubmitValidator.isValid(password) &&
        password.length >= 6;
  }

  bool canSubmitRePassword(String password, String repassword) {
    return emailSubmitValidator.isValid(repassword) && password == repassword;
  }

  String? emailErrorText(String email, BuildContext context) {
    final bool showErrorText = !canSubmitEmail(email);
    // final String errorText = email.isEmpty
    //     ? AppLocalizations.of(context).emailCantBeEmpty
    //     : AppLocalizations.of(context).invalidEmailAddr;
    // return showErrorText ? errorText : null;
    return showErrorText ? 'emailCantBeEmpty' : null;
  }

  String? passwordErrorText(String password, BuildContext context) {
    final bool showErrorText = !canSubmitPassword(password);
    final String errorText =
        password.isEmpty ? 'pwdCantBeEmpty' : 'pwdIsTooShort';
    return showErrorText ? errorText : null;
  }
}
