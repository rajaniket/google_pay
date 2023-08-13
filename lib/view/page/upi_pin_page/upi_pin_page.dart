import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_pay/bloc/upi_pin_bloc/bloc/upi_pin_bloc.dart';
import 'package:google_pay/bloc/upi_pin_bloc/bloc/upi_pin_state.dart';
import 'package:google_pay/constants/app_colors.dart';
import 'package:google_pay/constants/url.dart';
import 'package:google_pay/view/page/success_page/success_page.dart';
import 'package:google_pay/view/page/upi_pin_page/widgets/custom_keyboard.dart';
import 'package:google_pay/view/page/upi_pin_page/widgets/expansion_tile.dart';
import 'package:google_pay/view/page/upi_pin_page/widgets/otp_field.dart';
import '../../../bloc/upi_pin_bloc/bloc/upi_pin_event.dart';
import '../../../utils/navigation_transition.dart';
import '../../../utils/snackbar_utils.dart';

class UpiPinPage extends StatefulWidget {
  final int maxField;
  const UpiPinPage({super.key, required this.maxField});
  @override
  State<UpiPinPage> createState() => _UpiPinPageState();
}

class _UpiPinPageState extends State<UpiPinPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;
  late UpiPinBloc upiPinBloc;

  @override
  void initState() {
    _controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 1, end: 50).animate(_controller);
    upiPinBloc = BlocProvider.of<UpiPinBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpiPinBloc, UpiPinState>(
      listener: (context, state) async {
        if (state is UpiPinSuccess) {
          {
            _controller.forward();
            await Future.delayed(const Duration(seconds: 1), () {
              Navigator.pushAndRemoveUntil(context, FadeRoute(page: SuccessPage(payee: upiPinBloc.payee!)), (Route<dynamic> route) => false);
            });
          }
        } else if (state is UpiPinErrorState) {
          showSnackBar(context, text: state.errorMessage, height: 10);
        } else if (state is UpiPinLoading) {
          // _controller.forward();
        }
      },
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            IgnorePointer(
              ignoring: state is UpiPinLoading,
              child: Opacity(
                opacity: state is UpiPinLoading ? 0.4 : 1,
                child: Scaffold(
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
                          Text(
                            upiPinBloc.payee != null ? upiPinBloc.payee!.bankName : "your bank",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 26,
                            child: Image.asset(
                              PathConstants.upiLogoPath,
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
                                            upiPinBloc.add(OnShowHidePin());
                                          },
                                          child: SizedBox(
                                            width: 80,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  state.obsecurePin ? Icons.visibility : Icons.visibility_off,
                                                  color: AppColors.darkBlueGooglePayColor,
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  state.obsecurePin ? 'SHOW' : 'HIDE',
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
                                    value: state.pin,
                                    maxField: widget.maxField,
                                    obscureText: state.obsecurePin,
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 250,
                              child: CustomKeyboard(
                                onChange: (val) {
                                  upiPinBloc.add(OnPinEnter(pin: val));
                                },
                                onDone: (value) async {
                                  upiPinBloc.add(OnProceed());
                                },
                                maxLength: widget.maxField,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (upiPinBloc.payee != null) ExpansionTileWidget(payee: upiPinBloc.payee!),
                    ],
                  ),
                ),
              ),
            ),
            ScaleTransition(
              scale: animation,
              child: Visibility(
                visible: state is UpiPinLoading || state is UpiPinSuccess,
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                    color: AppColors.lightBluegooglePayColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
