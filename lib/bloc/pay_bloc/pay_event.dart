import 'package:equatable/equatable.dart';

// Abstract base class for all PayEvent instances
abstract class PayEvent extends Equatable {
  const PayEvent();

  @override
  List<Object> get props => [];
}

// Event triggered when user proceeds with the payment
class ProceedToPay extends PayEvent {
  const ProceedToPay();
}

// Event triggered when the user enters an amount
class OnAmountEnter extends PayEvent {
  final String amount;

  const OnAmountEnter({
    required this.amount,
  });

  @override
  List<Object> get props => [amount]; // Include 'amount' in the props list
}

// Event triggered to reset the payment process
class ResetPayEvent extends PayEvent {
  const ResetPayEvent();
}
