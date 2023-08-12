import 'package:flutter/material.dart';
import '../../../../constants/app_colors.dart';

class CustomKeyboard extends StatefulWidget {
  const CustomKeyboard({
    super.key,
    this.onChange,
    this.onDone,
    this.maxLength = 4,
  });
  final Function(String)? onChange;
  final Function(String)? onDone;
  final int maxLength;
  @override
  State<CustomKeyboard> createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  String output = "";

  addChar(String val) {
    if (output.length < widget.maxLength) {
      output = output + val;
    }
    if (widget.onChange != null) {
      widget.onChange!(output);
    }
  }

  removeLastChar() {
    output = output.isEmpty ? output : output.substring(0, output.length - 1);
    widget.onChange!(output);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.upiCustomKeyboardBackgroundColor,
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: List.generate(
                3,
                (index) => Expanded(
                  child: keyWidget(
                    text: "${index + 1}",
                    onTap: (val) {
                      addChar(val);
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: List.generate(
                3,
                (index) => Expanded(
                  child: keyWidget(
                    text: "${index + 4}",
                    onTap: (val) {
                      addChar(val);
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: List.generate(
                3,
                (index) => Expanded(
                  child: keyWidget(
                    text: "${index + 7}",
                    onTap: (val) {
                      addChar(val);
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: keyWidget(
                    widget: const Icon(
                      Icons.backspace,
                      color: AppColors.darkBlueGooglePayColor,
                    ),
                    onTap: (_) {
                      removeLastChar();
                    },
                  ),
                ),
                Expanded(
                  child: keyWidget(
                    text: "0",
                    onTap: (val) {
                      addChar(val);
                    },
                  ),
                ),
                Expanded(
                  child: keyWidget(
                    widget: const CircleAvatar(
                      radius: 35,
                      backgroundColor: AppColors.darkBlueGooglePayColor,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    onTap: (_) {
                      if (widget.onDone != null) {
                        widget.onDone!(output);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  keyWidget({
    String text = "",
    Function(String val)? onTap,
    Widget? widget,
    Color color = AppColors.darkBlueGooglePayColor,
  }) {
    return Material(
      color: Colors.transparent,
      child: ClipRRect(
        child: InkWell(
          onTap: () {
            if (onTap != null) onTap(text);
          },
          child: Center(
            child: widget ??
                Text(
                  text,
                  style: TextStyle(
                    color: color,
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
