import 'package:flutter/cupertino.dart';

class ItemModel {
  final int? id;
  final String? imageUrl;
  final String? title;
  final String? size;
  final String? description;
  final String? price;

  ItemModel(
      {this.id,
      this.imageUrl,
      this.title,
      this.size,
      this.description,
      this.price});
}

List<ItemModel> items = [
  ItemModel(
      id: 1,
      imageUrl: "assets/images/img1.png",
      title: "Pain and Injustice",
      size: "Medium acrylic on canvas 120x180 cm",
      description:
          "In the art of ballet dance, there is unspeakable pain. Our world currently mirrors that as there is soo much pain and injustice .",
      price: "1234ETB"),
  ItemModel(
      id: 2,
      imageUrl: "assets/images/img2.png",
      title: "Fantasy",
      size: "Medium acrylic on canvas 120x180 cm",
      description:
          "We often travel in our own imaginary world. A world where there are endless possibilities. To imagine is what makes us feel alive.",
      price: "1234ETB"),
  ItemModel(
      id: 3,
      imageUrl: "assets/images/img3.png",
      title: "pearl",
      size: "Medium acrylic on canvas 120x180 cm",
      description:
          "Ethiopia is full of color and diversity. In this work, Ethiopia’s incredible beauty and fascination is captured by the intrigue visual of a woman. It shows how dynamic, eccentric and mesmerizing woman can perfectly define the diversified, historied and inclusive Ethiopian culture and society.",
      price: "1234ETB")
];

class Cart {
  final ItemModel? items;
  final int? quantity;

  Cart({required this.items, required this.quantity});
}

List<Cart> itemCart = [];
