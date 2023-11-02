import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/model/product.dart';

part 'state_bloc.dart';
part 'event_bloc.dart';

class ShoppingListBloc extends Bloc<ShoppingListEvent, ShoppingListState> {
  ShoppingListBloc() : super(ShoppingListInitialState()) {
    on<GetDataProduct>(getDataProduct);
    on<DeleteProductEvent>(deleteProductEvent);
  }
  Future<void> getDataProduct(
    GetDataProduct event,
    Emitter<ShoppingListState> emit,
  ) async {
    final List<Product> productList = [...state.productList, event.product];

    emit(ShoppingListSetState(productList));
  }

  Future<void> deleteProductEvent(
    DeleteProductEvent event,
    Emitter<ShoppingListState> emit,
  ) async {
    final List<Product> productList = state.productList.toList();

    int index = productList.indexWhere((Product product) {
      return product == event.product;
    });
    productList.removeAt(index);

    emit(ShoppingListSetState(productList));
  }
}
