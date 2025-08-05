import 'package:credconnect/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            SizedBox(
              width: 200,
              height: 200,              
              child:  Center(
                child:Image.asset(
                  'assets/check-circle.png',),
              ),
            ),
            const SizedBox(height: 32),

             Text(
              'Congratulations!',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w500,
                fontFamily: GoogleFonts.karla().fontFamily,
                color: Color(0xFF151522),
              ),
            ),
            const SizedBox(height: 26),

             Text(
              'Your Request was completed successfully',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
                fontFamily: GoogleFonts.karla().fontFamily,
                color: Color(0xFF9CA3AF),
              ),
            ),
            const SizedBox(height: 12),

             Text(
              'Remember to ensure timely payments.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                  fontFamily: GoogleFonts.karla().fontFamily,
                color: Color(0xFF6B7280),
              ),
            ),
            Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.go(AppRouter.dashboard);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF16BE81),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  'DONE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
