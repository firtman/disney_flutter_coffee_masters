import 'dart:convert';

import 'datamodel.dart';
import 'package:http/http.dart' as http;

class DataManager {
  List<Category>? _menu;
  List<({Product product, int quantity})> cart = [];

  fetchMenu() async {
    const url = "https://firtman.github.io/coffeemasters/api/menu.json";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var body = response.body;
      var decodedData = jsonDecode(body) as List<dynamic>;
      _menu = [];
      for (var jsonObject in decodedData) {
        _menu?.add(Category.fromJson(jsonObject));
      }
    }
  }

  Future<List<Category>> getMenu() async {
    // Lazy load
    if (_menu == null) {
      await fetchMenu();
    }
    return _menu!;
  }

  cartAdd(Product p) {
    bool found = false;
    for (var item in cart) {
      if (item.product.id == p.id) {
        item = (item.product, item.quantity + 1) as ({
          Product product,
          int quantity
        });
        found = true;
      }
    }
    if (!found) {
      cart.add((product: p, quantity: 1));
    }
  }

  cartRemove(Product p) {
    cart.removeWhere((item) => item.product.id == p.id);
  }

  cartClear() {
    cart.clear();
  }

  double cartTotal() {
    var total = 0.0;
    for (var item in cart) {
      total += item.quantity * item.product.price;
    }
    return total;
  }
}
