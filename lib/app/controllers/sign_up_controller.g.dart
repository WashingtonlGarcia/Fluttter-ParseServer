// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpController on SignUpControllerBase, Store {
  final _$_loadingAtom = Atom(name: 'SignUpControllerBase._loading');

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  final _$_authUserAtom = Atom(name: 'SignUpControllerBase._authUser');

  @override
  AuthUser get _authUser {
    _$_authUserAtom.reportRead();
    return super._authUser;
  }

  @override
  set _authUser(AuthUser value) {
    _$_authUserAtom.reportWrite(value, super._authUser, () {
      super._authUser = value;
    });
  }

  final _$_isObscurePasswordAtom =
      Atom(name: 'SignUpControllerBase._isObscurePassword');

  @override
  bool get _isObscurePassword {
    _$_isObscurePasswordAtom.reportRead();
    return super._isObscurePassword;
  }

  @override
  set _isObscurePassword(bool value) {
    _$_isObscurePasswordAtom.reportWrite(value, super._isObscurePassword, () {
      super._isObscurePassword = value;
    });
  }

  final _$SignUpControllerBaseActionController =
      ActionController(name: 'SignUpControllerBase');

  @override
  void handleObscurePassword() {
    final _$actionInfo = _$SignUpControllerBaseActionController.startAction(
        name: 'SignUpControllerBase.handleObscurePassword');
    try {
      return super.handleObscurePassword();
    } finally {
      _$SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
