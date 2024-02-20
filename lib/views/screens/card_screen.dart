import 'package:flutter/material.dart';
import 'package:flutter_provider/services/card_model.dart';
import 'package:provider/provider.dart';

import '../../utils/product_data.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    final cardProduct = Provider.of<CardModel>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amberAccent,
          title: const Text(
            "Panier",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: cardProduct.cardProduct.isEmpty
            ? const Center(
                child: Text("Pas de produit ajouter au panier"),
              )
            : Consumer<CardModel>(builder: (context, card, child) {
                print("rebuild");
                return ListView.builder(
                  itemCount: cardProduct.cardProduct.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          card.cardProduct[index].name,
                          style: const TextStyle(color: Colors.black),
                        ),
                        leading: Image.network(
                          card.cardProduct[index].image,
                          width: 80, // Largeur de l'image
                          height: 80, // Hauteur de l'image
                          fit: BoxFit.cover,
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            card.removeCard(index);
                            setState(() {
                              ProductData.products[index].isSelected = true;
                            });
                          },
                        ),
                      ),
                    );
                  },
                );
              }));
  }
}
