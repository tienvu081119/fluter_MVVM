class Products {
  int id;
  String name;
  String category;
  double price;
  String image;
  String description;

  Products({
    this.id,
    this.name,
    this.category,
    this.price,
    this.image,
    this.description
  });

  factory Products.fromJson(Map<String, dynamic> json){
    return Products(
      id: json["id"],
      name: json["name"],
      category: json["name"],
      image: json["image"],
      description: json["description"]
    );
  }
}