import 'package:flutter/material.dart';
import 'package:task_3/config/router/route.dart';
import 'package:task_3/core/constants/app_color.dart';
import 'package:task_3/pages/screens/payment_screen.dart';
import 'package:task_3/pages/screens/review_screen.dart';
import 'package:task_3/pages/screens/shippping.dart';
import 'package:task_3/pages/widgets/button_widget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _currentStep = 0;
  List<Step> steps() => [
        Step(
          isActive: _currentStep >= 0,
          title: const Text('Shipping'),
          content: const Shipping(),
        ),
        Step(
          isActive: _currentStep >= 1,
          title: const Text('Payment'),
          content: const PaymentScreen(),
        ),
        Step(
          isActive: _currentStep >= 2,
          title: const Text('Review'),
          content: const ReviewScreen(),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Checkout'),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _currentStep,
        steps: steps(),
        elevation: 0,
        onStepTapped: (step) => setState(() => _currentStep = step),
        onStepContinue: () => setState(() {
          final isLastStep = _currentStep == steps().length - 1;
          if (isLastStep) {
            _showConfirmationDialog();
          }
          if (_currentStep < steps().length - 1) {
            _currentStep += 1;
          }
        }),
        onStepCancel: () => setState(() {
          if (_currentStep > 0) {
            _currentStep--;
          }
        }),
      ),
    );
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          icon: Image.asset(
            'assets/images/validation.png',
            width: 40,
            height: 40,
          ),
          iconPadding: const EdgeInsets.only(bottom: 10, top: 10),
          title: const Text('Thanks for your order!'),
          titlePadding: const EdgeInsets.all(0),
          content: const Text(
            'The order confirmation has been sent to rhanya109@gmail.com',
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            MyButton(
                label: 'Continue shopping',
                backgroundColor: AppColors.primaryColor,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.shop);
                },
                textColor: AppColors.white,
                borderColor: AppColors.primaryColor)
          ],
        );
      },
    );
  }
}
