class ProductsModel{
  int? id;
  double? price;
  double? old_price;
  double? discount;
  String? image;
  String? name;
  String? description;
  bool? in_favorites;
   bool? in_cart;

  ProductsModel({this.id,
    this.price,
    this.old_price,
    this.discount,
    this.image,
    this.name,
    this.description,
    this.in_favorites,
    this.in_cart,
  });



}