class ProductDataModel{
  int? id;
  double? price;
  double? old_price;
  double? discount;
  String? image;
  String? name;
  String? description;
  bool? in_favorites;
  bool? in_cart;
  List<String>? images;

  ProductDataModel({this.id,
    this.price,
    this.old_price,
    this.discount,
    this.image,
    this.name,
    this.description,
    this.in_favorites,
    this.in_cart,
    this.images
  });



}