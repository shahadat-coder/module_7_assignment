import 'package:flutter/material.dart';

import 'card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product App',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  List<Product> products = [
    Product(name: 'Product 1', price: '10.00'),
    Product(name: 'Product 2', price: '20.00'),
    Product(name: 'Product 3', price: '30.00'),
    Product(name: 'Product 4', price: '30.00'),
    Product(name: 'Product 5', price: '30.00'),
    Product(name: 'Product 6', price: '30.00'),
    Product(name: 'Product 7', price: '30.00'),
    Product(name: 'Product 8', price: '30.00'),
    Product(name: 'Product 9', price: '30.00'),
    Product(name: 'Product 10', price: '30.00'),
    Product(name: 'Product 11', price: '30.00'),
    Product(name: 'Product 12', price: '30.00'),
    Product(name: 'Product 13', price: '30.00'),
    Product(name: 'Product 14', price: '30.00'),
    Product(name: 'Product 14', price: '30.00'),




  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(
            product: products[index],
            onBuyNow: () {
              setState(() {
                products[index].incrementCounter();
                if (products[index].counter == 5) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Congratulations!'),
                        content: Text('You\'ve bought 5 ${products[index].name}!'),
                        actions: [
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart),
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage(products: products)),
          );
        },
      ),



    );
  }
}

class Product {
  String name;
  String price;
  int counter;

  Product({required this.name, required this.price, this.counter = 0});

  void incrementCounter() {
    counter++;
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  final VoidCallback onBuyNow;

  ProductItem({required this.product, required this.onBuyNow});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text('Price: \$${product.price}'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Counter: ${product.counter}'),
          ElevatedButton(
            onPressed: onBuyNow,
            child: Text('Buy Now'),
          ),
        ],
      ),
    );
  }
}

