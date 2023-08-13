import 'package:flutter/material.dart';

import '../../../widgets/custom_button.dart';

class PaymentBottomSheet extends StatelessWidget {
  const PaymentBottomSheet({
    super.key,
    required this.bankName,
    required this.baankImgUrl,
    this.onExpand,
    this.onProceedToPay,
    this.isLoading = false,
  });
  final String baankImgUrl;
  final String bankName;
  final Function()? onExpand;
  final Function()? onProceedToPay;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 25,
                      width: 40,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.circular(5)),
                      child: CircleAvatar(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            baankImgUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Text(
                      '$bankName •••• 4321',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.75),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: onExpand,
                  icon: const SizedBox(
                    width: 10,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 28,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomButton(
            text: 'Proceed to Pay',
            onTap: onProceedToPay,
            isLoading: isLoading,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              'IN PARTNERSHIP WITH ${bankName.toUpperCase()} BANK',
              style: TextStyle(
                color: Colors.black.withOpacity(0.3),
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
