// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class ProductAdded extends CartEvent {
  final ProductModel product;

  const ProductAdded(this.product);
}

class ProductRemoved extends CartEvent {
  final ProductModel product;

  const ProductRemoved(this.product);
}

class CheckoutStarted extends CartEvent {}
