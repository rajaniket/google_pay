import 'package:flutter/material.dart';
import 'package:google_pay/model/user_dto.dart';

import '../../../../constants/app_colors.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({super.key, required this.payee});
  final UserModel payee;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkBlueGooglePayColor,
      child: ExpansionTile(
        title: Text("${payee.firstName} ${payee.lastName} service"),
        children: [
          paymentDetailTile(title: "Paying to", detail: "${payee.firstName} ${payee.lastName}"),
          paymentDetailTile(title: "Amount", detail: "\u20B9 ${payee.amount}"),
          paymentDetailTile(title: "REF ID", detail: "123456789sdf"),
          paymentDetailTile(title: "AXIS_BANK", detail: "xxxx xxxx 1234"),
        ],
        //textColor: Colors,
      ),
    );
  }

  ListTile paymentDetailTile({required String title, required String detail}) {
    return ListTile(
      dense: true,
      title: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white.withOpacity(0.75),
                fontSize: 12,
              ), // Change text color
            ),
          ),
          Text(
            detail,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ), // Change text color
          ),
        ],
      ),
    );
  }
}
