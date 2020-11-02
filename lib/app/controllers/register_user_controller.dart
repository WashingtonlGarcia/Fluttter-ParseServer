import '../data/models/user.dart';
import '../data/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';

part 'register_user_controller.g.dart';

class RegisterUserController = RegisterUserControllerBase with _$RegisterUserController;

abstract class RegisterUserControllerBase with Store {
  final UserRepository _userRepository = UserRepository.instance;

  @observable
  User _user = User();

  @observable
  bool _loading = false;

  String get name => _user.name;

  set name(String value) => _user.name = value;

  String get email => _user.email;

  set email(String value) => _user.email = value;

  UserType get userType => _user.userType;

  set userType(UserType value) => _user.userType = value;

  String get institution => _user.institution;

  set institution(String value) => _user.institution = value;

  // ignore: unnecessary_getters_setters
  set loading(bool value) => _loading = value;

  // ignore: unnecessary_getters_setters
  bool get loading => _loading;

  Future<void> handleRegisterUser() async {
    return _userRepository.handleRegisterUser(user: _user);
  }
}
