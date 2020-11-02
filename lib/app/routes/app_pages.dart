import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ui/views/views.dart';
import 'app_routes.dart';

abstract class AppPages {
  static const String initialRoute = AppRoutes.signIn;

  static Route<MaterialPageRoute> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (context) => DashboardView(), settings: routeSettings);
      case AppRoutes.signUp:
        return MaterialPageRoute(builder: (context) => SignUpView(), settings: routeSettings);
      case AppRoutes.registerUser:
        return MaterialPageRoute(builder: (context) => CadastroUserView(), settings: routeSettings);
      case AppRoutes.signIn:
      default:
        return MaterialPageRoute(builder: (context) => SignInView(), settings: routeSettings);
    }
  }
}
