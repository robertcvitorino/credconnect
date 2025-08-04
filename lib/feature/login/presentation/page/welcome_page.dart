import 'package:credconnect/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome to CredConnect',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF001533),
                  fontFamily: GoogleFonts.karla().fontFamily,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 12),
              Text(
                'The loan bank for everyone.',
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF001533),
                  fontWeight: FontWeight.w300,
                  fontFamily: GoogleFonts.karla().fontFamily,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 160),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0066F6),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {
                  context.go(AppRouter.signUpPage);
                },
                child: Text(
                  'CREATE YOUR FREE ACCOUNT',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                    fontSize: 15,
                    fontFamily: GoogleFonts.karla().fontFamily,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFCBD5E1)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {
              context.go(AppRouter.login);
                },
                child: Text(
                  'LOG INTO YOUR ACCOUNT',
                  style: TextStyle(
                    color: Color(0xFF001533),
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                    fontSize: 15,
                    fontFamily: GoogleFonts.karla().fontFamily,
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
