import 'package:meta/meta.dart';
import '../enums/user_type.dart';
export '../enums/user_type.dart';

class User {
  String id;
  String name;
  String email;
  UserType userType;
  String institution;
  DateTime createdAt;
  DateTime updateAt;
  String administratorID;

  User({
    this.id,
    this.name,
    this.userType,
    this.email,
    this.institution,
    this.createdAt,
    this.updateAt,
    this.administratorID,
  });

  factory User.fromMap({@required dynamic map}) {
    if (map == null) return null;
    return User(
      id: map['objectId'] as String,
      name: map['name'] as String,
      userType: convertInUserType(userType: map['userType'] as String),
      email: map['email'] as String,
      institution: map['institution'] as String,
      createdAt: map['createdAt'] as DateTime,
      updateAt: map['updateAt'] as DateTime,
      administratorID: map['administratorID'] as String,
    );
  }
}
