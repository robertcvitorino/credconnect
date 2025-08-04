// ignore_for_file: use_build_context_synchronously

import 'package:credconnect/core/routes/app_router.dart';
import 'package:credconnect/feature/login/domain/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  late final AuthController controller;

  @override
  void initState() {
    super.initState();
    controller = GetIt.I<AuthController>();
    goApp();
  }

  goApp() async {
    Future.delayed(const Duration(seconds: 3));
    if (await controller.isLogged()) {
      context.go(AppRouter.dashboard);
    } else {
      context.go(AppRouter.welcome);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Text(
          'CREDCONNECT',
          style: TextStyle(
              color: Color(0xFF0066F6),
              fontSize: 36,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.koulen().fontFamily),
        ),
      ),
    );
  }
}
