import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_3/core/constants/app_color.dart';
import 'package:task_3/pages/widgets/textfield_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selected = 0;
  final cardNumberController = TextEditingController();
  final expirationController = TextEditingController();
  final cvvController = TextEditingController();
  final voucherCodeController = TextEditingController();

  Widget customRadio(
    String text,
    String image,
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = index;
        });
      },
      child: Container(
        width: 160,
        height: 94,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: (selected == index)
                ? AppColors.primaryColor
                : AppColors.borderColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(child: Image.asset(image)),
            const SizedBox(height: 16),
            Flexible(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Payment Method',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Flexible(
              child: customRadio(
                  'Credit Card', 'assets/images/credit_card.png', 1),
            ),
            const SizedBox(width: 20),
            Flexible(
              child: customRadio(
                  'Google Play', 'assets/images/google_play.png', 2),
            )
          ],
        ),
        MyTextField(
          controller: cardNumberController,
          obscureText: false,
          hintText: 'xxx xxx xxx',
          label: 'Card number',
        ),
        Row(
          children: [
            Flexible(
              child: MyTextField(
                controller: expirationController,
                obscureText: false,
                hintText: 'mm/yy',
                label: 'Expiration',
              ),
            ),
            const SizedBox(width: 20),
            Flexible(
              child: MyTextField(
                controller: cvvController,
                obscureText: false,
                hintText: 'xxx',
                label: 'CVV',
              ),
            ),
          ],
        ),
        MyTextField(
          controller: voucherCodeController,
          obscureText: false,
          hintText: 'xxxxx',
          label: 'Voucher Code',
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
