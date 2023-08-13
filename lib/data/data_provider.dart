import 'package:google_pay/constants/url.dart';

import '../model/user_dto.dart';

class DataProvider {
  UserModel getPayer() {
    UserModel userModel = UserModel(
      firstName: "Aanya",
      lastName: "Joshi",
      userId: "user_008",
      imageUrl: URLConstants.profileImageUrl,
      mobile: "+912109876543",
      upi: "aanyajoshi@upi",
      account: "IN89012345678901",
      bankName: "Axis Bank",
      amount: "",
    );
    return userModel;
  }

  UserModel getPayee() {
    UserModel userModel = UserModel(
      firstName: "Red",
      lastName: "Bus",
      userId: "user_001",
      imageUrl: URLConstants.redBusImageUrl,
      mobile: "+918109876543",
      upi: "redbus@upi",
      account: "IN89012345678901",
      bankName: "Axis Bank",
      amount: "",
    );
    return userModel;
  }
}
