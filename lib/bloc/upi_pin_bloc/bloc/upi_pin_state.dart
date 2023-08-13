abstract class UpiPinState {
  final String pin;
  final bool obsecurePin;

  const UpiPinState({
    required this.pin,
    required this.obsecurePin,
  });
}

class UpiPinBaseState extends UpiPinState {
  const UpiPinBaseState({required super.pin, required super.obsecurePin});
}

class UpiPinErrorState extends UpiPinState {
  final String errorMessage;

  const UpiPinErrorState({required super.pin, required this.errorMessage, required super.obsecurePin});
}

class UpiPinLoading extends UpiPinState {
  const UpiPinLoading({required super.pin, required super.obsecurePin});
}

class UpiPinSuccess extends UpiPinState {
  const UpiPinSuccess({required super.pin, required super.obsecurePin});
}
