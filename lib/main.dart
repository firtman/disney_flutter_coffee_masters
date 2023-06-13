import 'package:coffee_masters/datamanager.dart';
import 'package:coffee_masters/pages/menupage.dart';
import 'package:coffee_masters/pages/offerspage.dart';
import 'package:coffee_masters/pages/orderpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.brown,
          textTheme: const TextTheme(headlineLarge: TextStyle(fontSize: 30))),
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
  var dataManager = new DataManager(); // singleton

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
        currentPage = MenuPage(
          dataManager: dataManager,
        );
        break;
      case 1:
        currentPage = const OfferPage();
        break;
      case 2:
        currentPage = OrderPage(
          dataManager: dataManager,
        );
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
