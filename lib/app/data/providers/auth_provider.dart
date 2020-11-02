import 'package:flutter/cupertino.dart';
import '../errors/parse_errors.dart';
import 'package:meta/meta.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import '../models/auth_user.dart';

class AuthProvider {
  AuthProvider._();

  // ignore: prefer_constructors_over_static_methods
  static AuthProvider get instance => AuthProvider._();

  Future<String> handleSignIn({
    @required AuthUser authUser,
  }) async {
    try {
      final ParseUser parseUser = authUser;
      final ParseResponse parseResponse = await parseUser.login();
      if (parseResponse.success) {
        return 'Login efetuado com sucesso!';
      } else {
        throw ParseErrors.getDescription(parseResponse.error.code);
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<String> handleSignUp({
    @required AuthUser authUser,
  }) async {
    try {
      final ParseUser parseUser = authUser;
      final ParseResponse parseResponse = await parseUser.create();
      if (parseResponse.success) {
        return 'Usuario cadastrado com sucesso!';
      } else {
        throw ParseErrors.getDescription(parseResponse.error.code);
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<String> handleSignOut() async {
    try {
      final ParseUser parse = await ParseUser.currentUser();
      if (parse == null) throw 'Não há nenhum usuário logado!';
      ParseResponse parseResponse = await parse.logout();
      if (parseResponse.success) {
        return 'Usuario cadastrado com sucesso!';
      } else {
        throw ParseErrors.getDescription(parseResponse.error.code);
      }
    } catch (_) {
      rethrow;
    }
  }
}
