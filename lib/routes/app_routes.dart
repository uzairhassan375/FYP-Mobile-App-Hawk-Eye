import 'package:flutter/material.dart';
import '../views/login/login_screen.dart';
import '../views/signup/signup_screen.dart';
import '../views/home/home_screen.dart';
import '../views/report/report_screen.dart';
import '../views/alerts/alerts_screen.dart';
import '../views/rewards/rewards_screen.dart';
import '../views/history/history_screen.dart';
import '../views/fines/fines_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String report = '/report';
  static const String alerts = '/alerts';
  static const String rewards = '/rewards';
  static const String history = '/history';
  static const String fines = '/fines';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case report:
        return MaterialPageRoute(builder: (_) => const ReportScreen());
      case alerts:
        return MaterialPageRoute(builder: (_) => const AlertsScreen());
      case rewards:
        return MaterialPageRoute(builder: (_) => const RewardsScreen());
      case history:
        return MaterialPageRoute(builder: (_) => const HistoryScreen());
      case fines:
        return MaterialPageRoute(builder: (_) => const FinesScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
