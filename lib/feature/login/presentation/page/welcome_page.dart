import 'package:credconnect/core/components/primary_button.dart';
import 'package:credconnect/core/components/secondary_button.dart';
import 'package:credconnect/core/routes/app_router.dart';
import 'package:credconnect/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                style: AppTextStyles.headline2.copyWith(fontSize: 42),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 12),
              Text(
                'The loan bank for everyone.',
                style: AppTextStyles.subtitle1,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 160),
              PrimaryButton(text: 'CREATE YOUR FREE ACCOUNT', onPressed: () { context.go(AppRouter.signUpPage);}),              
              const SizedBox(height: 12),
              SecondaryButton(text: 'LOG INTO YOUR ACCOUNT', onPressed: () { context.go(AppRouter.login);}),
               const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
