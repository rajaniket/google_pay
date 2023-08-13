import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_pay/bloc/upi_pin_bloc/bloc/upi_pin_event.dart';
import 'package:google_pay/constants/url.dart';
import 'package:google_pay/utils/snackbar_utils.dart';
import 'package:google_pay/view/page/pay_page/widgets/payment_bottom_sheet.dart';
import 'package:google_pay/view/page/pay_page/widgets/payment_input_field.dart';
import 'package:google_pay/view/page/upi_pin_page/upi_pin_page.dart';
import 'package:google_pay/view/widgets/circular_image.dart';
import '../../../bloc/pay_bloc/pay_bloc.dart';
import '../../../bloc/pay_bloc/pay_event.dart';
import '../../../bloc/pay_bloc/pay_state.dart';
import '../../../bloc/upi_pin_bloc/bloc/upi_pin_bloc.dart';
import '../../../constants/app_colors.dart';
import '../../../utils/navigation_transition.dart';

class PayScreen extends StatefulWidget {
  const PayScreen({super.key});

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  final GlobalKey<ScaffoldState> _snackBarKey = GlobalKey<ScaffoldState>();
  late PayBloc payBloc;
  late UpiPinBloc upiPinBloc;
  @override
  void initState() {
    payBloc = BlocProvider.of<PayBloc>(context);
    upiPinBloc = BlocProvider.of<UpiPinBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      key: _snackBarKey,
      child: BlocConsumer<PayBloc, PayState>(
        listener: (context, state) {
          if (state is PayProceedSuccess) {
            upiPinBloc.add(InitializeUpiPin(
                payer: state.payer.copyWith(amount: payBloc.amount), payee: state.payee.copyWith(amount: payBloc.amount), amount: payBloc.amount));
            Navigator.push(context, FadeRoute(page: UpiPinPage(maxField: upiPinBloc.numberOfPins)));
          } else if (state is PayErrorState) {
            showSnackBar(context, text: state.errorMessage);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              IgnorePointer(
                ignoring: state is PayProceedLoading,
                child: Opacity(
                  opacity: state is PayProceedLoading ? 0.3 : 1,
                  child: Scaffold(
                    backgroundColor: AppColors.lightBluegooglePayColor,
                    floatingActionButton: FloatingActionButton(
                      backgroundColor: Colors.white,
                      elevation: 5,
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                    ),
                    appBar: AppBar(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      actions: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert_rounded),
                        ),
                      ],
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularImageWithBorder(
                                imageUrl: state.payer.imageUrl,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                              CircularImageWithBorder(
                                imageUrl: state.payee.imageUrl,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Payment to ${state.payee.firstName} ${state.payee.lastName}",
                                  style: const TextStyle(color: Colors.white, fontSize: 15),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  state.payee.upi,
                                  style: const TextStyle(color: Colors.white, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                '\u20B9',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                ),
                              ),
                              PaymentInputField(
                                onChanged: (value) {
                                  BlocProvider.of<PayBloc>(context).add(OnAmountEnter(amount: value));
                                },
                                onSubmitted: (value) {},
                              ),
                            ],
                          ),
                          const Text(
                            'Payment via Billdesk',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          // kept to make screen scrollable when keyboard is visible
                          const SizedBox(
                            height: 200,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: PaymentBottomSheet(
                    bankName: state.payer.bankName,
                    baankImgUrl: URLConstants.axisBankImageUrl,
                    onExpand: () {},
                    onProceedToPay: () {
                      BlocProvider.of<PayBloc>(context).add(const ProceedToPay());
                    },
                    isLoading: state is PayProceedLoading,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
