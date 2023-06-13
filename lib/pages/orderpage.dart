import 'package:coffee_masters/datamanager.dart';
import 'package:flutter/material.dart';

import '../datamodel.dart';

class OrderPage extends StatefulWidget {
  DataManager dataManager;

  OrderPage({super.key, required this.dataManager});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.dataManager.cart.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Your order is empty"),
      );
    } else {
      return ListView.builder(
        itemCount: widget.dataManager.cart.length,
        itemBuilder: (context, index) {
          var item = widget.dataManager.cart[index];
          return OrderItem(
              item: item,
              onRemove: (product) {
                setState(() {
                  widget.dataManager.cartRemove(product);
                });
              });
        },
      );
    }
  }
}

class OrderItem extends StatelessWidget {
  final ({Product product, int quantity}) item;
  final Function onRemove;
  const OrderItem({Key? key, required this.item, required this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                flex: 10, // width: 10%
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("${item.quantity}x"),
                )),
            Expanded(
                flex: 60, // width: 60%
                child: Text(
                  item.product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
            Expanded(
                flex: 20, // width: 20%
                child: Text("\$" +
                    (item.product.price * item.quantity).toStringAsFixed(2))),
            Expanded(
                flex: 10, // width: 10%
                child: IconButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      onRemove(item.product);
                    },
                    icon: const Icon(Icons.delete)))
          ],
        ),
      ),
    );
  }
}
