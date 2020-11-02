import '../providers/auth_provider.dart';
import 'package:meta/meta.dart';
import '../models/auth_user.dart';

class AuthRepository {
  AuthRepository._();

  // ignore: prefer_constructors_over_static_methods
  static AuthRepository get instance => AuthRepository._();

  final AuthProvider _authProvider = AuthProvider.instance;

  Future<String> handleSignIn({
    @required AuthUser authUser,
  }) async {
    return _authProvider.handleSignIn(authUser: authUser);
  }

  Future<String> handleSignUp({
    @required AuthUser authUser,
  }) async {
    return _authProvider.handleSignUp(
      authUser: authUser,
    );
  }

  Future<void> handleSignOut() async {
    return _authProvider.handleSignOut();
  }
}
