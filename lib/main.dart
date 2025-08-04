import 'package:credconnect/core/di/injection.dart';
import 'package:credconnect/core/routes/app_router.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return MaterialApp.router(
      title: 'CredConnect',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.router,      
    );
  }
}
