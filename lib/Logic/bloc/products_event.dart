part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {}

class FetchAllProducts extends ProductsEvent {
  final List<ItemModel>? items;

  FetchAllProducts(this.items);
  @override
  // TODO: implement props
  List<Object?> get props => [items];
}

class FetchProductsBasedOnCategory extends ProductsEvent {
  final String? category;
  final List<ItemModel>? items;

  FetchProductsBasedOnCategory({this.category, this.items});
  @override
  // TODO: implement props
  List<Object?> get props => [category, items];
}
