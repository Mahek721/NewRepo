import 'package:elite_ecommerce/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile",style: TextStyle(color: n10,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: n12,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  // child: ClipRRect(
                                  //   borderRadius: BorderRadius.circular(100),
                                  //   child: Image.network("",fit: BoxFit.cover,),
                                  // ),
                                ),
                                SizedBox(width: 14,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Mahek Shobhasana",style: TextStyle(color: n10,fontWeight: FontWeight.bold,fontSize: 17,),),
                                    SizedBox(height: 4,),
                                    Text("+91 8849652719",style: TextStyle(color: nv60,fontWeight: FontWeight.w500,fontSize: 13,),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded,color: n10,size: 16,),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18,),
                Container(
                  // decoration: BoxDecoration(
                  //   color: Colors.grey[200],
                  //   borderRadius: BorderRadius.circular(12),
                  // ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            ListTile(       
                              onTap: () {},
                              title: Text("My Orders",style: TextStyle(color: n10,fontWeight: FontWeight.w400,fontSize: 14,),),
                              trailing: Icon(Icons.arrow_forward_ios_rounded,color: n10,size: 16,),
                            ),
                            ListTile(    
                              onTap: () {},
                              title: Text("My Reviews",style: TextStyle(color: n10,fontWeight: FontWeight.w400,fontSize: 14,),),
                              trailing: Icon(Icons.arrow_forward_ios_rounded,color: n10,size: 16,),
                            ),
                            ListTile(
                              onTap: () {},
                              title: Text("My Address",style: TextStyle(color: n10,fontWeight: FontWeight.w400,fontSize: 14,),),
                              trailing: Icon(Icons.arrow_forward_ios_rounded,color: n10,size: 16,),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            ListTile(    
                              onTap: () {},
                              title: Text("Save for later",style: TextStyle(color: n10,fontWeight: FontWeight.w400,fontSize: 14,),),
                              trailing: Icon(Icons.arrow_forward_ios_rounded,color: n10,size: 16,),
                            ),
                            ListTile(
                              onTap: () {},
                              title: Text("Notification",style: TextStyle(color: n10,fontWeight: FontWeight.w400,fontSize: 14,),),
                              trailing: Icon(Icons.arrow_forward_ios_rounded,color: n10,size: 16,),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              onTap: () {},
                              title: Text("Customer Care",style: TextStyle(color: n10,fontWeight: FontWeight.w400,fontSize: 14,),),
                              trailing: Icon(Icons.arrow_forward_ios_rounded,color: n10,size: 16,),
                            ),
                            ListTile(
                              onTap: () {},
                              title: Text("Terms & Conditions",style: TextStyle(color: n10,fontWeight: FontWeight.w400,fontSize: 14,),),
                              trailing: Icon(Icons.arrow_forward_ios_rounded,color: n10,size: 16,),
                            ),
                            ListTile(
                              onTap: () {},
                              title: Text("Return Policy",style: TextStyle(color: n10,fontWeight: FontWeight.w400,fontSize: 14,),),
                              trailing: Icon(Icons.arrow_forward_ios_rounded,color: n10,size: 16,),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 18,),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: nv60,
                    ),
                  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Logout",style: TextStyle(color: n10,fontWeight: FontWeight.w400,fontSize: 14,),),
                        SizedBox(width: 8,),
                        Icon(Icons.power_settings_new_rounded,color: n10,size: 20,),
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: 10,),
                // Text("Version: v1.1.0",style: TextStyle(color: n10,fontWeight: FontWeight.w300,fontSize: 11,),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}