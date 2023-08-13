import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.backgroundColor = AppColors.lightBluegooglePayColor,
    required this.text,
    this.onTap,
    this.textColor = Colors.white,
    this.isLoading = false,
  });
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        disabledBackgroundColor: Colors.black12,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 11.0),
            child: AnimatedCrossFade(
              crossFadeState: isLoading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
              firstChild: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              secondChild: Container(
                padding: const EdgeInsets.all(3),
                child: const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
