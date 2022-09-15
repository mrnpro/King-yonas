part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {}

class ProductsInitial extends ProductsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductsLoading extends ProductsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductsLoaded extends ProductsState {
  final List<ItemModel>? items;

  ProductsLoaded({this.items});

  @override
  // TODO: implement props
  List<Object?> get props => [items];
}
