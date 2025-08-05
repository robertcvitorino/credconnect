import 'package:credconnect/core/components/custom_text_form_filed.dart';
import 'package:credconnect/core/components/primary_button.dart';
import 'package:credconnect/core/routes/app_router.dart';
import 'package:credconnect/core/theme/app_colors.dart';
import 'package:credconnect/core/theme/app_text_styles.dart';
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
      backgroundColor: AppColors.background,
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is SucessState) {
              _clear();
              var snackBar = SnackBar(
                content: Text(
                  "User created successfully",
                  style: AppTextStyles.subtitle2,
                ),
                backgroundColor: AppColors.primary,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
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
                backgroundColor: AppColors.error,
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
                          style: AppTextStyles.headline3,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Open a CredConnect account with a few details.',
                          style: AppTextStyles.subtitle1.copyWith(fontSize: 15),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Full name',
                          style: AppTextStyles.subtitle1.copyWith(fontSize: 15),
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          controller: _nameController,
                          validator:
                              Validatorless.required('Full name is required'),
                          labelText: '',
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Phone number',
                          style: AppTextStyles.subtitle1.copyWith(fontSize: 15),
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          validator: Validatorless.multiple([
                            Validatorless.required('Phone number is required'),
                          ]),
                          labelText: '',
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Password',
                          style: AppTextStyles.subtitle1.copyWith(fontSize: 15),
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          controller: _passwordController,
                          validator: Validatorless.multiple([
                            Validatorless.required('Password is required'),
                          ]),
                          labelText: '',
                          obscureText: obscureText,
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
                        const SizedBox(height: 16),
                        Text(
                          'Repeat password',
                          style: AppTextStyles.subtitle1.copyWith(fontSize: 15),
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          controller: _confirmPasswordController,
                          validator: Validatorless.compare(
                              _passwordController, 'Passwords do not match'),
                          labelText: '',
                          obscureText: obscureText,
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
                                    child: PrimaryButton(
                                      text: 'CREATE YOUR ACCOUNT',
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
                                style:AppTextStyles.subtitle1.copyWith(fontSize: 15),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.go(AppRouter.login);
                                },
                                child:  Text(
                                  "Sign in here",
                                  style: AppTextStyles.headline3.copyWith(fontSize: 15),
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
