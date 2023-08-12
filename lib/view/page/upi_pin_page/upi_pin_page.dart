import 'package:flutter/material.dart';
import 'package:google_pay/constants/app_colors.dart';
import 'package:google_pay/constants/url.dart';
import 'package:google_pay/view/page/upi_pin_page/widgets/custom_keyboard.dart';
import 'package:google_pay/view/page/upi_pin_page/widgets/expansion_tile.dart';
import 'package:google_pay/view/page/upi_pin_page/widgets/otp_field.dart';

class UpiPinPage extends StatefulWidget {
  const UpiPinPage({super.key});

  @override
  State<UpiPinPage> createState() => _UpiPinPageState();
}

class _UpiPinPageState extends State<UpiPinPage> {
  String value = "";
  bool obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.upiPinBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.darkBlueGooglePayColor,
        leading: Container(
          color: AppColors.upiCustomKeyboardBackgroundColor,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Axis Bank',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 26,
                child: Image.network(
                  URLConstants.upiLogoUrl,
                ),
              ),
            ],
          ),
        ),
        leadingWidth: double.infinity,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 80),
            alignment: Alignment.center,
            child: Column(
              children: [
                IntrinsicWidth(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'ENTER UPI PIN ',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 35),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  obsecureText = !obsecureText;
                                });
                              },
                              child: SizedBox(
                                width: 80,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      obsecureText ? Icons.visibility : Icons.visibility_off,
                                      color: AppColors.darkBlueGooglePayColor,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      obsecureText ? 'SHOW' : 'HIDE',
                                      style: const TextStyle(
                                        color: AppColors.darkBlueGooglePayColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      OTPField(
                        value: value,
                        maxField: 4,
                        obscureText: obsecureText,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: CustomKeyboard(
                    onChange: (val) {
                      setState(() {
                        value = val;
                      });
                    },
                    onDone: (value) {
                      Navigator.pushNamed(context, '/success');
                    },
                  ),
                ),
              ],
            ),
          ),
          const ExpansionTileWidget()
        ],
      ),
    );
  }
}
