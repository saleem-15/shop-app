// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = 'Product-details';

  @override
  Widget build(BuildContext context) {
    //get the id of the product you want to show
    final productId = ModalRoute.of(context)!.settings.arguments as String;

    //now get the whole product (depending on the id that is provided) and store the product in "loadedProduct"
    final loadedProduct = Provider.of<Products>(
      context,
      listen:
          false, //this means dont listen to changes (dont rebuild this screen)
      //for example if a new product was added There is no reason to rebuild the screen
      //
      //
      //we set  the property "listen" to false when we want to get some data from the glopal storage
      //but we dont listen/care for changes
    ).findById(productId);

    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title)),
    );
  }
}
