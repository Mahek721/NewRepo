// import 'dart:convert';
// import 'package:ecommerce/api_connection/api_connection.dart';
// import 'package:ecommerce/constants/colors.dart';
// import 'package:ecommerce/users/authentication/signup_screen.dart';
// import 'package:ecommerce/users/model/user.dart';
// import 'package:ecommerce/users/screens/user_main_screen.dart';
// import 'package:ecommerce/users/userPreferences/user_preferences.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {

//   var formKey = GlobalKey<FormState>();
//   var _isObsecure = true.obs;
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;

//   loginUserNow() async {
//     setState(() {
//       _isLoading = true;
//     });
//     try {
//       var res = await http.post(
//         Uri.parse(API.login),
//         body: {
//           'user_email': _emailController.text.trim(),
//           'user_password': _passwordController.text.trim(),
//         },
//       );

//       if(res.statusCode == 200) {
//         var resBodyOfLogin = jsonDecode(res.body);

//         if(resBodyOfLogin['success'] == true) {
//           Fluttertoast.showToast(msg: "Login Successfully..!");

//           User userInfo = User.fromJson(resBodyOfLogin['userData']);

//           await RememberUserPrefs.storaeUserInfo(userInfo);

//           Future.delayed(Duration(milliseconds: 200),() {
//             Get.to(UserMainScreen());
//           });

//         } else {
//           Fluttertoast.showToast(msg: "Error occured try again..!");
//         }
//       }
//     } catch(e) {
//       print(e.toString());
//       Fluttertoast.showToast(msg: e.toString());
//     }
//     Future.delayed(Duration(milliseconds: 200),() {
//       Get.to(UserMainScreen());
//     });
//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // return Scaffold(
//     //   appBar: AppBar(
//     //     title: Text("Login Screen"),
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
//     //                         loginUserNow();
//     //                       }
//     //                     },
//     //                     borderRadius: BorderRadius.circular(12),
//     //                     child: Padding(
//     //                       padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20,),
//     //                       child: Text("Login"),
//     //                     ),
//     //                   ),
//     //                 ),
//     //                 SizedBox(height: 20,),
//     //                 Row(
//     //                   children: [
//     //                     Text("Don't have an Account ? "),
//     //                     InkWell(
//     //                       onTap: () {
//     //                         Get.to(SignupScreen());
//     //                       },
//     //                       child: Text("Signup"),
//     //                     ),
//     //                   ],
//     //                 ),
//     //                 SizedBox(height: 20,),
//     //                 Row(
//     //                   children: [
//     //                     Text("You are a Admin ? "),
//     //                     InkWell(
//     //                       onTap: () {
                            
//     //                       },
//     //                       child: Text("Click here"),
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
//                 SizedBox(height: 140,),
//                 Text("Welcome Back",style: GoogleFonts.roboto(color: s10,fontWeight: FontWeight.bold,fontSize: 30,)),
//                 SizedBox(height: 12,),
//                 Text("Login with email and password",style: GoogleFonts.roboto(color: n50,fontSize: 14,)),
//                 SizedBox(height: 50,),
//                 Container(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Text("Email Address",style: GoogleFonts.roboto(color: n10,fontWeight: FontWeight.bold,fontSize: 17,)),
//                       // SizedBox(height: 08,),
//                       TextFormField(
//                         cursorColor: s10,
//                         controller: _emailController,
//                           validator: (val) => val == "" ? "Please write email" : null,
//                           decoration: InputDecoration(
//                             hintText: "Enter your Email",
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
//                       // Text("Password",style: GoogleFonts.roboto(color: n10,fontWeight: FontWeight.bold,fontSize: 17,)),
//                       // SizedBox(height: 08,),
//                       Obx(() => TextFormField(
//                         cursorColor: s10,
//                         controller: _passwordController,
//                           obscureText: _isObsecure.value,
//                           validator: (val) => val == "" ? "Please write password" : null,
//                           decoration: InputDecoration(
//                             hintText: "Enter your Password",
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
//                     loginUserNow();
//                   },
//                   child: Container(
//                     height: 50,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: s10,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Center(child: _isLoading ? CircularProgressIndicator(color: s90,) : Text("Continue",style: GoogleFonts.roboto(color: s90,fontWeight: FontWeight.bold,fontSize: 16,),)),
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
//                     Text("Don't have an account ? ",style: GoogleFonts.roboto(color: n50,fontSize: 14,),),
//                     InkWell(
//                       onTap: () {
//                         Get.to(SignupScreen());
//                       },
//                       child: Text("Sign up",style: GoogleFonts.roboto(color: n10,fontWeight: FontWeight.bold,fontSize: 14,),),
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