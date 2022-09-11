import 'package:bloc/bloc.dart';

import '../../Data/Models/items_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(itemCart: []));
  void addToCart(Cart cart) {
    state.itemCart.add(cart);
    emit(CartState(
        itemCart: state.itemCart, total: calculateTotalPrice(state.itemCart)));
  }

  //removes the cart item depending on the index
  void removeFromCart(index) {
    state.itemCart.removeAt(index);
    emit(CartState(
        itemCart: state.itemCart, total: calculateTotalPrice(state.itemCart)));
  }

  // it increases the quantity
  void increament(index) {
    state.itemCart[index].quantity = state.itemCart[index].quantity + 1;
    emit(CartState(
        itemCart: state.itemCart, total: calculateTotalPrice(state.itemCart)));
  }

  //it decrement the quantity
  void decreament(index) {
    state.itemCart[index].quantity = state.itemCart[index].quantity - 1;
    // if the quantity is negative it will be dismissed from the cart list
    if (state.itemCart[index].quantity <= 0) {
      removeFromCart(index);
    }
    emit(CartState(
        itemCart: state.itemCart, total: calculateTotalPrice(state.itemCart)));
  }

  double calculateTotalPrice(List<Cart> itemCart) {
    double total = 0;
    for (int i = 0; i < itemCart.length; i++) {
      total = total + (itemCart[i].items!.price * itemCart[i].quantity);
    }
    return total;
  }
}
