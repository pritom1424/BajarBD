class CartModel {
  final int id;
  final String title;
  final double price;
  final int amount;
  final double total;
  final String imageLink;

  CartModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.amount,
      required this.total,
      required this.imageLink});
}
