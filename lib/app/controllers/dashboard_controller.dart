import '../data/models/user.dart';
import '../data/repositories/auth_repository.dart';
import '../data/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';

part 'dashboard_controller.g.dart';

class DashboardController = DashboardControllerBase with _$DashboardController;

abstract class DashboardControllerBase with Store {
  AuthRepository _authRepository = AuthRepository.instance;
  UserRepository _userRepository = UserRepository.instance;

  Future<List<User>> handleGetAll() async {
    return _userRepository.handleGetAll();
  }

  Future<void> handleSignOut() {
    return _authRepository.handleSignOut();
  }
}
