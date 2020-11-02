import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:meta/meta.dart';
import '../models/user.dart';

class UserProvider {
  String get className => 'Registrations';

  UserProvider._();

  // ignore: prefer_constructors_over_static_methods
  static UserProvider get instance => UserProvider._();

  Future<void> handleRegisterUser({@required User user}) async {
    try {
      final ParseUser parse = await ParseUser.currentUser();
      if (parse == null) throw 'Não há nenhum usuário logado!';
      final ParseObject parseObject = ParseObject(className);
      parseObject.set('name', user.name);
      parseObject.set('email', user.email);
      parseObject.set('institution', user.institution);
      parseObject.set('userType', user.userType.formatInString);
      parseObject.set('administratorID', parse.objectId);
      await parseObject.create();
    } catch (_) {
      rethrow;
    }
  }

  Future<List<User>> handleGetAll() async {
    try {
      final ParseUser parse = await ParseUser.currentUser();
      if (parse == null) throw 'Não há nenhum usuário logado!';
      final ParseObject parseObject = ParseObject(className);
      final QueryBuilder<ParseObject> queryBuilder = QueryBuilder<ParseObject>(parseObject)
        ..whereEqualTo(
          'administratorID',
          parse.objectId,
        );
      final ParseResponse parseResponse = await queryBuilder.query();
      List<User> users = parseResponse.results
          .map((dynamic map) => User.fromMap(
                map: map,
              ))
          .toList();
      users.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return users;
    } catch (_) {
      rethrow;
    }
  }
}
