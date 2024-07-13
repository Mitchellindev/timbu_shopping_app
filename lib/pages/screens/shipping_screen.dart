import 'package:flutter/material.dart';
import 'package:task_3/config/router/route.dart';
import 'package:task_3/core/constants/app_color.dart';
import 'package:task_3/pages/widgets/button_widget.dart';
import 'package:task_3/pages/widgets/textfield_widget.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  final homeController = TextEditingController();
  final fullNameController = TextEditingController();
  final countryController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final postalCodeController = TextEditingController();
  final regionController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
          ),
        ),
        title: const Text(
          'Shipping Address',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: [
                MyTextField(
                  controller: homeController,
                  obscureText: false,
                  hintText: 'Home',
                  label: 'Shipping to',
                ),
                MyTextField(
                  controller: fullNameController,
                  obscureText: false,
                  hintText: 'Enter your full name',
                  label: 'Full Name',
                ),
                MyTextField(
                  controller: countryController,
                  obscureText: false,
                  hintText: 'Nigeria',
                  label: 'Country',
                ),
                MyTextField(
                  controller: addressController,
                  obscureText: false,
                  hintText: 'Street Address',
                  label: 'Address',
                ),
                MyTextField(
                  controller: cityController,
                  obscureText: false,
                  hintText: 'Lagos',
                  label: 'City',
                ),
                Row(
                  children: [
                    Flexible(
                      child: MyTextField(
                        controller: postalCodeController,
                        obscureText: false,
                        hintText: '94054',
                        label: 'Postal code',
                      ),
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      child: MyTextField(
                        controller: regionController,
                        obscureText: false,
                        hintText: 'region',
                        label: 'Region',
                      ),
                    ),
                  ],
                ),
                MyTextField(
                  controller: phoneNumberController,
                  obscureText: false,
                  label: 'Phone number',
                ),
                const SizedBox(height: 12),
                MyButton(
                  label: 'Checkout',
                  backgroundColor: AppColors.primaryColor,
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.checkout);
                  },
                  textColor: Colors.white,
                  borderColor: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
