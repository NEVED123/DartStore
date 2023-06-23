import 'saleitem.dart';

class LineItem {
  final SaleItem item;
  final int quantity;

  const LineItem(this.item, this.quantity);

  @override
  String toString() {
    return 'Item: ${item.itemName}, Quantity: ${quantity}';
  }

  double getSubtotal() {
    return item.price * quantity;
  }
}
