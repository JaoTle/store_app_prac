class ProductModel {
  String title,description,category,image;
  int id;
  dynamic price,rating;

  ProductModel({required this.id,required this.title,required this.category,required this.description,required this.price,required this.image,required this.rating});


  factory ProductModel.fromJson(Map<String,dynamic> data){
    return ProductModel(
      id: data["id"],
      title: data["title"],
      category: data["category"],
      description: data["description"],
      price: data["price"],
      image: data["image"],
      rating: data["rating"]["rate"] * data["rating"]["count"]
      );
  }
}