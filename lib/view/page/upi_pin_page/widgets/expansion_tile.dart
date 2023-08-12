import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkBlueGooglePayColor,
      child: ExpansionTile(
        title: const Text("Xyz finicial service"),
        children: [
          paymentDetailTile(title: "Paying to", detail: "Red Bus"),
          paymentDetailTile(title: "Amount", detail: "1000"),
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
