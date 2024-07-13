import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_3/config/router/app_route.dart';
import 'package:task_3/models/product_model.dart';
import 'package:task_3/bloc/cart_bloc.dart';
import 'package:task_3/pages/screens/home_screen.dart';

List<ProductModel> cart = [];

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return BlocProvider(
      create: (BuildContext context) => CartBloc(),
      child: MaterialApp(
        onGenerateRoute: appRouter.onGeneratedRoute,
        title: 'shopping app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const Scaffold(
          body: HomeScreen(),
        ),
      ),
    );
  }
}
