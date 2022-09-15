import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kingyonas/Data/Models/items_model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) {
      if (event is FetchAllProducts) {
        emit(ProductsLoading());
        emit(ProductsLoaded(items: event.items));
      }
      if (event is FetchProductsBasedOnCategory) {
        emit(ProductsLoading());
        _fetchBasedOnCategory(event, emit);
      }
    });
  }

  void _fetchBasedOnCategory(
      FetchProductsBasedOnCategory event, Emitter<ProductsState> emit) {
    List<ItemModel> items = [];
    for (int i = 0; i < event.items!.length; i++) {
      if (event.items?[i].categories == event.category) {
        print(event.items);
        items.add(event.items![i]);
      }
      emit(ProductsLoaded(items: items));
    }
  }
}
