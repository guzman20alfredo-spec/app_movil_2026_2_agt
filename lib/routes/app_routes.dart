import "package:flutter/material.dart";

import "../models/product_args.dart";
import "../screens/detail_screen.dart";
import "../screens/home_screen.dart";
import "../screens/quantity_screen.dart";

class AppRoutes {
  AppRoutes._();

  static const String home = "/";
  static const String detail = "/detalle";
  static const String quantity = "/cantidad";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute<void>(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
      case detail:
        final args = settings.arguments;
        if (args is ProductArgs) {
          return MaterialPageRoute<void>(
            builder: (_) => DetailScreen(args: args),
            settings: settings,
          );
        }
        return _errorRoute("La ruta /detalle requiere un ProductArgs.");
      case quantity:
        return MaterialPageRoute<int>(
          builder: (_) => const QuantityScreen(),
          settings: settings,
        );
      default:
        return _errorRoute("Ruta no encontrada: ${settings.name}");
    }
  }

  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute<void>(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Error de navegación")),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              message,
              style: const TextStyle(fontSize: 18, color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
