import 'package:flutter/material.dart';
import 'package:google_pay/constants/app_colors.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isLoading = !isLoading;
            });
          },
          child: AnimatedContainer(
            height: isLoading ? 100 : null,
            width: isLoading ? 100 : null,
            duration: const Duration(milliseconds: 400),
            decoration: BoxDecoration(
              color: AppColors.lightBluegooglePayColor,
              borderRadius: BorderRadius.circular(isLoading ? 1000 : 0),
            ),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
