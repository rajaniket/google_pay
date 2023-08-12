import 'package:flutter/material.dart';
import 'package:google_pay/constants/url.dart';
import 'package:google_pay/data/model/user_dto.dart';
import 'package:google_pay/view/page/pay_page/widgets/payment_bottom_sheet.dart';
import 'package:google_pay/view/page/pay_page/widgets/payment_input_field.dart';
import 'package:google_pay/view/page/upi_pin_page/upi_pin_page.dart';
import 'package:google_pay/view/widgets/circular_image.dart';
import '../../../constants/app_colors.dart';

class PayScreen extends StatefulWidget {
  const PayScreen({super.key});

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  late UserModel userModel = UserModel(
    firstName: "Aanya",
    lastName: "Joshi",
    userId: "user_008",
    image: "https://randomuser.me/api/portraits/men/44.jpg",
    mobile: "+91 2109876543",
    upi: "aanyajoshi@upi",
    account: "IN89012345678901",
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: AppColors.lightBluegooglePayColor,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.white,
              elevation: 5,
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert_rounded),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularImageWithBorder(imageUrl: URLConstants.profileImageUrl),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                      CircularImageWithBorder(imageUrl: URLConstants.redBusImageUrl),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          "Payment to red Bus",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "(redbus@axis)",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        '\u20B9',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                      PaymentInputField(
                        onChanged: (value) {},
                        onSubmitted: (value) {},
                      ),
                    ],
                  ),
                  const Text(
                    'Payment via Billdesk',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  // kept to make screen scrollable when keyboard is visible
                  const SizedBox(
                    height: 200,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: PaymentBottomSheet(
                bankName: "Your Bank",
                baankImgUrl: URLConstants.axisBankImageUrl,
                onExpand: () {},
                onProceedToPay: () {
                  Navigator.pushNamed(context, '/pin');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
