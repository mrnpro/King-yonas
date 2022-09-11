import 'package:kingyonas/constants.dart';

class ItemModel {
  final int? id;
  final String? imageUrl;
  final String? title;
  final String? size;
  final String? description;
  final int price;
  final String? categories;

  ItemModel({
    this.id,
    this.imageUrl,
    this.title,
    this.size,
    this.description,
    required this.price,
    this.categories,
  });
}

List<ItemModel> items = [
  ItemModel(
      categories: symbolic,
      id: 1,
      imageUrl: "assets/images/img1.png",
      title: "Pain and Injustice",
      size: "Medium acrylic on canvas 120x180 cm",
      description:
          "In the art of ballet dance, there is unspeakable pain. Our world currently mirrors that as there is soo much pain and injustice .",
      price: 12),
  ItemModel(
      categories: symbolic,
      id: 2,
      imageUrl: "assets/images/img2.png",
      title: "Fantasy",
      size: "Medium acrylic on canvas 120x180 cm",
      description:
          "We often travel in our own imaginary world. A world where there are endless possibilities. To imagine is what makes us feel alive.",
      price: 12),
  ItemModel(
      categories: realistic,
      id: 3,
      imageUrl: "assets/images/img3.png",
      title: "pearl",
      size: "Medium acrylic on canvas 120x180 cm",
      description:
          "Ethiopia is full of color and diversity. In this work, Ethiopia’s incredible beauty and fascination is captured by the intrigue visual of a woman. It shows how dynamic, eccentric and mesmerizing woman can perfectly define the diversified, historied and inclusive Ethiopian culture and society.",
      price: 12),
  ItemModel(
      categories: realistic,
      id: 4,
      imageUrl: "assets/images/real1.jpg",
      title: " Paint Glossy",
      size: "Medium acrylic on canvas 120x180 cm",
      description:
          " Paint Glossy, Semi-Realistic Portraits for the iPad in Procreate | Ruby",
      price: 12),
  ItemModel(
      categories: realistic,
      id: 4,
      imageUrl: "assets/images/real2.jpg",
      title: " Paint Glossy",
      size: "Medium acrylic on canvas 120x180 cm",
      description:
          " Paint Glossy, Semi-Realistic Portraits for the iPad in Procreate | Ruby",
      price: 12),
  ItemModel(
      categories: realistic,
      id: 5,
      imageUrl: "assets/images/real3.jpg",
      title: " Paint Glossy",
      size: "Medium acrylic on canvas 120x180 cm",
      description:
          " Paint Glossy, Semi-Realistic Portraits for the iPad in Procreate | Ruby",
      price: 12),
  ItemModel(
      categories: realistic,
      id: 6,
      imageUrl: "assets/images/real4.jpg",
      title: "Dora-Alis",
      size: "Medium acrylic on canvas 120x180 cm",
      description:
          "Dora-Alis - Professional, Traditional Artist | DeviantArt | African children, Black art",
      price: 12),
  ItemModel(
      categories: realistic,
      id: 6,
      imageUrl: "assets/images/real5.jpg",
      title: "the art title here",
      size: "Medium acrylic on canvas 120x180 cm",
      description:
          "Dora-Alis - Professional, Traditional Artist | DeviantArt | African children, Black art",
      price: 12),
  ItemModel(
      categories: realistic,
      id: 7,
      imageUrl: "assets/images/real6.jpg",
      title: "In this piece",
      size: "Medium acrylic on canvas 120x180 cm",
      description:
          "the rhythm and strong ties of responsibility in Ghanaian family life is",
      price: 12),
];

class Cart {
  final ItemModel? items;
  int quantity;

  Cart({required this.items, required this.quantity});
}
