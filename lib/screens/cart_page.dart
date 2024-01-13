import 'package:elite_ecommerce/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bag",style: TextStyle(color: n10,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      bottomNavigationBar: Container(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 24,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("\$${3999.00}",style: TextStyle(color: n10,fontWeight: FontWeight.w400,fontSize: 11,decoration: TextDecoration.lineThrough),),
                  SizedBox(height: 4,),
                  Text("\$${2999.00}",style: TextStyle(color: n10,fontWeight: FontWeight.bold,fontSize: 18,),),
                ],
              ),
              Container(
                height: 50,
                width: 180,
                decoration: BoxDecoration(
                  color: n10,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Place Order",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14,),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CartProductCard(
                  image: "",
                  name: "Product Name",
                  category: "Category",
                  price: 2999.00,
                  quantity: 1,
                ),
                SizedBox(height: 15,),
                CartProductCard(
                  image: "",
                  name: "Product Name",
                  category: "Category",
                  price: 2999.00,
                  quantity: 1,
                ),
                SizedBox(height: 20,),
                Text("Total",style: TextStyle(color: n10,fontWeight: FontWeight.bold,fontSize: 20,),),
                SizedBox(height: 20,),
                TotalAmountCard(
                  items: 2,
                  price: 2999.00,
                  discount: 100.00,
                  charges: 0.0,
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recomanded Products",style: TextStyle(color: n10,fontWeight: FontWeight.bold,fontSize: 20,),),
                    Text("see more",style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w400,fontSize: 14,),),
                  ],
                ),
                SizedBox(height: 20,),
                RecommandedCard(
                  image: "", 
                  name: "Product Name", 
                  category: "Product Category", 
                  price: 2999.00,
                ),
                SizedBox(height: 15,),
                RecommandedCard(
                  image: "", 
                  name: "Product Name", 
                  category: "Product Category", 
                  price: 2999.00,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CartProductCard extends StatefulWidget {
  final String image;
  final String name;
  final String category;
  final double price;
  int quantity;
  CartProductCard({super.key, required this.image, required this.name, required this.category, required this.price, required this.quantity});

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 80,
                  width: 70,
                  decoration: BoxDecoration(
                    color: nv80,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                SizedBox(width: 18,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name,style: TextStyle(color: n10,fontWeight: FontWeight.bold,fontSize: 17,),),
                    SizedBox(height: 04,),
                    Text(widget.category,style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w400,fontSize: 13,),),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$${widget.price}",style: TextStyle(color: n10,fontWeight: FontWeight.w500,fontSize: 14,),),
                        SizedBox(width: 90,),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if(widget.quantity > 1) {
                                    widget.quantity--; 
                                  } else {
                                    print("0");
                                  }
                                });
                              },
                              child: Icon(Icons.remove_circle_rounded,color: n10,)
                            ),
                            SizedBox(width: 02,),
                            Text(widget.quantity.toString(),style: TextStyle(color: n10,fontWeight: FontWeight.w500,fontSize: 17,),),
                            SizedBox(width: 02,),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  widget.quantity++; 
                                });
                              },
                              child: Icon(Icons.add_circle_sharp,color: n10,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10,),
            Divider(),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  child: Text("Remove"),
                ),
                Container(
                  height: 20,
                  width: 1,
                  decoration: BoxDecoration(
                    color: nv80,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                InkWell(
                  child: Text("Save for later"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TotalAmountCard extends StatefulWidget {
  final int  items;
  final double price;
  final double discount;
  final double charges;
  const TotalAmountCard({super.key, required this.items, required this.price, required this.discount, required this.charges});

  @override
  State<TotalAmountCard> createState() => _TotalAmountCardState();
}

class _TotalAmountCardState extends State<TotalAmountCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Price (${widget.items} items)"),
            Text("\$${widget.price}"),
          ],
        ),
        SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Discount"),
            Text("\$${widget.discount}"),
          ],
        ),
        SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Delivery Charges"),
            Text(widget.charges <= 0.0 ? "Free Delivery" : widget.charges.toString()),
          ],
        ),
        SizedBox(height: 15,),
        Divider(),
        SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total Amount",style: TextStyle(color: n10,fontWeight: FontWeight.bold,fontSize: 17,),),
            Text("\$${widget.price + widget.discount}",style: TextStyle(color: n10,fontWeight: FontWeight.bold,fontSize: 17,),),
          ],
        ),
      ],
    );
  }
}


class RecommandedCard extends StatelessWidget {
  final String image;
  final String name;
  final String category;
  final double price;
  const RecommandedCard({super.key, required this.image, required this.name, required this.category, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: nv80,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                SizedBox(width: 18,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,style: TextStyle(color: n10,fontWeight: FontWeight.bold,fontSize: 17,),),
                    SizedBox(height: 04,),
                    Text(category,style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w400,fontSize: 13,),),
                  ],
                ),
              ],
            ),
            Text("\$${price}",style: TextStyle(color: n10,fontWeight: FontWeight.w500,fontSize: 15,),),
          ],
        ),
      ),
    );
  }
}