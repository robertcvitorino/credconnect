import 'package:credconnect/feature/dashboard/presentation/dashboard_page.dart';
import 'package:credconnect/feature/loan/presentation/page/add_customer_page.dart';
import 'package:credconnect/feature/loan/presentation/page/simulate_loan_page.dart';
import 'package:credconnect/feature/loan/presentation/page/value_simulate_loan_page.dart';
import 'package:credconnect/feature/login/presentation/page/login_page.dart';
import 'package:credconnect/feature/login/presentation/page/signup_page.dart';
import 'package:credconnect/feature/login/presentation/page/splash_screen_page.dart';
import 'package:credconnect/feature/login/presentation/page/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppRouter {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String signUpPage = '/register';
  static const String dashboard = '/dashboard';
  static const String valueSimulateLoan = '/value-simulate-loan';
  static const String loanSimulation = '/loan-simulation';
  static const String loanRequest = '/loan-request';
  static const String newClient = '/new-client';
  static const String success = '/success';

  late final GoRouter router = GoRouter(
    initialLocation: splash, 
    routes: <RouteBase>[
      GoRoute(
        name: splash,
        path: splash,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreenPage();
        },
      ),
      GoRoute(
        name: welcome,
        path: welcome,
        builder: (BuildContext context, GoRouterState state) {
          return const WelcomePage();
        },
      ),
      GoRoute(
        name: login,
        path: login,
        builder: (BuildContext context, GoRouterState state) {
          return LoginPage();
        },
      ),
      GoRoute(
        name: signUpPage,
        path: signUpPage,
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpPage();
        },
      ),
      GoRoute(
        name: dashboard,
        path: dashboard,
        builder: (BuildContext context, GoRouterState state) {
          return DashboardPage();
        },
      ),
      GoRoute(
        name: valueSimulateLoan,
        path: valueSimulateLoan,
        builder: (BuildContext context, GoRouterState state) {
          return ValueSimulateLoanPage();
        },
      ),
      GoRoute(
        name: loanSimulation,
        path: loanSimulation,
        builder: (BuildContext context, GoRouterState state) {
        
          return LoanSimulatePage();
        },
      ),
      GoRoute(
        name: loanRequest,
        path: loanRequest,
        builder: (BuildContext context, GoRouterState state) {
          return const Scaffold(body: Center(child: Text('Loan Request Page')));
        },
      ),
      GoRoute(
        name: newClient,
        path: newClient,
        builder: (BuildContext context, GoRouterState state) {
          return AddCustomerPage();
        },
      ),
      GoRoute(
        name: success,
        path: success,
        builder: (BuildContext context, GoRouterState state) {
          return const Scaffold(body: Center(child: Text('Success Page')));
        },
      ),
    ],
    // (Opcional) Adicione um errorBuilder para lidar com rotas não encontradas.
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Página não encontrada: ${state.error}'),
      ),
    ),
  );
}
