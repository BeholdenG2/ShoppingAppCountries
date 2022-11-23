class Cat {
  final int? id;
  final String title;
  final String category;
  final String ranking;
  final String description;
  final String calories;
  final String additives;
  final String vitamins;
  final String price;
  final String image;

  Cat(
      {this.id,
      required this.title,
      required this.category,
      required this.ranking,
      required this.description,
      required this.calories,
      required this.additives,
      required this.vitamins,
      required this.price,
      required this.image
      });
      

  factory Cat.fromMap(Map<String, dynamic> json) => Cat(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      ranking: json['ranking'],
      description: json['description'],
      calories: json['calories'],
      additives: json['additives'],
      vitamins: json['vitamins'],
      price: json['price'],
      image: json['image']
      );


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'ranking': ranking,
      'description': description,
      'calories': calories,
      'additives': additives,
      'vitamins': vitamins,
      'price': price,
      'image': image
    };
  }
}
