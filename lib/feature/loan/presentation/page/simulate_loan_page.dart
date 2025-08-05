import 'package:credconnect/core/routes/app_router.dart';
import 'package:credconnect/feature/loan/domain/bloc/loan_bloc.dart';
import 'package:credconnect/feature/loan/domain/controller/loan_controller.dart';
import 'package:credconnect/feature/loan/domain/entity/loan_entity.dart';
import 'package:credconnect/feature/loan/domain/event/loan_event.dart';
import 'package:credconnect/feature/loan/domain/state/loan_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoanSimulatePage extends StatefulWidget {
  const LoanSimulatePage({
    super.key,
  });

  @override
  State<LoanSimulatePage> createState() => _LoanSimulatePageState();
}

class _LoanSimulatePageState extends State<LoanSimulatePage> {
  late final LoanController controller;
  final List<int> terms = [3, 6, 9];
  int selectedTerm = 6;
  late final LoanBloc loanBloc;

  @override
  void initState() {
    super.initState();
    controller = GetIt.I<LoanController>();
    loanBloc = GetIt.I<LoanBloc>();
  }

  @override
  void dispose() {
    loanBloc.close();
    super.dispose();
  }

  createLoan() {
    loanBloc.add(
      CreateLoanEvent(
        loan: LoanEntity(
            clientId: controller.selectedClient?.id ?? 0,
            loanAmount: controller.loanAmount.toString(),
            tax: '6.39',
            term: selectedTerm.toString()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loanBloc,
      child: BlocConsumer<LoanBloc, LoanState>(
        listener: (context, state) {
          if (state is SucessState) {
            context.go(AppRouter.success);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                onPressed: () => context.go(AppRouter.valueSimulateLoan),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  const Text(
                    'Amount and term',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Loan Amount',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF64748B),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '৳ ${controller.loanAmount}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF0F172A),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Text(
                                      '+50',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 22),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Term (months)',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              const SizedBox(height: 4),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _TermOption(
                                        value: 3,
                                        selected: selectedTerm == 3,
                                        onTap: () =>
                                            setState(() => selectedTerm = 3),
                                      ),
                                      _TermOption(
                                        value: 6,
                                        selected: selectedTerm == 6,
                                        onTap: () =>
                                            setState(() => selectedTerm = 6),
                                      ),
                                      _TermOption(
                                        value: 9,
                                        selected: selectedTerm == 9,
                                        onTap: () =>
                                            setState(() => selectedTerm = 9),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'Other',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey.shade400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select customer',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF001533),
                            fontFamily: GoogleFonts.karla().fontFamily),
                      ),
                      Text('Required',
                          style: TextStyle(color: Colors.red, fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 249, 251, 252),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: controller.selectedClient != null
                              ? Text(controller.selectedClient!.name)
                              : Text('Select customer'),
                        ),
                        controller.selectedClient == null
                            ? GestureDetector(
                                onTap: () => context.go(AppRouter.newClient),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 14.0),
                                  child: Text(
                                    '+ Add new',
                                    style: TextStyle(
                                        color: Color(0xFF666666),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily:
                                            GoogleFonts.karla().fontFamily),
                                  ),
                                ),
                              )
                            : IconButton(
                                onPressed: () {
                                  controller.clearClient();
                                  setState(() {});
                                },
                                icon: Icon(Icons.delete)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 26),
                  Text(
                    'Interest rate (%)',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF001533),
                        fontFamily: GoogleFonts.karla().fontFamily),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 249, 251, 252),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: const Text('6.39 - Basic Loan'),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: BlocBuilder<LoanBloc, LoanState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1877F2),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          onPressed: () {
                            if (controller.selectedClient == null) {
                              final sankBar = SnackBar(
                                content: const Text('Select a client'),
                                backgroundColor: Colors.red,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(sankBar);
                            } else {
                              createLoan();
                            }
                          },
                          child: const Text(
                            'OPEN REQUEST',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TermOption extends StatelessWidget {
  final int value;
  final bool selected;
  final VoidCallback onTap;

  const _TermOption({
    required this.value,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        '${value}x',
        style: TextStyle(
          fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
          color: selected ? Colors.black : Colors.grey.shade400,
          fontSize: 13,
        ),
      ),
    );
  }
}
