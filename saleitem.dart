class SaleItem {
  final String itemName;
  final double price;
  final String desc;

  const SaleItem(this.itemName, this.price, this.desc);

  @override
  String toString() {
    return 'Item: ${itemName}, Price: ${price}, Description: ${desc}';
  }

  static SaleItem emptySaleItem = SaleItem('', 0, '');
}
