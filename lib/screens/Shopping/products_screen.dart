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
      imageUrl:
          'assets/n95mask.jpg',
      url:
          'https://www.amazon.in/Amazon-Brand-Anti-Pollution-Livinguard-Technology/dp/B085NY5F9F/ref=sr_1_1?dchild=1&keywords=n95+masks&qid=1586516870&sr=8-1',
      rating: '3.9',
      available: 'In Stock',
    ),
    Product(
      id: 'p2',
      title: 'Liquid Sanitizer',
      imageUrl:
          'assets/dettol.jpg',
      url:
          'https://www.amazon.in/Dettol-Instant-Hand-Sanitizer-50/dp/B007BBU09M/ref=sr_1_1?dchild=1&keywords=sanitizers&qid=1586517148&sr=8-1',
      rating: '4.2',
      available: 'In Stock',
    ),
    Product(
      id: 'p3',
      title: 'Alcohol Sanitizer',
      imageUrl:
          'assets/alcohol_sanitizer.jpg',
      url:
          'https://www.amazon.in/Waterless-Sanitizer-Protection-Sanitizing-Rinse-free/dp/B085VCXBHV/ref=sr_1_1?crid=66MJXX8I1DHK&dchild=1&keywords=alcohol+sanitizer+500ml&qid=1586876613&sprefix=alcohol%2Caps%2C338&sr=8-1',
      rating: '4.5',
      available: 'In Stock',
    ),
    Product(
      id: 'p4',
      title: 'Disinfetant Surface Cleaner',
      imageUrl:
          'assets/disinfectant_cleaner.jpg',
      url:
          'https://www.amazon.in/Amazon-Brand-Disinfectant-Surface-Cleaner/dp/B07ZKQ56L3/ref=sr_1_15?dchild=1&keywords=coronavirus&qid=1586520937&sr=8-15',
      rating: '3.7',
      available: 'In Stock',
    ),
    Product(
      id: 'p5',
      title: 'Surgical Mask',
      imageUrl:
          'assets/surgical_mask.jpg',
      url:
          'https://www.amazon.in/Boldfit-Surgical-Mask-Ply-Loop/dp/B085PVRP16/ref=sr_1_13?dchild=1&keywords=coronavirus&qid=1586520937&sr=8-13',
      rating: '4.3',
      available: 'In Stock',
    ),
    Product(
      id: 'p6',
      title: 'Protection Kit',
      imageUrl:
          'assets/protection_kit.jpg',
      url:
          'https://www.amazon.in/AABACO-SAFETY-PROTECTION-KITS-Protection/dp/B085HJDKZK/ref=sr_1_1?crid=1DHZ7OUR3GZZP&dchild=1&keywords=coronavirus+protection+kit&qid=1586521065&sprefix=coronavirus+protection+%2Caps%2C302&sr=8-1',
      rating: '3.5',
      available: 'In Stock',
    ),
    Product(
      id: 'p7',
      title: 'Protection Gloves',
      imageUrl:
          'assets/gloves.jpg',
      url:
          'https://www.amazon.in/Hand-Pro-Nitrile-Powder-free-Gloves/dp/B07LCFR6J1/ref=sr_1_1?crid=2W5PNQ9E5NRX9&dchild=1&keywords=gloves+for+corona+protection&qid=1586876405&sprefix=gloves+for+coro%2Caps%2C439&sr=8-1',
      rating: '4.0',
      available: 'In Stock',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Shop Essentials",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Roboto',
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue[100],
                  Colors.blue[200],
                  Colors.blue[300],
                  Colors.blue[400]
                ],
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: MainDrawer(),
        ),
        body: Container(
          color: Colors.grey.withOpacity(0.2),
          child: ListView.builder(
            itemBuilder: (ctx, i) {
              return ProductItem(
                id: displayedProducts[i].id,
                title: displayedProducts[i].title,
                imageUrl: displayedProducts[i].imageUrl,
                url: displayedProducts[i].url,
                rating: displayedProducts[i].rating,
                available: displayedProducts[i].available,
              );
            },
            itemCount: displayedProducts.length,
          ),
        ),
      ),
    );
  }
}
