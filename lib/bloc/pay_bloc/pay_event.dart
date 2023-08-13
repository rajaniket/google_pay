import 'package:equatable/equatable.dart';

abstract class PayEvent extends Equatable {
  const PayEvent();
  @override
  List<Object> get props => [];
}

class ProceedToPay extends PayEvent {
  const ProceedToPay();
}

class OnAmountEnter extends PayEvent {
  final String amount;
  const OnAmountEnter({
    required this.amount,
  });
}

class ResetPayEvent extends PayEvent {}
