import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_image_search/network_image_search.dart';
import 'package:shopping_list/model/product.dart';

import '../bloc/bloc_shoopping_list/shopping_list_bloc.dart';

class ListProducts extends StatefulWidget {
  const ListProducts({super.key});

  @override
  State<ListProducts> createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  late BuildContext globalContext;
  late final toolBloc = BlocProvider.of<ShoppingListBloc>(globalContext);
  @override
  Widget build(BuildContext context) {
    globalContext = context;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<ShoppingListBloc, ShoppingListState>(
              builder: (context, state) {
                if (state is ShoppingListInitialState) {
                  return const Center(
                      child: Text('No hay productos registrados'));
                }

                return _itemList(productList: state.productList);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _itemList({required List<Product> productList}) {
    return ListView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: productList.length,
      itemBuilder: ((context, index) {
        return Container(
          margin: const EdgeInsets.only(top: 20),
          color: Colors.amberAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Unsplash(
                  width: '100',
                  height: '100',
                  category: 'pinneapple',
                  // subcategory: 'fruit',
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Nombre del producto:'),
                  Text(productList[index].name),
                  const Text('Observaciones:'),
                  Text(productList[index].observations),
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
              IconButton(
                  onPressed: () {
                    toolBloc
                        .add(DeleteProductEvent(product: productList[index]));
                  },
                  icon: const Icon(Icons.delete)),
            ],
          ),
        );
      }),
    );
  }
}
