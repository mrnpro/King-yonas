part of 'cart_cubit.dart';

class CartState {
  List<Cart> itemCart;
  final double? total;
  CartState({this.total, required this.itemCart});
}
