import 'package:assignment/Controllers/Auth_Controller/SignIn_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Authentication/sign_in_page.dart';




class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _check_AppState();
}

class _check_AppState extends State<Splash_Screen> {
  void initState() {
    check();


    super.initState();
  }

  void check() async{
   //  final prefs = await SharedPreferences.getInstance();
   //  var number1=prefs.getString("num");
   // List<String> cartL = prefs.getStringList('cartList') ?? [];
   // int priceC = prefs.getInt('priceCart') ?? 0;
   //  List<int>priceL = (prefs.getStringList('priceList') ?? []).map((e) => int.parse(e)).toList() ?? [];
   // List<String> paramet = prefs.getStringList('parameters') ?? [];
   //
   //  print(number1.toString()+"sharedsbjdhsdjkflhjaklgjnsjkljkfjkasdjkjkfjklsdjsdkl");
    Future.delayed(const Duration(seconds: 2), () {
      Get.put(SignIn_Controller());
      Get.off(()=>signIn_page(),transition: Transition.leftToRight);

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Quicktouch Assignment",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color:Colors.orangeAccent.shade200
            ),),
          )
        ],
      ),
    );
  }
}
