class Product {
  final int? id;
  final String title;
  final String price;
  final String image;

  Product(
      {this.id,
      required this.title,
      required this.price,
      required this.image
      });
      

  factory Product.fromMap(Map<String, dynamic> json) => Product(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      image: json['image']
      );


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'image': image
    };
  }
}
