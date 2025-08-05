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
      backgroundColor: AppColors.background,
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is ErrorState) {
              var snackBar = SnackBar(
                content: Text(
                  state.exception.message,
                  style: AppTextStyles.subtitle2.copyWith(fontSize: 15),
                ),
                backgroundColor: AppColors.error,
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
                          style:AppTextStyles.headline3, 
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Log into your CredConnect account',
                          style:AppTextStyles.subtitle1.copyWith(fontSize: 15),),
                        const SizedBox(height: 52),
                        Text(
                          'Phone number',
                          style:AppTextStyles.subtitle1.copyWith(fontSize: 15)
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          controller: _phoneController,
                          validator:
                              Validatorless.required('Phone is required'),
                          keyboardType: TextInputType.phone, labelText: '',
                          
                        ),                        
                        const SizedBox(height: 16),
                         Text('Password',style:AppTextStyles.subtitle1.copyWith(fontSize: 15)),
                        const SizedBox(height: 6),
                        CustomTextFormField(
                          controller: _passwordController,
                          validator:
                              Validatorless.required('Password is required'),
                          obscureText: obscureText,
                          labelText: '',
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
                        const SizedBox(height: 12),
                        RichText(
                          text: TextSpan(
                           style:AppTextStyles.subtitle1.copyWith(fontSize: 14,fontWeight: FontWeight.w300),
                            children: [
                              const TextSpan(
                                  text: 'Have you forgotten your password?,\n'),
                              TextSpan(
                                text: 'click here to recover it',
                               style:AppTextStyles.subtitle1.copyWith(fontSize: 15,color: AppColors.primary),
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
                                      color: AppColors.primary,
                                    ),
                                  )
                                : SizedBox(
                                    width: double.infinity,
                                    child: PrimaryButton(text: 'LOG IN', onPressed: () {
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
                                      },) 
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
