import 'package:elite_ecommerce/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories",style: TextStyle(color: n10,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              LeftImageCategoryCard(
                title: "Leptop",
                desc: "HP, Dell, Toshiba, Lenovo, LG, Acer, Apple, Samsung and Micromax...",
                image: "https://images.unsplash.com/photo-1593642632823-8f785ba67e45?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8bGFwdG9wc3xlbnwwfHwwfHx8MA%3D%3D",
              ),
              SizedBox(height: 20,),
              RightImageCategoryCard(
                title: "Wearables",
                desc: "That can be worn as accessories,implemented in user's body...",
                image: "https://images.unsplash.com/photo-1517502474097-f9b30659dadb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8d2VhcmFibGV8ZW58MHx8MHx8fDA%3D",
              ),
              SizedBox(height: 20,),
              LeftImageCategoryCard(
                title: "Computers",
                desc: "It is an electronic device that manipluated information,or data...",
                image: "https://images.unsplash.com/photo-1551739440-5dd934d3a94a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8Y29tcHV0ZXJzfGVufDB8fDB8fHww",
              ),
              SizedBox(height: 20,),
              RightImageCategoryCard(
                title: "Tablets",
                desc: "It is a wireless,portable personal computer with a touchscreen interface...",
                image: "https://images.unsplash.com/photo-1585790054762-36743f4b07ff?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fHRhYmxldHN8ZW58MHx8MHx8fDA%3D",
              ),
              SizedBox(height: 20,),
              LeftImageCategoryCard(
                title: "Printers",
                desc: "That accepts text & graphics output from a computer & transfers the information to paper...",
                image: "https://images.unsplash.com/photo-1605364850023-a917c39f8fe9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHByaW50ZXJzfGVufDB8fDB8fHww",
              ),
              SizedBox(height: 20,),
              RightImageCategoryCard(
                title: "Refrigrators",
                desc: "use a closed system that reiles on refrigerant travelling in coils throughout the fridge...",
                image: "https://images.unsplash.com/photo-1536353284924-9220c464e262?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHJlZnJpZGdlcmF0b3J8ZW58MHx8MHx8fDA%3D",
              ),
              SizedBox(height: 20,),
              LeftImageCategoryCard(
                title: "Cameras",
                desc: "Optical devices for recording photographic image or videos...",
                image: "https://images.unsplash.com/photo-1516852294404-5423eaa0d4a9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGNhbWVyYXN8ZW58MHx8MHx8fDA%3D",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RightImageCategoryCard extends StatelessWidget {
  final String title;
  final String desc;
  final String image;
  const RightImageCategoryCard({super.key, required this.title, required this.desc, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12,),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Row(
            children: [
              Container(
                width: 195,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,style: TextStyle(color: n10,fontWeight: FontWeight.bold,fontSize: 18,),),
                    SizedBox(height: 06,),
                    Text(desc,style: TextStyle(color: nv30,fontWeight: FontWeight.w300,fontSize: 13,),),
                  ],
                ),
              ),
              SizedBox(width: 13,),
              Container(
                height: 80,
                width: 100,
                decoration: BoxDecoration(
                  color: nv30,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(image,fit: BoxFit.cover,)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LeftImageCategoryCard extends StatelessWidget {
  final String title;
  final String desc;
  final String image;
  const LeftImageCategoryCard({super.key, required this.title, required this.desc, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12,),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 100,
                decoration: BoxDecoration(
                  color: nv30,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(image,fit: BoxFit.cover,)
                ),
              ),
              SizedBox(width: 13,),
              Container(
                width: 195,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,style: TextStyle(color: n10,fontWeight: FontWeight.bold,fontSize: 18,),),
                    SizedBox(height: 06,),
                    Text(desc,style: TextStyle(color: nv30,fontWeight: FontWeight.w300,fontSize: 13,),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}