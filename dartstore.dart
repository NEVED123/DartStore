import 'dart:io';
import 'store.dart';
import 'saleitem.dart';
import 'lineItem.dart';

void main() {
  //Initialize store
  Store store = Store();

  print('''Welcome to the dart store! The store that aims to hit the target!
  To start adding an item to your cart, type the item id!''');

  store.initializeSale();

  bool checkOut = false;

  while (!checkOut) {
    print('\nItems for sale:');

    for (SaleItem item in store.getSaleItems()) {
      int id = item.id;
      String name = item.itemName;
      double price = item.price;
      String desc = item.desc;
      print("${id}. ${name} -- ${price} -- ${desc}");
    }

    print('\nCart:');

    for (LineItem item in store.getCart()) {
      String name = item.item.itemName;
      double quantity = item.item.price;
      double subTotal = item.getSubtotal();
      print("${name} x ${quantity} ... ${subTotal}");
    }

    print("\nEnter 'c' to checkout.");

    stdout.write('\nItem: ');
    String? item = stdin.readLineSync();

    if (item == 'c') {
      checkOut = true;
    } else {
      int itemId = int.tryParse(item ?? '-1') ?? -1;

      stdout.write('\nQuantity: ');
      int quantity = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

      if (!store.addToCart(itemId, quantity)) {
        print(
            '\nCould not add item to sale - Must add at least one of an existing item');
      }
    }
  }

  //User is no longer picking items, time to checkout

  bool finished = false;

  while (!finished) {
    print('\nYour total is \$${store.getSalePrice()}.');
    stdout.write('Please enter your credit card number: ');
    String? creditNum = stdin.readLineSync();

    if (store.processPayment(creditNum)) {
      print('\nPayment complete! Thank you for shopping at the dart store!');
      finished = true;
    } else {
      print('Invalid credit card number. Please try again.');
    }
  }
}
