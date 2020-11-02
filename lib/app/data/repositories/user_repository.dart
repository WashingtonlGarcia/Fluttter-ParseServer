import '../models/user.dart';
import 'package:meta/meta.dart';
import '../providers/user_provider.dart';

class UserRepository {
  UserRepository._();

  // ignore: prefer_constructors_over_static_methods
  static UserRepository get instance => UserRepository._();

  final UserProvider _userProvider = UserProvider.instance;

  Future<void> handleRegisterUser({@required User user}) async {
    return _userProvider.handleRegisterUser(user: user);
  }

  Future<List<User>> handleGetAll() async {
    return _userProvider.handleGetAll();
  }
}
