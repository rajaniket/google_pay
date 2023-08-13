import 'package:equatable/equatable.dart';

import '../../../model/user_dto.dart';

abstract class UpiPinEvent extends Equatable {
  const UpiPinEvent();
  @override
  List<Object> get props => [];
}

class InitializeUpiPin extends UpiPinEvent {
  final UserModel payer;
  final UserModel payee;
  final String amount;

  const InitializeUpiPin({required this.payer, required this.payee, required this.amount});
}

class OnProceed extends UpiPinEvent {}

class OnShowHidePin extends UpiPinEvent {}

class OnPinEnter extends UpiPinEvent {
  final String pin;
  const OnPinEnter({
    required this.pin,
  });
}

class ResetUpiPinEvent extends UpiPinEvent {}
