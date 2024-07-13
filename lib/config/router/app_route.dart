import 'package:flutter/material.dart';
import 'package:task_3/config/router/route.dart';
import 'package:task_3/pages/screens/checkout_screen.dart';
import 'package:task_3/pages/screens/home_screen.dart';
import 'package:task_3/pages/screens/shipping_screen.dart';
import 'package:task_3/pages/screens/shopping_cart_screen.dart';

class AppRouter {
  Route onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.shop:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.shoppingCart:
        return MaterialPageRoute(
          builder: (_) => const ShoppingCartScreen(),
        );
      case Routes.shippingAddress:
        return MaterialPageRoute(
          builder: (_) => const ShippingAddressScreen(),
        );
      case Routes.checkout:
        return MaterialPageRoute(
          builder: (_) => const CheckoutScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Text("Hi"),
        );
    }
  }
}
