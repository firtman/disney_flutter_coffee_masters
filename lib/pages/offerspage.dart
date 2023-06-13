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
    var density = MediaQuery.of(context).devicePixelRatio;
    var width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: 300,
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.amber.shade50,
          elevation: 7,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "images/background.png",
                  )),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Container(
                    color: Colors.amber.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Container(
                    color: Colors.amber.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        description,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
