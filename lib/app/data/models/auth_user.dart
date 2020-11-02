import 'package:parse_server_sdk/parse_server_sdk.dart';

class AuthUser extends ParseUser {
  AuthUser({
    String name,
    String password,
    String emailAddress,
  }) : super(
          name,
          password,
          emailAddress,
        );
}
