import 'package:flutter/material.dart';
import 'package:task_3/core/constants/app_color.dart';

class CartItemCardWidget extends StatelessWidget {
  const CartItemCardWidget({
    super.key,
    required this.label,
    required this.price,
    required this.image,
    required this.subtext,
    required this.size,
    required this.onTap,
    required this.quantity,
    required this.onMinusPressed,
    required this.onAddPressed,
    required this.id,
  });
  final String id;
  final String label;
  final String price;
  final String image;
  final String subtext;
  final String size;
  final String quantity;
  final VoidCallback onTap;
  final VoidCallback onMinusPressed;
  final VoidCallback onAddPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.borderColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              children: [
                Flexible(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      image,
                      width: 57,
                      height: 60,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          subtext,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textGrey),
                        ),
                        const SizedBox(width: 8),
                        const SizedBox(
                          child: Divider(
                            height: 17,
                            color: AppColors.dividerColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          size,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textGrey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'N $price',
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 29,
                    padding: const EdgeInsets.only(
                        top: 7, right: 7, left: 12, bottom: 7),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(205, 213, 223, 1)),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4),
                        bottomLeft: Radius.circular(4),
                      ),
                    ),
                    child: const Icon(
                      Icons.remove,
                      size: 12,
                    ),
                  ),
                  GestureDetector(
                    onTap: onMinusPressed,
                    child: Container(
                      height: 29,
                      padding: const EdgeInsets.only(
                          top: 7, right: 9, left: 9, bottom: 7),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(205, 213, 223, 1),
                        ),
                      ),
                      child: Text(
                        quantity,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  Container(
                    height: 29,
                    padding: const EdgeInsets.only(
                        top: 7, right: 12, left: 7, bottom: 7),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(205, 213, 223, 1)),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: onAddPressed,
                      child: const Icon(
                        Icons.add,
                        size: 12,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.delete_outline_rounded,
                    size: 12,
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: const Text(
                      'Remove',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
