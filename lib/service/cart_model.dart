class CartModel {
  final int id;
  final String name;
  final String imageUrl;
  final double price;

  const CartModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  CartModel copyWith({
    int? id,
    String? name,
    String? imageUrl,
    bool? addedToWatchList,
  }) {
    return CartModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price,
    );
  }

  List<Object?> get props => [id, name, imageUrl, price];
}
