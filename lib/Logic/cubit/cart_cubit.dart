import 'package:bloc/bloc.dart';

import '../../Data/Models/Items_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(itemCart: []));
  void addToCart(Cart cart) {
    state.itemCart.add(cart);
    emit(CartState(itemCart: state.itemCart));
  }

  //removes the cart item depending on the index
  void removeFromCart(index) {
    state.itemCart.removeAt(index);
    emit(CartState(itemCart: state.itemCart));
  }

  // it increases the quantity
  void increament(index) {
    state.itemCart[index].quantity = state.itemCart[index].quantity! + 1;
    emit(CartState(itemCart: state.itemCart));
  }

  //it decrement the quantity
  void decreament(index) {
    state.itemCart[index].quantity = state.itemCart[index].quantity! - 1;
    // if the quantity is negative it will be dismissed from the cart list
    if (state.itemCart[index].quantity!.isNegative) {
      removeFromCart(index);
    }
    emit(CartState(itemCart: state.itemCart));
  }
}
