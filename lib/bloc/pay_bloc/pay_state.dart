
import '../../model/user_dto.dart';

abstract class PayState {
  final UserModel payer;
  final UserModel payee;
  final String amount;

  const PayState({required this.payer, required this.payee, required this.amount});
}

class PayBaseState extends PayState {
  const PayBaseState({required super.payer, required super.payee, required super.amount});
}

class PayErrorState extends PayState {
  final String errorMessage;
  const PayErrorState({required this.errorMessage, required super.payer, required super.payee, required super.amount});
}

class PayProceedLoading extends PayState {
  const PayProceedLoading({required super.payer, required super.payee, required super.amount});
}

class PayProceedSuccess extends PayState {
  const PayProceedSuccess({required super.payer, required super.payee, required super.amount});
}
