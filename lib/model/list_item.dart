class ShoppingItem {
  final String name;
  final int quantity;
  bool checked;

  ShoppingItem({
    required this.name,
    required this.quantity,
    this.checked = false,
  });
}
