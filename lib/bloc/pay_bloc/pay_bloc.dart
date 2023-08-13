import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_pay/bloc/pay_bloc/pay_event.dart';
import 'package:google_pay/bloc/pay_bloc/pay_state.dart';
import 'package:google_pay/model/user_dto.dart';

class PayBloc extends Bloc<PayEvent, PayState> {
  // dependencies
  late UserModel payer;
  late UserModel payee;
  String amount = "";

  PayBloc({required this.payee, required this.payer}) : super(PayBaseState(payee: payee, payer: payer, amount: "")) {
    on<ProceedToPay>((event, emit) async {
      int val = int.tryParse(amount) ?? 0;
      if (val <= 0) {
        // amount must be at least 1
        emit(PayErrorState(errorMessage: "Payment must be at least \u20B9 1", payer: payer, payee: payee, amount: amount));
      } else {
        emit(PayProceedLoading(payer: payer, payee: payee, amount: amount));
        await Future.delayed(const Duration(seconds: 2), () {}); // added to simulate loading
        emit(PayProceedSuccess(payer: payer, payee: payee, amount: amount));
        // removing success state getting back to base state after navigation
        await Future.delayed(const Duration(seconds: 1), () {});
        emit(PayBaseState(payer: payer, payee: payee, amount: amount));
      }
    });
    on<OnAmountEnter>((event, emit) {
      amount = event.amount.replaceAll(',', '');
      emit(PayBaseState(payer: payer, payee: payee, amount: amount));
    });
    on<ResetPayEvent>((event, emit) {
      amount = "";
      emit(PayBaseState(payer: payer, payee: payee, amount: amount));
    });
  }
}
