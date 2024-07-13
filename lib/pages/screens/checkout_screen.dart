import 'package:flutter/material.dart';
import 'package:task_3/pages/screens/shippping.dart';

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
          content: const Text('Payment content'),
        ),
        Step(
          isActive: _currentStep >= 2,
          title: const Text('Review'),
          content: const Text('Review content'),
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
            print('done');
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
}
