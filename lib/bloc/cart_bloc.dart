import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_3/models/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<ProductAdded>((event, emit) {
      // Add product to cart logic
      // Emit CartLoaded state with updated products
    });

    on<ProductRemoved>((event, emit) {
      // Remove product from cart logic
      // Emit CartLoaded state with updated products
    });

    on<CheckoutStarted>((event, emit) {
      // Checkout logic
      // Emit CheckoutSuccess state
    });
  }
}
