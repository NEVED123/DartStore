import 'saleitem.dart';
import 'sale.dart';
import 'lineItem.dart';

class Store {
  List<SaleItem> _saleItems = <SaleItem>[];
  Sale? _sale = null;

  Store() {
    //In real life, this would be a database request
    _addSaleItem('Banana', 1.00, "The best you'll ever have!");
    _addSaleItem('Orange', 1.25, "The worst you'll ever have!");
    _addSaleItem('Apple', 1.50, "It's okay I guess");
    _addSaleItem('Tennis Racket', 100,
        "I literally don't know what that thing is, but it looks cool");
  }

  void _addSaleItem(String itemName, double price, String desc) {
    _saleItems.add(new SaleItem(itemName, price, desc));
  }

  void initializeSale() {
    _sale = new Sale();
  }

  List<SaleItem> getSaleItems() {
    return _saleItems;
  }

  List<LineItem> getCart() {
    if (_sale != null) {
      return _sale!.getCart();
    }

    return <LineItem>[];
  }

  bool addToCart(String? item, int? quantity) {
    if (_sale == null) {
      print('sale is null');
      return false;
    }

    SaleItem? selectedItem = _saleItems.firstWhere(
        (curr) => curr.itemName == item,
        orElse: () => SaleItem.emptySaleItem);

    if (selectedItem == SaleItem.emptySaleItem) {
      return false;
    }

    return _sale!.addToCart(selectedItem, quantity);
  }

  bool processPayment(String? creditNum) {
    if (creditNum == null || creditNum == "BAD") {
      return false;
    }

    return true;
  }

  double getSalePrice() {
    if (_sale == null) {
      return 0;
    }

    return _sale!.getPrice();
  }
}
