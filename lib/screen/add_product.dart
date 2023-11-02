import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/bloc/bloc_shoopping_list/shopping_list_bloc.dart';
import 'package:shopping_list/model/product.dart';
import 'package:uuid/uuid.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({this.product, super.key});

  final Product? product;

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  TextEditingController idController = TextEditingController(text: '');
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController observationsController =
      TextEditingController(text: '');

  final uuid = const Uuid();

  @override
  void initState() {
    if (widget.product != null) {
      idController.text = widget.product!.id;
      nameController.text = widget.product!.name;
      observationsController.text = widget.product!.observations;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final shoppingListBloc = BlocProvider.of<ShoppingListBloc>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Agregar un nuevo producto a la lista',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(label: Text('Nombre')),
            ),
            TextFormField(
              controller: observationsController,
              decoration: const InputDecoration(label: Text('Descripción')),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                shoppingListBloc.add(GetDataProduct(product: product()));
              },
              child: const Text('Agregar herramienta'),
            ),
          ],
        ),
      )),
    );
  }

  Product product() {
    if (widget.product == null) {
      return Product(
        id: uuid.v4(),
        date: DateTime.now(),
        name: nameController.text,
        observations: observationsController.text,
      );
    }
    return Product(
      id: idController.text,
      date: widget.product!.date,
      name: nameController.text,
      observations: observationsController.text,
    );
  }
}
