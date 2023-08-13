import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_pay/bloc/upi_pin_bloc/bloc/upi_pin_event.dart';
import 'package:google_pay/bloc/upi_pin_bloc/bloc/upi_pin_state.dart';

import '../../../model/user_dto.dart';

class UpiPinBloc extends Bloc<UpiPinEvent, UpiPinState> {
  // Variables for managing UPI PIN functionality
  String pin = "";
  UserModel? payer;
  UserModel? payee;
  String amount = "";
  bool obsecurePin = true;
  int numberOfPins = 4;

  UpiPinBloc() : super(const UpiPinBaseState(pin: "", obsecurePin: true)) {
    // Handling InitializeUpiPin event
    on<InitializeUpiPin>((event, emit) {
      payee = event.payee;
      payer = event.payer;
      amount = event.amount;
    });

    // Handling OnProceed event
    on<OnProceed>((event, emit) async {
      if (pin.length < numberOfPins) {
        emit(UpiPinErrorState(pin: pin, errorMessage: "please enter $numberOfPins digit UPI pin", obsecurePin: obsecurePin));
      } else {
        emit(UpiPinLoading(pin: pin, obsecurePin: obsecurePin));
        await Future.delayed(const Duration(milliseconds: 2000));
        emit(UpiPinSuccess(pin: pin, obsecurePin: obsecurePin));
      }
    });

    // Handling OnShowHidePin event
    on<OnShowHidePin>((event, emit) {
      obsecurePin = !obsecurePin;
      emit(UpiPinBaseState(pin: pin, obsecurePin: obsecurePin));
    });

    // Handling OnPinEnter event
    on<OnPinEnter>((event, emit) {
      pin = event.pin;
      emit(UpiPinBaseState(pin: pin, obsecurePin: obsecurePin));
    });

    // Handling ResetUpiPinEvent event
    on<ResetUpiPinEvent>((event, emit) {
      pin = "";
      payee = null;
      payer = null;
      amount = "";
      obsecurePin = true;
      emit(UpiPinBaseState(pin: pin, obsecurePin: obsecurePin));
    });
  }
}
