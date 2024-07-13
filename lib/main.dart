import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:task_3/cart_provider.dart';
import 'package:task_3/config/router/app_route.dart';
import 'package:task_3/core/constants/app_color.dart';
import 'package:task_3/pages/screens/home_screen.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return ChangeNotifierProvider(
      create: (BuildContext context) => Cart(),
      child: MaterialApp(
        onGenerateRoute: appRouter.onGeneratedRoute,
        title: 'shopping app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
        ),
        home: const Scaffold(
          body: HomeScreen(),
        ),
      ),
    );
  }
}
