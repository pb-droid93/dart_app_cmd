class Product{

 const Product({required this .id, required this.name, required this.price});

  final int id;
  final String name;
  final double price;

// getter for dispaly name
  String get displayName => '($initial)${name.substring(1)} : \$$price';

//getter for initials
  String get initial => name.substring(0,1);

}