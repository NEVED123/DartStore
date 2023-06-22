import 'dart:io';
import 'store.dart';
import 'saleitem.dart';
import 'lineItem.dart';

void main() {
  //Initialize store
  Store store = Store();

  print('''Welcome to the dart store! The store that aims to hit the target!
  To start adding an item to your cart, type the name!''');

  store.initializeSale();

  bool checkOut = false;

  while (!checkOut) {
    print('Items for sale:');

    for (SaleItem item in store.getSaleItems()) {
      print(item.toString());
    }

    print('Cart:');

    for (LineItem item in store.getCart()) {
      print(item.toString());
    }

    print("Enter 'c' to checkout.");

    stdout.write('\nItem: ');
    String? item = stdin.readLineSync();

    if (item == 'c') {
      checkOut = true;
    } else {
      stdout.write('\nQuantity: ');
      int? quantity = int.tryParse(stdin.readLineSync() ?? '0');

      if (!store.addToCart(item, quantity)) {
        print(
            'Could not add item to sale - Must add at least one of an existing item');
      }
    }
  }

  //User is no longer picking items, time to checkout

  bool finished = false;

  while (!finished) {
    print('Your total is ${store.getSalePrice()}');
    stdout.write('Please enter your credit card number: ');
    String? creditNum = stdin.readLineSync();

    if (store.processPayment(creditNum)) {
      print('Payment complete!');
      finished = true;
    } else {
      print('Invalid credit card number. Please try again.');
    }
  }
}
