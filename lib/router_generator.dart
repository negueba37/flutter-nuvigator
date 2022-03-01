import 'package:flutter/material.dart';
import 'package:proj/core/app_colors.dart';
import 'package:proj/models/package_model.dart';
import 'package:proj/models/producer_model.dart';
import 'package:proj/screens/favorites_screen.dart';
import 'package:proj/screens/home_screen.dart';
import 'package:proj/screens/login_screen.dart';
import 'package:proj/screens/package_details_screen.dart';
import 'package:proj/screens/payment_screen.dart';
import 'package:proj/screens/producer_details_screen.dart';
import 'package:proj/screens/profile_screen.dart';
import 'package:proj/screens/singup_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
        break;
      case 'sing-up':
        return MaterialPageRoute(builder: (_) => SingupScreen());
        break;
      case 'favorites':
        return MaterialPageRoute(builder: (_) => FavoritesScreen());
        break;
      case 'profile':
        return MaterialPageRoute(builder: (_) => ProfileScreen());
        break;
      case 'payment':
        return MaterialPageRoute(builder: (_) => PaymentScreen());
        break;
      case 'producer-details':
        if (args is Producer) {
          return MaterialPageRoute(
              builder: (_) => ProducerDetailsScreen(
                    producer: args,
                  ));
        }
        return _erroRoute();
        break;
      case 'package-details':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => PackageDetailsScreen(
                    package: args["pack"],
                    producer: args["producer"],
                  ));
        }

        return _erroRoute();
        break;
      default:
        _erroRoute();
    }
  }

  static Route<dynamic> _erroRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.green,
          title: Text("Erro"),
        ),
        body: Center(
          child: Text("Erro, rota não encontrada!"),
        ),
      );
    });
  }
}
