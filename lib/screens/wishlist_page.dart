import 'package:elite_ecommerce/constants/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {

  var imageList = [
    "https://images.unsplash.com/photo-1551739440-5dd934d3a94a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8Y29tcHV0ZXJzfGVufDB8fDB8fHww"
    "https://images.unsplash.com/photo-1593642632823-8f785ba67e45?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8bGFwdG9wc3xlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1517502474097-f9b30659dadb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8d2VhcmFibGV8ZW58MHx8MHx8fDA%3D",
    "https://images.unsplash.com/photo-1585790054762-36743f4b07ff?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fHRhYmxldHN8ZW58MHx8MHx8fDA%3D",
    "https://images.unsplash.com/photo-1605364850023-a917c39f8fe9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHByaW50ZXJzfGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1536353284924-9220c464e262?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHJlZnJpZGdlcmF0b3J8ZW58MHx8MHx8fDA%3D",
    "https://images.unsplash.com/photo-1516852294404-5423eaa0d4a9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGNhbWVyYXN8ZW58MHx8MHx8fDA%3D",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist",style: TextStyle(color: n10,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 12,),
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.8,
        ), 
        itemBuilder: (context, index) {
          return ProductCard(
            image: imageList[index], 
            name: "Product Name", 
            category: "category", 
            price: 2999.00,
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String category;
  final double price;
  final bool isFavorite;
  const ProductCard({super.key, required this.image, required this.name, required this.category, required this.price, this.isFavorite = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 90,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(image,fit: BoxFit.cover,),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 5,right: 5,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,style: TextStyle(color: n10,fontWeight: FontWeight.bold,fontSize: 15,),),
                      SizedBox(height: 5,),
                      Text(category,style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w400,fontSize: 13,),),
                      SizedBox(height: 10,),
                      Text("\$${price}",style: TextStyle(color: n10,fontWeight: FontWeight.w600,fontSize: 13,),),
                    ],
                  ),
                  isFavorite == true ? Icon(CupertinoIcons.heart_fill,color: Colors.black,size: 20,) : Icon(CupertinoIcons.heart,color: Colors.black,size: 20,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}