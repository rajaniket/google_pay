import '../../model/user_dto.dart';

// Abstract base class representing different payment states
abstract class PayState {
  final UserModel payer;
  final UserModel payee;
  final String amount;

  const PayState({
    required this.payer,
    required this.payee,
    required this.amount,
  });
}

// Base payment state representing the initial state
class PayBaseState extends PayState {
  const PayBaseState({
    required super.payer,
    required super.payee,
    required super.amount,
  });
}

// Payment state representing an error during the payment process
class PayErrorState extends PayState {
  final String errorMessage;

  const PayErrorState({
    required this.errorMessage,
    required super.payer,
    required super.payee,
    required super.amount,
  });
}

// Payment state representing loading during the payment process
class PayProceedLoading extends PayState {
  const PayProceedLoading({
    required super.payer,
    required super.payee,
    required super.amount,
  });
}

// Payment state representing successful completion of the payment process
class PayProceedSuccess extends PayState {
  const PayProceedSuccess({
    required super.payer,
    required super.payee,
    required super.amount,
  });
}
