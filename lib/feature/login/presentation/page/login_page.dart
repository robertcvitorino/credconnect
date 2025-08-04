import 'package:credconnect/core/routes/app_router.dart';
import 'package:credconnect/feature/login/domain/bloc/auth_bloc.dart';
import 'package:credconnect/feature/login/domain/event/auth_event.dart';
import 'package:credconnect/feature/login/domain/states/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  late AuthBloc bloc;
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
    bloc = GetIt.I<AuthBloc>();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocConsumer<AuthBloc, AuthState>(
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
              context.go(AppRouter.dashboard);
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            context.go(AppRouter.welcome);
                          },
                        ),
                        const SizedBox(height: 70),
                        Text(
                          'Sign into your\nAccount',
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0066F6),
                              fontFamily: GoogleFonts.karla().fontFamily),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Log into your CredConnect account',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF001533),
                              fontWeight: FontWeight.w300,
                              fontFamily: GoogleFonts.karla().fontFamily),
                        ),
                        const SizedBox(height: 58),
                        Text(
                          'Phone number',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: const Color(0xFF001533),
                            fontFamily: GoogleFonts.karla().fontFamily,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _phoneController,
                          validator:
                              Validatorless.required('Phone is required'),
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFF1F5F9),
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 14),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text('Password'),
                        const SizedBox(height: 6),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: obscureText,
                          validator:
                              Validatorless.required('Password is required'),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFF1F5F9),
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            suffix: GestureDetector(
                              onTap: () {
                                obscureText = !obscureText;
                                setState(() {});
                              },
                              child: Icon(
                                obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black26,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                                color: Color(0xFF001533), fontSize: 14),
                            children: [
                              const TextSpan(
                                  text: 'Have you forgotten your password?,\n'),
                              TextSpan(
                                text: 'click here to recover it',
                                style: const TextStyle(
                                  color: Color(0xFF1877F2),
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: null,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 172),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return state is LoadingState
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Color(0xFF1877F2),
                                    ),
                                  )
                                : SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFF1877F2),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                      ),
                                      onPressed: () {
                                        final formValid =
                                            _formKey.currentState?.validate() ??
                                                false;
                                        if (formValid) {
                                          bloc.add(LoginWithPhonePasswordEvent(
                                            phone: _phoneController.text,
                                            password: _passwordController.text,
                                          ));
                                        } else {
                                          var snackBar = const SnackBar(
                                            content: Text(
                                                'Please, check the fields'),
                                            backgroundColor: Colors.red,
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                      },
                                      child: Text(
                                        'LOG IN',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily:
                                              GoogleFonts.karla().fontFamily,
                                        ),
                                      ),
                                    ),
                                  );
                          },
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: Wrap(
                            children: [
                              Text('Do you not have a CredConnect account? ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15,
                                      color: Color(0xFF001533),
                                      fontFamily:
                                          GoogleFonts.karla().fontFamily)),
                              GestureDetector(
                                onTap: () {
                                  context.go(AppRouter.signUpPage);
                                },
                                child: const Text(
                                  'Sign up here',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
