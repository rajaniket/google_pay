import 'package:equatable/equatable.dart';

import '../../../model/user_dto.dart';

// Abstract base class for all UPI PIN related events
abstract class UpiPinEvent extends Equatable {
  const UpiPinEvent();

  @override
  List<Object> get props => [];
}

// Event triggered to initialize UPI PIN process
class InitializeUpiPin extends UpiPinEvent {
  final UserModel payer;
  final UserModel payee;
  final String amount;

  const InitializeUpiPin({
    required this.payer,
    required this.payee,
    required this.amount,
  });

  @override
  List<Object> get props => [payer, payee, amount];
}

// Event triggered when user proceeds with the UPI PIN
class OnProceed extends UpiPinEvent {}

// Event triggered to show or hide the UPI PIN
class OnShowHidePin extends UpiPinEvent {}

// Event triggered when user enters the UPI PIN
class OnPinEnter extends UpiPinEvent {
  final String pin;

  const OnPinEnter({
    required this.pin,
  });

  @override
  List<Object> get props => [pin];
}

// Event triggered to reset the UPI PIN process
class ResetUpiPinEvent extends UpiPinEvent {}
