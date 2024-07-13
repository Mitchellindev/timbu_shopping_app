part of 'cart_bloc.dart';

class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  final List<ProductModel> products;

  const CartLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class CartEmpty extends CartState {}

class CartLoading extends CartState {}

class CheckoutSuccess extends CartState {}
