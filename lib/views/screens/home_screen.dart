import 'package:flutter/material.dart';
import 'package:flutter_provider/services/card_model.dart';
import 'package:flutter_provider/utils/product_data.dart';
import 'package:flutter_provider/views/screens/card_screen.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<CardModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CardScreen()));
              },
              icon: const Icon(Icons.card_travel))
        ],
        backgroundColor: Colors.amberAccent,
        title: const Text(
          "Catalogue",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: ProductData.products.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              title: Text(
                ProductData.products[index].name,
                style: const TextStyle(color: Colors.black),
              ),
              leading: Image.network(
                ProductData.products[index].image,
                width: 80, // Largeur de l'image
                height: 80, // Hauteur de l'image
                fit: BoxFit.cover,
              ),
              trailing: ProductData.products[index].isSelected
                  ? const Icon(Icons.check)
                  : IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        product.addCard(ProductData.products[index]);
                        setState(() {
                          ProductData.products[index].isSelected = true;
                        });
                      },
                    ),
            ),
          );
        },
      ),
    );
  }
}
