import '../data/repositories/auth_repository.dart';
import 'package:mobx/mobx.dart';
import '../data/models/auth_user.dart';

part 'sign_in_controller.g.dart';

class SignInController = SignInControllerBase with _$SignInController;

abstract class SignInControllerBase with Store {
  AuthRepository _authRepository = AuthRepository.instance;

  @observable
  bool _loading = false;

  @observable
  AuthUser _authUser = AuthUser();

  @observable
  bool _isObscurePassword = true;

  // ignore: unnecessary_getters_setters
  set isObscurePassword(bool value) => _isObscurePassword = value;

  // ignore: unnecessary_getters_setters
  bool get isObscurePassword => _isObscurePassword;

  // ignore: unnecessary_getters_setters
  set loading(bool value) => _loading = value;

  // ignore: unnecessary_getters_setters
  bool get loading => _loading;

  set emailAddress(String value) => _authUser.emailAddress = value;

  String get emailAddress => _authUser.emailAddress;

  set userName(String value) => _authUser.username = value;

  String get userName => _authUser.username;

  set password(String value) => _authUser.password = value;

  String get password => _authUser.password;

  Future<String> handleSignIn() {
    return _authRepository.handleSignIn(authUser: _authUser);
  }

  @action
  void handleObscurePassword() {
    isObscurePassword = !isObscurePassword;
  }
}
