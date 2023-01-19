class Product {
  final String name;
  final String description;
  final String descriptionDt;
  final double price;
  final String imageUrl;
  final String imageUrlDt;
  bool starred;
  bool bought;

  Product(
    this.name,
    this.description,
    this.descriptionDt,
    this.price,
    this.imageUrl,
    this.imageUrlDt,
    this.starred,
    this.bought,
  );
}
