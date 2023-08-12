import 'package:flutter/material.dart';

class OTPField extends StatelessWidget {
  const OTPField({
    super.key,
    this.maxField = 4,
    this.obscureText = true,
    required this.value,
  }) : assert(maxField >= 4 && maxField <= 6, 'max field must follow this 4<= maxField <=6');
  final int maxField;
  final String value;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    List<Widget> fieldList = generateFields();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...fieldList,
      ],
    );
  }

  List<Widget> generateFields() {
    int valueLength = value.length;
    return List.generate(
      maxField,
      (index) {
        return PinField(
          value: index < valueLength ? value[index] : "",
          obscureText: obscureText,
          isActiveField: index < valueLength && valueLength != 0,
        );
      },
    );
  }
}

class PinField extends StatelessWidget {
  const PinField({
    super.key,
    this.isActiveField = false,
    this.value = "",
    this.obscureText = true,
  });
  final bool isActiveField;
  final bool obscureText;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: 35,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              obscureText && value != "" ? "●" : value,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            Divider(
              thickness: 2,
              color: isActiveField ? Colors.black : Colors.black26,
            )
          ],
        ),
      ),
    );
  }
}
