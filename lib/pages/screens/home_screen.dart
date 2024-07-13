import 'package:flutter/material.dart';
import 'package:task_3/config/router/route.dart';
import 'package:task_3/pages/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shop',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.shoppingCart);
              },
              child: const Icon(
                Icons.shopping_cart_sharp,
                size: 24,
              ),
            ),
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
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCardWidget(
                      image: 'assets/images/tote_bag_2.png',
                      price: '4,800',
                      label: 'Men\'s 100% Cutton T-Shirt',
                      onTap: () {},
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
