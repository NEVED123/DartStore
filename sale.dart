import 'lineItem.dart';
import 'saleitem.dart';

class Sale {
  List<LineItem> _lineItems = <LineItem>[];

  List<LineItem> getCart() {
    return _lineItems;
  }

  bool addToCart(SaleItem item, int? quantity) {
    if (quantity == null) {
      return false;
    }

    _lineItems.add(new LineItem(item, quantity));
    return true;
  }

  double getPrice() {
    double total = 0;

    for (LineItem lineItem in _lineItems) {
      total += lineItem.getSubtotal();
    }

    return total;
  }
}
