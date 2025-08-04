import 'package:credconnect/core/routes/app_router.dart';
import 'package:credconnect/feature/loan/domain/controller/loan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ValueSimulateLoanPage extends StatefulWidget {
  const ValueSimulateLoanPage({super.key});

  @override
  State<ValueSimulateLoanPage> createState() => _ValueSimulateLoanPageState();
}

class _ValueSimulateLoanPageState extends State<ValueSimulateLoanPage> {
  late final LoanController controller;
  String _amount = "1000";

  @override
  void initState() {
    super.initState();
    controller = GetIt.I<LoanController>();
  }

  void _onKeyTap(String value) {
    setState(() {
      if (value == '⌫') {
        if (_amount.isNotEmpty) {
          _amount = _amount.substring(0, _amount.length - 1);
        }
      } else if (value == '.' && _amount.contains('.')) {
        return;
      } else {
        _amount += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final keys = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '.',
      '0',
      '⌫',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            context.go(AppRouter.dashboard);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 57),
            Text(
              'Simulate Loan',
              style: TextStyle(
                fontSize: 30,
                color: Color(0xFF64748B),
                fontFamily: GoogleFonts.karla().fontFamily,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Enter the amount you wish to borrow',
              style: TextStyle(
                fontSize: 17,
                color: Color(0xFF001533),
              ),
            ),
            const SizedBox(height: 52),
            Text(
              '৳ $_amount',
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0066F6),
              ),
            ),
            const Spacer(),
            GridView.builder(
              shrinkWrap: true,
              itemCount: keys.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 80,
              ),
              itemBuilder: (context, index) {
                final key = keys[index];
                return InkWell(
                  onTap: () => _onKeyTap(key),
                  child: Center(
                    child: key == '⌫'
                        ? const Icon(Icons.backspace_outlined, size: 24)
                        : Text(
                            key,
                            style: const TextStyle(fontSize: 42),
                          ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1877F2),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {
                  controller.loanAmount = double.parse(_amount);
                  context.go(AppRouter.loanSimulation);
                },
                child: const Text(
                  'CONTINUE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
