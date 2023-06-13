import 'package:flutter/material.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Offer(
            title: "10% Off first order",
            description:
                "You will get 10% off of your first order in this app"),
        Offer(
            title: "2 x 1",
            description:
                "You will get 10% off of your first order in this app"),
        Offer(
            title: "Bring your friend and get...",
            description: "You will get 10% off of your first order in this app")
      ],
    );
  }
}

class Offer extends StatelessWidget {
  String title;
  String description;

  Offer({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
