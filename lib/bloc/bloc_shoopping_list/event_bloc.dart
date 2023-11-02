// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'shopping_list_bloc.dart';

@immutable
abstract class ShoppingListEvent {}

class GetDataProduct extends ShoppingListEvent {
  final Product product;

  GetDataProduct({
    required this.product,
  });
}

class DeleteProductEvent extends ShoppingListEvent {
  final Product product;

  DeleteProductEvent({required this.product});
}
