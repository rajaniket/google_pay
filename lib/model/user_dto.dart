// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String firstName;
  final String lastName;
  final String userId;
  final String imageUrl;
  final String mobile;
  final String upi;
  final String account;
  final String bankName;
  final String amount;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.userId,
    required this.imageUrl,
    required this.mobile,
    required this.upi,
    required this.account,
    required this.bankName,
    required this.amount,
  });

  @override
  String toString() {
    return 'UserModel{firstName: $firstName, lastName: $lastName, userId: $userId, image: $imageUrl, mobile: $mobile, upi: $upi, account: $account, bankName: $bankName, amount: $amount}';
  }

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? userId,
    String? imageUrl,
    String? mobile,
    String? upi,
    String? account,
    String? bankName,
    String? amount,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userId: userId ?? this.userId,
      imageUrl: imageUrl ?? this.imageUrl,
      mobile: mobile ?? this.mobile,
      upi: upi ?? this.upi,
      account: account ?? this.account,
      bankName: bankName ?? this.bankName,
      amount: amount ?? this.amount,
    );
  }
}
