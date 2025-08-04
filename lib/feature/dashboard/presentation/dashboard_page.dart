import 'package:credconnect/core/routes/app_router.dart';
import 'package:credconnect/feature/login/domain/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late final AuthController controller;
    late  String name = '';


  @override
  void initState() {
    super.initState();
    controller = GetIt.I<AuthController>();
    getName();
  }

  getName()async{
    name =  controller.name ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'CREDCONNECT',
          style: TextStyle(
            color: Color(0xFF0066F6),
            fontSize: 24,
            fontFamily: GoogleFonts.koulen().fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: const SizedBox(), 
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello $name',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF001533),
                        fontFamily: GoogleFonts.karla().fontFamily,
                      ),
                    ),
                    Text(
                      'Good morning, remember to check the incomes today',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF001533),
                        fontFamily: GoogleFonts.karla().fontFamily,
                      ),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/avatar.png',
                    width: 42,
                    height: 42,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 17),
            Container(
              width: double.infinity,
              height: 160,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
                color: Color(0xFF0066F6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Lending pool',
                    style: TextStyle(
                        color: Color(0xFF5299FF),
                        fontSize: 15,
                        fontFamily: GoogleFonts.karla().fontFamily,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '৳ 100.000',
                    style: TextStyle(
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: Color(0xFF5299FF),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: Color(0xFF5299FF),
                        shape: BoxShape.circle,
                      ),
                    )
                  ])
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => context.go(AppRouter.valueSimulateLoan),
                    child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFFD5F6EE),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icon/icon.png',
                                width: 24,
                                height: 24,
                              ),
                              const SizedBox(width: 16),
                              Text(
                                'New Loan',
                                style: TextStyle(
                                    color: Color(0xFF5E5E5E),
                                    fontSize: 17,
                                    fontFamily: GoogleFonts.karla().fontFamily,
                                    fontWeight: FontWeight.w400),
                              ),
                            ])),
                  ),
                ),
                const SizedBox(width: 22),
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF1D1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon/money (2) 1.png',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Collect',
                            style: TextStyle(
                                color: Color(0xFF5E5E5E),
                                fontSize: 17,
                                fontFamily: GoogleFonts.karla().fontFamily,
                                fontWeight: FontWeight.w400),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            const Text(
              'Tips for better work',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            Container(
              height: 66,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xFFC9C9C9), width: 1),
                color: Colors.white,
              ),
              child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        color: Color(0xFFF6FEFB),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/icon/wallet-filled-money-tool 1.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                    Text(
                      'How to collect payment',
                      style: TextStyle(
                        fontFamily: GoogleFonts.karla().fontFamily,
                        fontSize: 15,
                        color: Color(0xFF001533),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                )
            ),
            const SizedBox(height: 16),

            Container(
                height: 66,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xFFC9C9C9), width: 1),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        color: Color(0xFFF6FEFB),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/icon/money-bag 1.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                    Text(
                      'Manage clients and groups',
                      style: TextStyle(
                        fontFamily: GoogleFonts.karla().fontFamily,
                        fontSize: 15,
                        color: Color(0xFF001533),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                )),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        elevation: 8,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF1877F2),
        unselectedItemColor: const Color(0xFF94A3B8),
        showUnselectedLabels: true,
        items:  [
          BottomNavigationBarItem(
            icon: Image.asset(
                        'assets/icon/Group 21.png',
                        width: 30,
                        height: 30,
                      ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon:  Image.asset(
                        'assets/icon/Group 18.png',
                        width: 30,
                        height: 30,
                      ),
            label: 'New Loan',
          ),
          BottomNavigationBarItem(
            icon:  Image.asset(
                        'assets/icon/Group.png',
                        width: 30,
                        height: 30,
                      ),
            label: 'Upcoming',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
                        'assets/icon/Group 22.png',
                        width: 30,
                        height: 30,
                      ),
            label: 'Earnings',
          ),
          BottomNavigationBarItem(
            icon:  Image.asset(
                        'assets/icon/Vector.png',
                        width: 30,
                        height: 30,
                      ),
            label: 'Clients',
          ),
        ],
      ),
    );
  }
}
