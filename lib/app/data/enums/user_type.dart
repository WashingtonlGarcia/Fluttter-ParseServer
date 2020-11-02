import 'package:meta/meta.dart';

// ignore: constant_identifier_names
enum UserType { ALUNO, PROFESSOR }

extension UserTypeExtension on UserType {
  String get formatInString {
    switch (this) {
      case UserType.ALUNO:
        return 'Aluno';
      case UserType.PROFESSOR:
        return 'Professor';
      default:
        return null;
    }
  }
}

UserType convertInUserType({@required String userType}) {
  switch (userType) {
    case 'Aluno':
      return UserType.ALUNO;
    case 'Professor':
      return UserType.PROFESSOR;
    default:
      return null;
  }
}
