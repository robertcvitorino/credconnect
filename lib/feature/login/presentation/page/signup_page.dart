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

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late AuthBloc bloc;
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
    bloc = GetIt.I<AuthBloc>();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  _clear() {
    _nameController.clear();
    _phoneController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {           
            if (state is SucessState) {
              _clear();
             var snackBar = SnackBar(
                content: Text(
                 "User created successfully",
                  style: TextStyle(fontFamily: GoogleFonts.karla().fontFamily,fontSize: 16,color: Colors.white,fontWeight: FontWeight.w400),
                ),
                backgroundColor: Color( 0xFF0066F6),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is ErrorState) {
              var snackBar = SnackBar(
                content: Text(
                  state.exception.message,
                   style: TextStyle(fontFamily: GoogleFonts.karla().fontFamily,fontSize: 16,color: Colors.white,fontWeight: FontWeight.w400),
                ),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUnfocus,
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
                          'Create Account',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                            fontFamily: GoogleFonts.karla().fontFamily,
                            color: const Color(0xFF0066F6),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Open a CredConnect account with a few details.',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts.karla().fontFamily,
                            color: const Color(0xFF001533),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Full name',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: const Color(0xFF001533),
                            fontFamily: GoogleFonts.karla().fontFamily,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _nameController,
                          validator:
                              Validatorless.required('Full name is required'),
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFF1F5F9),
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 14),
                          ),
                        ),
                        const SizedBox(height: 16),
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
                          validator: Validatorless.multiple([
                            Validatorless.required('Phone number is required'),
                          ]),
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
                        Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: const Color(0xFF001533),
                            fontFamily: GoogleFonts.karla().fontFamily,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          obscureText: obscureText,
                          controller: _passwordController,
                          validator: Validatorless.multiple([
                            Validatorless.required('Password is required'),
                          ]),
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
                        const SizedBox(height: 16),
                        Text(
                          'Repeat password',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: const Color(0xFF001533),
                            fontFamily: GoogleFonts.karla().fontFamily,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          obscureText: obscureText,
                          controller: _confirmPasswordController,
                          validator: Validatorless.compare(
                              _passwordController, 'Passwords do not match'),
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
                        const SizedBox(height: 94),
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
                                          bloc.add(RegisterEvent(
                                            name: _nameController.text,
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
                                      child:  Text(
                                        'CREATE YOUR ACCOUNT',
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
                            alignment: WrapAlignment.center,
                            children: [
                              Text(
                                "Do you already have a CredConnect account? ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: const Color(0xFF001533),
                                  fontFamily: GoogleFonts.karla().fontFamily,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.go(AppRouter.login);
                                },
                                child: const Text(
                                  "Sign in here",
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontWeight: FontWeight.w600,
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
