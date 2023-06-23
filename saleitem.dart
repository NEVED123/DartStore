class SaleItem {
  final String itemName;
  final double price;
  final String desc;

  const SaleItem(this.itemName, this.price, this.desc);

  String toStringDebug() {
    return 'Item: ${itemName}, Price: ${price}, Description: ${desc}';
  }

  @override
  String toString() {
    return '${itemName} -- \$${price.toString()} -- ${desc}';
  }

  static SaleItem emptySaleItem = SaleItem('', 0, '');
}
