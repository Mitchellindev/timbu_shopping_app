import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_3/cart_provider.dart';
import 'package:task_3/config/router/route.dart';
import 'package:task_3/core/constants/app_color.dart';
import 'package:task_3/pages/widgets/cart_item_widget.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Shopping Cart',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Image.asset('assets/images/chat.png'),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return CartItemCardWidget(
                      image: 'assets/images/tote_bag_1.png',
                      label: 'Floral Tote Bag',
                      subtext: 'Off-white',
                      size: 'M',
                      price: '2,500.00',
                      onTap: () {},
                      quantity: '1',
                      onMinusPressed: () {},
                      onAddPressed: () {},
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cart totals',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textGrey,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'N ${cart.totalAmount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor,
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.shippingAddress);
                      },
                      child: Container(
                        width: 150,
                        height: 42,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                        ),
                        child: const Center(
                          child: Text(
                            'Checkout',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
