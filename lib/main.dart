import 'package:flutter/material.dart';
import 'package:google_pay/view/page/pay_page/pay_page.dart';

import 'view/page/success_page/success_page.dart';
import 'view/page/upi_pin_page/upi_pin_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const MyHomePage(),
        '/pay': (context) => const PayScreen(),
        '/pin': (context) => const UpiPinPage(),
        '/success': (context) => const SuccessPage(),
      },
      // home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pay');
              },
              child: const Text("pay screen"),
            ),
          ),
        ],
      ),
    );
  }
}
