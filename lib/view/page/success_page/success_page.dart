import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_pay/bloc/pay_bloc/pay_bloc.dart';
import 'package:google_pay/bloc/pay_bloc/pay_event.dart';
import 'package:google_pay/bloc/upi_pin_bloc/bloc/upi_pin_event.dart';
import 'package:google_pay/constants/app_colors.dart';
import 'package:google_pay/model/user_dto.dart';
import 'package:google_pay/view/page/success_page/widgets/animated_check_icon.dart';
import 'package:google_pay/view/widgets/custom_button.dart';
import '../../../bloc/upi_pin_bloc/bloc/upi_pin_bloc.dart';
import '../../../utils/navigation_transition.dart';
import '../home_page/home_page.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key, required this.payee});
  final UserModel payee;
  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  late UpiPinBloc upiPinBloc;
  late PayBloc payBloc;
  @override
  void initState() {
    upiPinBloc = BlocProvider.of<UpiPinBloc>(context);
    payBloc = BlocProvider.of<PayBloc>(context);
    upiPinBloc.add(ResetUpiPinEvent());
    payBloc.add(const ResetPayEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBluegooglePayColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AnimatedCheck(),
            const SizedBox(
              height: 25,
            ),
            Text(
              "\u20B9 ${widget.payee.amount} paid",
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "${widget.payee.firstName} ${widget.payee.lastName}",
              style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.9)),
            ),
            Text(
              widget.payee.upi,
              style: const TextStyle(fontSize: 14, color: Colors.white54),
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              width: 120,
              child: CustomButton(
                text: "Done",
                onTap: () {
                  Navigator.pushAndRemoveUntil(context, FadeRoute(page: const MyHomePage()), (Route<dynamic> route) => false);
                },
                backgroundColor: Colors.black12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
