part of 'shopping_list_bloc.dart';

@immutable
abstract class ShoppingListState {
  final List<Product> productList;

  const ShoppingListState({this.productList = const <Product>[]});
}

class ShoppingListInitialState extends ShoppingListState {
  ShoppingListInitialState() : super(productList: []);
}

class ShoppingListSetState extends ShoppingListState {
  final List<Product> newProductList;
  const ShoppingListSetState(this.newProductList)
      : super(productList: newProductList);
}

class DeleteShoppingList extends ShoppingListState {}
