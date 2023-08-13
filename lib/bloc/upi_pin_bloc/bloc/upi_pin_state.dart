// Abstract base class representing different states for UPI PIN process
abstract class UpiPinState {
  final String pin;
  final bool obsecurePin;

  const UpiPinState({
    required this.pin,
    required this.obsecurePin,
  });
}

// Base state representing the initial state of UPI PIN process
class UpiPinBaseState extends UpiPinState {
  const UpiPinBaseState({required super.pin, required super.obsecurePin});
}

// State representing an error in the UPI PIN process
class UpiPinErrorState extends UpiPinState {
  final String errorMessage;

  const UpiPinErrorState({required super.pin, required this.errorMessage, required super.obsecurePin});
}

// State representing loading state during the UPI PIN process
class UpiPinLoading extends UpiPinState {
  const UpiPinLoading({required super.pin, required super.obsecurePin});
}

// State representing successful completion of the UPI PIN process
class UpiPinSuccess extends UpiPinState {
  const UpiPinSuccess({required super.pin, required super.obsecurePin});
}
