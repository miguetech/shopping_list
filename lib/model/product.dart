// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  String id;
  String name;
  DateTime date;
  String image;
  String observations;
  Product({
    required this.id,
    this.name = '',
    required this.date,
    this.image = '',
    this.observations = '',
  });

  Product copyWith({
    String? id,
    String? name,
    DateTime? date,
    String? image,
    String? observations,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      image: image ?? this.image,
      observations: observations ?? this.observations,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'date': date.millisecondsSinceEpoch,
      'image': image,
      'observations': observations,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      name: map['name'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      image: map['image'] as String,
      observations: map['observations'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, date: $date, image: $image, observations: $observations)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.date == date &&
        other.image == image &&
        other.observations == observations;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        date.hashCode ^
        image.hashCode ^
        observations.hashCode;
  }

  static List<Product> testList = <Product>[
    Product(
      id: '0',
      name: 'Manzana',
      image: '',
      date: DateTime.now(),
      observations: '',
    ),
    Product(
      id: '1',
      name: 'Pera',
      image: '',
      date: DateTime.now(),
      observations: '',
    ),
    Product(
      id: '2',
      name: 'Cambur',
      image: '',
      date: DateTime.now(),
      observations: '',
    ),
    Product(
      id: '3',
      name: 'Zanahorita',
      image: '',
      date: DateTime.now(),
      observations: '',
    ),
    Product(
      id: '4',
      name: 'Uva',
      image: '',
      date: DateTime.now(),
      observations: '',
    ),
    Product(
      id: '5',
      name: 'Mango',
      image: '',
      date: DateTime.now(),
      observations: '',
    ),
    Product(
      id: '6',
      name: 'Patilla',
      image: '',
      date: DateTime.now(),
      observations: '',
    ),
    Product(
      id: '7',
      name: 'Caraotas',
      image: '',
      date: DateTime.now(),
      observations: '',
    ),
  ];
}
