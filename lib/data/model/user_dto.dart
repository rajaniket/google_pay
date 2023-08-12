class UserModel {
  final String firstName;
  final String lastName;
  final String userId;
  final String image;
  final String mobile;
  final String upi;
  final String account;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.userId,
    required this.image,
    required this.mobile,
    required this.upi,
    required this.account,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      userId: json['userId'],
      image: json['image'],
      mobile: json['mobile'],
      upi: json['upi'],
      account: json['account'],
    );
  }

  @override
  String toString() {
    return 'UserModel{firstName: $firstName, lastName: $lastName, userId: $userId, image: $image, mobile: $mobile, upi: $upi, account: $account}';
  }
}
