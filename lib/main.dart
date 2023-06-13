import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.brown),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  changeTab(value) {
    setState(() {
      currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentPage = const Placeholder();
    switch (currentIndex) {
      case 0:
        currentPage = const Text("Menu");
        break;
      case 1:
        currentPage = const Text("Offers");
        break;
      case 2:
        currentPage = const Text("Order");
        break;
      default:
    }

    return Scaffold(
      appBar: AppBar(title: Image.asset("images/logo.png")),
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.brown,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.brown.shade50,
        onTap: changeTab,
        items: const [
          BottomNavigationBarItem(label: "Menu", icon: Icon(Icons.coffee)),
          BottomNavigationBarItem(
              label: "Offers", icon: Icon(Icons.local_offer)),
          BottomNavigationBarItem(
              label: "Order",
              icon: Icon(Icons.shopping_cart_checkout_outlined)),
        ],
      ),
    );
  }
}
