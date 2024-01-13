// import 'dart:convert';
// import 'package:ecommerce/api_connection/api_connection.dart';
// import 'package:ecommerce/constants/colors.dart';
// import 'package:ecommerce/users/authentication/login_screen.dart';
// import 'package:ecommerce/users/model/user.dart';
// import 'package:ecommerce/users/screens/user_home_screen.dart';
// import 'package:ecommerce/users/screens/user_main_screen.dart';
// import 'package:ecommerce/users/userPreferences/user_preferences.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {

//   var formKey = GlobalKey<FormState>();
//   var _isObsecure = true.obs;
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   validateUserEmail() async {
//     try {
//       var res = await http.post(
//         Uri.parse(API.validateEmail),
//         body: {
//           'user_email': _emailController.text.trim(),
//         },
//       );  

//       if(res.statusCode == 200) {
//         var resBodyOfvalidateEmail = jsonDecode(res.body);
//         if(resBodyOfvalidateEmail['emailFound'] == true) {
//           Fluttertoast.showToast(msg: "Email is already in someone else use.Try another email.");
//         } else {
//           registerAndSaveUserRecord();
//         }
//       }

//     } catch(e) {
//       print(e.toString());
//       Fluttertoast.showToast(msg: e.toString());
//     } 
//   }

//   registerAndSaveUserRecord() async {
//     User userModel = User(
//       1,
//       _nameController.text.trim(),
//       _emailController.text.trim(),
//       _passwordController.text.trim(),
//     );

//     try {
//       var res = await http.post(
//         Uri.parse(API.signUp),
//         body: userModel.toJson(),
//       );
//       if(res.statusCode == 200) {
//         var resBodyOfSignup = jsonDecode(res.body);

//         if(resBodyOfSignup['success'] == true) {
//           Fluttertoast.showToast(msg: "signup Successfully..!");

//           User userInfo = User.fromJson(resBodyOfSignup['userData']);

//           await RememberUserPrefs.storaeUserInfo(userInfo);

//           Future.delayed(Duration(milliseconds: 200),() {
//             Get.to(UserMainScreen());
//           });

//           setState(() {
//             _nameController.clear();
//             _emailController.clear();
//             _passwordController.clear();  
//           });

//         } else {
//           Fluttertoast.showToast(msg: "Error occured try again..!");
//         }
//       }
//     } catch(e) {
//       print(e.toString());
//       Fluttertoast.showToast(msg: e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // return Scaffold(
//     //   appBar: AppBar(
//     //     title: Text("Signup Screen"),
//     //   ),
//     //   body: LayoutBuilder(
//     //     builder: (context,cons) {
//     //       return SingleChildScrollView(
//     //         child: Form(
//     //           key: formKey,
//     //           child: Padding(
//     //             padding: const EdgeInsets.symmetric(horizontal: 20,),
//     //             child: Column(
//     //               mainAxisAlignment: MainAxisAlignment.center,
//     //               crossAxisAlignment: CrossAxisAlignment.center,
//     //               children: [
//     //                 TextFormField(
//     //                   controller: _nameController,
//     //                   validator: (val) => val == "" ? "Please write name" : null,
//     //                   decoration: InputDecoration(
//     //                     prefixIcon: Icon(Icons.person),
//     //                     hintText: "Name",
//     //                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
//     //                     enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
//     //                     disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
//     //                       focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
//     //                     focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
//     //                     contentPadding: EdgeInsets.symmetric(horizontal: 14,vertical: 6,),
//     //                   ),
//     //                 ),
//     //                 SizedBox(height: 20,),
//     //                 TextFormField(
//     //                   controller: _emailController,
//     //                   validator: (val) => val == "" ? "Please write email" : null,
//     //                   decoration: InputDecoration(
//     //                     prefixIcon: Icon(Icons.email),
//     //                     hintText: "Email",
//     //                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
//     //                     enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
//     //                     disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
//     //                     focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
//     //                     focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
//     //                     contentPadding: EdgeInsets.symmetric(horizontal: 14,vertical: 6,),
//     //                   ),
//     //                 ),
//     //                 SizedBox(height: 20,),
//     //                 Obx(
//     //                   () => TextFormField(
//     //                     controller: _passwordController,
//     //                     obscureText: _isObsecure.value,
//     //                     validator: (val) => val == "" ? "Please write password" : null,
//     //                     decoration: InputDecoration(
//     //                       prefixIcon: Icon(Icons.lock),
//     //                       suffixIcon: Obx(
//     //                         () => InkWell(
//     //                           onTap: () {
//     //                             _isObsecure.value = !_isObsecure.value;
//     //                           },
//     //                           child: _isObsecure.value ? Icon(Icons.visibility_off_outlined) : Icon(Icons.remove_red_eye_outlined),
//     //                         ),
//     //                       ),
//     //                       hintText: "Password",
//     //                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
//     //                       enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
//     //                       disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
//     //                       focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
//     //                       focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
//     //                       contentPadding: EdgeInsets.symmetric(horizontal: 14,vertical: 6,),
//     //                     ),
//     //                   ),
//     //                 ),
//     //                 SizedBox(height: 40,),
//     //                 Material(
//     //                   color: Colors.blue,
//     //                   borderRadius: BorderRadius.circular(12),
//     //                   child: InkWell(
//     //                     onTap: () {
//     //                       if(formKey.currentState!.validate()) {
//     //                         validateUserEmail();
//     //                       }
//     //                     },
//     //                     borderRadius: BorderRadius.circular(12),
//     //                     child: Padding(
//     //                       padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20,),
//     //                       child: Text("Signup"),
//     //                     ),
//     //                   ),
//     //                 ),
//     //                 SizedBox(height: 20,),
//     //                 Row(
//     //                   children: [
//     //                     Text("Already have an Account ? "),
//     //                     InkWell(
//     //                       onTap: () {
//     //                         Get.to(LoginScreen());
//     //                       },
//     //                       child: Text("Login"),
//     //                     ),
//     //                   ],
//     //                 ),
//     //               ],
//     //             ),
//     //           ),
//     //         ),
//     //       );
//     //     }
//     //   ),
//     // );
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20,),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(height: 70,),
//                 Text("Register",style: GoogleFonts.roboto(color: s10,fontWeight: FontWeight.bold,fontSize: 30,)),
//                 SizedBox(height: 12,),
//                 Text("Create your new Account",style: GoogleFonts.roboto(color: n50,fontSize: 16,)),
//                 SizedBox(height: 25,),
//                 Container(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Username",style: GoogleFonts.roboto(color: n10,fontWeight: FontWeight.bold,fontSize: 17,)),
//                       SizedBox(height: 08,),
//                       TextFormField(
//                         cursorColor: s10,
//                         controller: _nameController,
//                           validator: (val) => val == "" ? "Please write name" : null,
//                           decoration: InputDecoration(
//                             hintText: "Username",
//                             hintStyle: GoogleFonts.roboto(color: n50,),
//                             filled: true,
//                             fillColor: n87,
//                             prefixIcon: Icon(Icons.person,color: n50,),
//                             enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: n87,),),
//                             focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: n87,),),
//                             errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: n87,),),
//                             focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: n87,),),
//                           ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 25,),
//                 Container(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Email Address",style: GoogleFonts.roboto(color: n10,fontWeight: FontWeight.bold,fontSize: 17,)),
//                       SizedBox(height: 08,),
//                       TextFormField(
//                         cursorColor: s10,
//                         controller: _emailController,
//                           validator: (val) => val == "" ? "Please write email" : null,
//                           decoration: InputDecoration(
//                             hintText: "e.g : example@gmail.com",
//                             hintStyle: GoogleFonts.roboto(color: n50,),
//                             filled: true,
//                             fillColor: n87,
//                             prefixIcon: Icon(Icons.email_rounded,color: n50,),
//                             enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: n87,),),
//                             focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: n87,),),
//                             errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: n87,),),
//                             focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: n87,),),
//                           ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 25,),
//                 Container(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Password",style: GoogleFonts.roboto(color: n10,fontWeight: FontWeight.bold,fontSize: 17,)),
//                       SizedBox(height: 08,),
//                       Obx(() => TextFormField(
//                         cursorColor: s10,
//                         controller: _passwordController,
//                           obscureText: _isObsecure.value,
//                           validator: (val) => val == "" ? "Please write password" : null,
//                           decoration: InputDecoration(
//                             hintText: "Create Password",
//                             hintStyle: GoogleFonts.roboto(color: n50,),
//                             filled: true,
//                             fillColor: n87,
//                             prefixIcon: Icon(Icons.lock,color: n50),
//                             suffixIcon: Obx(
//                               () => InkWell(
//                                 onTap: () {
//                                   _isObsecure.value = !_isObsecure.value;
//                                 },
//                                 child: _isObsecure.value ? Icon(Icons.visibility_off_outlined,color: n50) : Icon(Icons.remove_red_eye_outlined,color: n50),
//                               ),
//                             ),
//                             enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: n87,),),
//                             focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: n87,),),
//                             errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: n87,),),
//                             focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: n87,),),
//                           ),
//                       ),),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 25,),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Icon(Icons.checklist_rounded,color: s40,),
//                     SizedBox(width: 15,),
//                     Text("I agree to the terms and condition and the \nprivacy policy.",textAlign: TextAlign.left,style: GoogleFonts.roboto(color: n10,fontWeight: FontWeight.w500,fontSize: 13,),),
//                   ],
//                 ),
//                 SizedBox(height: 35,),
//                 InkWell(
//                   onTap: () {
//                     validateUserEmail();
//                   },
//                   child: Container(
//                     height: 50,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: s10,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Center(child: Text("Continue",style: GoogleFonts.roboto(color: s90,fontWeight: FontWeight.bold,fontSize: 16,),)),
//                   ),
//                 ),
//                 SizedBox(height: 25,),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("OR",style: GoogleFonts.roboto(color: n50,fontSize: 16,),),
//                   ],
//                 ),
//                 SizedBox(height: 25,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text("Already have an account ? ",style: GoogleFonts.roboto(color: n50,fontSize: 14,),),
//                     InkWell(
//                       onTap: () {
//                         Get.to(LoginScreen());
//                       },
//                       child: Text("Sign in",style: GoogleFonts.roboto(color: n10,fontWeight: FontWeight.bold,fontSize: 14,),),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }