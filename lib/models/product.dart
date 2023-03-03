class Product {
  final String name;
  final String description;
  final String description_en;
  final double price_dollar;
  final double price_euro;
  final double price_pound;
  final String imageUrl;
  final String imageUrlDt;
  bool starred;
  bool bought;

  Product(
    this.name,
    this.description,
    this.description_en,
    this.price_dollar,
    this.price_euro,
    this.price_pound,
    this.imageUrl,
    this.imageUrlDt,
    this.starred,
    this.bought,
  );
}
