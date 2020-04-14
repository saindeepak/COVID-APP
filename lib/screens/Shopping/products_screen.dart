import './product_item.dart';
import 'package:flutter/material.dart';
import '../mainDrawer.dart';
import './product.dart';

class ProductsScreen extends StatefulWidget {
  // static const routeName = '/products';
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
   List<Product> displayedProducts = [
  Product(
    id: 'p1',
    title: 'N95 Mask',
    imageUrl: 'https://images-na.ssl-images-amazon.com/images/I/81cHaUH6BnL._SL1500_.jpg',
    url: 'https://www.amazon.in/Amazon-Brand-Anti-Pollution-Livinguard-Technology/dp/B085NY5F9F/ref=sr_1_1?dchild=1&keywords=n95+masks&qid=1586516870&sr=8-1',
  ), 
  Product(
    id: 'p2',
    title: 'Sanitizer',
    imageUrl: 'https://images-na.ssl-images-amazon.com/images/I/514AzfQRCOL._SL1100_.jpg',
    url: 'https://www.amazon.in/Dettol-Instant-Hand-Sanitizer-50/dp/B007BBU09M/ref=sr_1_1?dchild=1&keywords=sanitizers&qid=1586517148&sr=8-1',
  ), 
  Product(
    id: 'p3',
    title: 'Disinfetant Surface Cleaner',
    imageUrl: 'https://images-na.ssl-images-amazon.com/images/I/71I4sezMuKL._SL1500_.jpg',
    url: 'https://www.amazon.in/Amazon-Brand-Disinfectant-Surface-Cleaner/dp/B07ZKQ56L3/ref=sr_1_15?dchild=1&keywords=coronavirus&qid=1586520937&sr=8-15',
  ), 
  Product(
    id: 'p4',
    title: 'Surgical Mask',
    imageUrl: 'https://images-na.ssl-images-amazon.com/images/I/81WrjLypzEL._SL1500_.jpg',
    url: 'https://www.amazon.in/Boldfit-Surgical-Mask-Ply-Loop/dp/B085PVRP16/ref=sr_1_13?dchild=1&keywords=coronavirus&qid=1586520937&sr=8-13',
  ), 
  Product(
    id: 'p5',
    title: 'Protection Kit',
    imageUrl: 'https://images-na.ssl-images-amazon.com/images/I/71ybVGLduqL._SL1500_.jpg',
    url: 'https://www.amazon.in/AABACO-SAFETY-PROTECTION-KITS-Protection/dp/B085HJDKZK/ref=sr_1_1?crid=1DHZ7OUR3GZZP&dchild=1&keywords=coronavirus+protection+kit&qid=1586521065&sprefix=coronavirus+protection+%2Caps%2C302&sr=8-1',
  ),  
];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Shop Essentials"),
        ),
        drawer: Drawer(
          child: MainDrawer(),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, i) {
            return ProductItem(
              id: displayedProducts[i].id,
              title: displayedProducts[i].title,
              imageUrl: displayedProducts[i].imageUrl,
              url: displayedProducts[i].url,
            );
          },
          itemCount: displayedProducts.length,
        ),
      );
  }
}
