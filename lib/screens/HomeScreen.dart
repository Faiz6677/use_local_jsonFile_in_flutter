import 'dart:convert';

import 'package:first_project/models/catalog.dart';
import 'package:first_project/screens/cart_screen.dart';
import 'package:first_project/screens/header_screen.dart';
import 'package:first_project/utils/my_routes.dart';
import 'package:first_project/widgets/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 1));
    final catalogJson = await rootBundle.loadString('assets/catalog.Json');
    final decodeData = jsonDecode(catalogJson);
    final productData = decodeData['products'];
    CatalogModel.items =
        List.from(productData).map<Item>((e) => Item.fromMap(e)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final someItem = CatalogModel.items;
    return Scaffold(
      backgroundColor: Colors.white70,
      drawer: MyDrawer(),
      drawerScrimColor: Colors.deepPurple.shade100.withAlpha(130),
      appBar: AppBar(
        toolbarHeight: 80,
        titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
        foregroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen())),
                child: Icon(Icons.shopping_cart_rounded)),
          )
        ],
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
          color: Colors.deepPurple,
          size: 40,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.orange,
          size: 25,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Text(
              'Catalog App',
              style: TextStyle(fontSize: 30),
            ),
            Text('Trending products')
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(bottom: 20.0),
          decoration: BoxDecoration(
            color: Colors.white70,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (CatalogModel.items.isNotEmpty)
                Expanded(child: CatalogList())
              else
                Expanded(
                    child: Center(
                  child: CircularProgressIndicator(),
                ))
            ],
          ),
        ),
      ),
    );
  }
}
