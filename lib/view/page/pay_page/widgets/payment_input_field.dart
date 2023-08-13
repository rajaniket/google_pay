import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/text_input_formatter.dart';

class PaymentInputField extends StatelessWidget {
  PaymentInputField({
    super.key,
    this.onChanged,
    this.onSubmitted,
  });
  final Function(String value)? onChanged;
  final Function(String value)? onSubmitted;
  final NumberTextInputFormatter _amountFormatter = NumberTextInputFormatter();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: TextField(
        textAlign: TextAlign.left,
        maxLength: 9,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        cursorColor: Colors.white30,
        autofocus: true,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 50,
        ),
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          _amountFormatter,
        ],
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(bottom: 9, left: 3),
          counterText: '',
          hintText: '0',
          hintStyle: TextStyle(
            color: Colors.white54,
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
