import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_3/api/timbu_api_service.dart';
import 'package:task_3/cart_provider.dart';
import 'package:task_3/config/router/route.dart';
import 'package:task_3/pages/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          child: FutureBuilder(
            future: getProducts(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              final data = snapshot.data!;

              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: 12,
                      itemBuilder: (BuildContext context, int index) {
                        final Map<String, dynamic> product =
                            data['items'][index];

                        return ProductCardWidget(
                          image:
                              'https://api.timbu.cloud/images/${product['photos'][0]['url']}',
                          price:
                              '${product['current_price'][0]['NGN'][0].toStringAsFixed(2)}',
                          label: product['name'],
                          onTap: () {
                            Provider.of<Cart>(context, listen: false).addItem(
                              product['id'],
                              product['current_price'][0]['NGN'][0],
                              product['name'],
                              'https://api.timbu.cloud/images/${product['photos'][0]['url']}',
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Added to cart'),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
