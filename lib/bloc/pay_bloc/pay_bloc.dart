import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_pay/bloc/pay_bloc/pay_event.dart';
import 'package:google_pay/bloc/pay_bloc/pay_state.dart';
import 'package:google_pay/model/user_dto.dart';

class PayBloc extends Bloc<PayEvent, PayState> {
  // Dependencies
  late UserModel payer;
  late UserModel payee;
  String amount = "";

  // Constructor
  PayBloc({required this.payee, required this.payer}) : super(PayBaseState(payee: payee, payer: payer, amount: "")) {
    // Handling ProceedToPay event
    on<ProceedToPay>((event, emit) async {
      int val = int.tryParse(amount) ?? 0;
      if (val <= 0) {
        // Amount must be at least 1
        emit(PayErrorState(errorMessage: "Payment must be at least \u20B9 1", payer: payer, payee: payee, amount: amount));
      } else {
        // Emitting loading state
        emit(PayProceedLoading(payer: payer, payee: payee, amount: amount));
        await Future.delayed(const Duration(seconds: 2), () {});
        // Emitting success state
        emit(PayProceedSuccess(payer: payer, payee: payee, amount: amount));
        // Removing success state and returning to base state
        await Future.delayed(const Duration(seconds: 1), () {});
        emit(PayBaseState(payer: payer, payee: payee, amount: amount));
      }
    });

    // Handling OnAmountEnter event
    on<OnAmountEnter>((event, emit) {
      amount = event.amount.replaceAll(',', '');
      emit(PayBaseState(payer: payer, payee: payee, amount: amount));
    });

    // Handling ResetPayEvent event
    on<ResetPayEvent>((event, emit) {
      amount = "";
      emit(PayBaseState(payer: payer, payee: payee, amount: amount));
    });
  }
}
