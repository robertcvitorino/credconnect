import 'package:credconnect/core/routes/app_router.dart';
import 'package:credconnect/feature/loan/domain/bloc/loan_bloc.dart';
import 'package:credconnect/feature/loan/domain/entity/client_entity.dart';
import 'package:credconnect/feature/loan/domain/event/loan_event.dart';
import 'package:credconnect/feature/loan/domain/state/loan_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validatorless/validatorless.dart';

class AddCustomerPage extends StatefulWidget {
  const AddCustomerPage({super.key});

  @override
  State<AddCustomerPage> createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage> {
  late final LoanBloc bloc;
  final formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final nidController = TextEditingController();
  final addressController = TextEditingController();
  final birthDateController = TextEditingController();
  final genderController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    nidController.dispose();
    addressController.dispose();
    birthDateController.dispose();
    genderController.dispose();
    super.dispose();
  }

  void addCustomer() {
    bloc.add(CreateClientEvent(
      client: ClientEntity(
        name: '${firstNameController.text} ${lastNameController.text}',
        nid: nidController.text,
        address: addressController.text,
        birthDate: birthDateController.text,
        gender: genderController.text,
      ),
    ));
  }

  @override
  void initState() {
    super.initState();
    bloc = GetIt.I<LoanBloc>();
  }

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: const Color(0xFFF9FAFB),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.go(AppRouter.loanSimulation),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocConsumer<LoanBloc, LoanState>(
          listener: (context, state) {
            if (state is ErrorState) {
              var snackBar = SnackBar(
                content: Text(
                  state.exception.message,
                  style: TextStyle(
                      fontFamily: GoogleFonts.karla().fontFamily,
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is SucessState) {
              var snackBar = SnackBar(
                content: Text(
                  "Client created successfully",
                  style: TextStyle(
                      fontFamily: GoogleFonts.karla().fontFamily,
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context)
                  .showSnackBar(snackBar)
                  .closed
                  .then((value) => context.go(AppRouter.loanSimulation));
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUnfocus,
                child: ListView(
                  children: [
                    const SizedBox(height: 33),
                    const Text(
                      'New customer',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 26),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'First name',
                                style: TextStyle(
                                    color: Color(0xFF001533),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.karla().fontFamily),
                              ),
                              const SizedBox(height: 6),
                              TextFormField(
                                validator: Validatorless.required(
                                  'First name is required',
                                ),
                                controller: firstNameController,
                                decoration: inputDecoration,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Last name',
                                style: TextStyle(
                                    color: Color(0xFF001533),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.karla().fontFamily),
                              ),
                              const SizedBox(height: 6),
                              TextFormField(
                                validator: Validatorless.required(
                                  'Last name is required',
                                ),
                                controller: lastNameController,
                                decoration: inputDecoration,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 26),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Date of birth',
                          style: TextStyle(
                              color: Color(0xFF001533),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: GoogleFonts.karla().fontFamily),
                        ),
                        Text(
                          'Required',
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      validator: Validatorless.required(
                        'Date of birth is required',
                      ),
                       inputFormatters: [
        MaskedInputFormatter('####/##/##'), // yyyy/MM/dd
      ],
                      controller: birthDateController,
                      keyboardType: TextInputType.number,
                      decoration: inputDecoration,
                    ),
                    const SizedBox(height: 26),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Gender',
                          style: TextStyle(
                              color: Color(0xFF001533),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: GoogleFonts.karla().fontFamily),
                        ),
                        Text(
                          'Required',
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      validator: Validatorless.required(
                        'Gender is required',
                      ),
                      controller: genderController,
                      decoration: inputDecoration,
                    ),
                    const SizedBox(height: 26),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'National ID (NID)',
                          style: TextStyle(
                              color: Color(0xFF001533),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: GoogleFonts.karla().fontFamily),
                        ),
                        Text(
                          'Required',
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      validator: Validatorless.required(
                        'National ID (NID) is required',
                      ),
                      controller: nidController,
                      decoration: inputDecoration,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 26),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Current address',
                          style: TextStyle(
                              color: Color(0xFF001533),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: GoogleFonts.karla().fontFamily),
                        ),
                        Text(
                          'Optional',
                          style: TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: addressController,
                      decoration: inputDecoration,
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: BlocBuilder<LoanBloc, LoanState>(
                        builder: (context, state) {
                          if (state is LoadingState) {
                            return const CircularProgressIndicator(
                              color: Color(0xFF1877F2),
                              backgroundColor: Colors.white,
                            );
                          }
                          return ElevatedButton(
                            onPressed: () {
                              final formValid =
                                  formKey.currentState?.validate() ?? false;
                              if (formValid) {
                                addCustomer();
                              } else {
                                var snackBar = const SnackBar(
                                  content: Text('Please, check the fields'),
                                  backgroundColor: Colors.red,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1877F2),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: const Text(
                              'SAVE NEW CUSTOMER',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0.5,
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
      ),
    );
  }
}
