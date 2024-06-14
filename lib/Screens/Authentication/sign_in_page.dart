import 'package:assignment/Screens/Authentication/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../Controllers/Auth_Controller/SignIn_Controller.dart';
import '../../utils/CustomButton.dart';
import '../../utils/CustomSnackBar.dart';
import '../../utils/Style.dart';
import '../../utils/theme.dart';


class signIn_page extends StatefulWidget {
  signIn_page({super.key});

  @override
  State<signIn_page> createState() => _signIn_pageState();
}

class _signIn_pageState extends State<signIn_page> {
  int? num;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignIn_Controller>(
    builder: (auth){
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height*0.14,
                ),
                SizedBox(
                  height: height*0.08,
                ),
                Text("Welcome to",style: title,),
                const SizedBox(
                  height: 2,
                ),
                Text("Sign in Page",style: title,),
                SizedBox(
                  height: height*0.03,
                ),
                const Text("Please enter your Email address and password",
                  style: TextStyle(
                      fontSize: 13
                  ),),
                SizedBox(
                  height: height*0.03,
                ),
                Container(
                  height: 62,
                  width: width,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppConstasnts.grey,width: 1),
                      borderRadius: BorderRadius.circular(7)
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        controller: auth.number.value,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: "Email address",
                          labelStyle: TextStyle(
                              color: AppConstasnts.grey
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.only(top: 20,left: 7),
                        ),
                        onChanged: (value){
                          auth.check_len();
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height*0.03,
                ),
                Container(
                  height: 62,
                  width: width,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppConstasnts.grey,width: 1),
                      borderRadius: BorderRadius.circular(7)
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextField(
                        controller: auth.password,
                        obscureText: auth.isObsecure,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: const TextStyle(
                              color: AppConstasnts.grey
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.only(top: 20,left: 7),
                          suffixIcon: InkWell(
                            onTap: (){
                              auth.ispass();
                            },
                              child: Icon(auth.isObsecure==true?Icons.visibility:Icons.visibility_off)),
                        ),
                        onChanged: (value){
                          auth.check_len();
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height*0.03,
                ),
                CustomButton(
                  radius: 10,
                  width: width,
                  text: auth.isLoading?'Loading...':'LOGIN',
                  height: 50,
                  color:  auth.number.value.text.length>=1?AppConstasnts.theme_color:AppConstasnts.grey,
                  ontap: () async{
                      if(auth.number.value.text.isEmpty){
                         CustomSnackBar("Email is Empty");
                               }
                       else if(auth.password.text.isEmpty)
                             {
                        CustomSnackBar("Enter the password");
                         }
                    else {
                      auth.loginUserWithEmailAndPassword(auth.number.value.text, auth.password.text);

                        }
                  },
                  text_color: auth.number.value.text.isNotEmpty?AppConstasnts.white:Colors.grey.shade600,
                ),
                SizedBox(
                  height: height*0.015,
                ),
                 Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont have an accout?"),
                      TextButton(
                          onPressed:(){
                            Get.off(signUp_page());
                            auth.number.value.clear();
                            auth.password.clear();
                          },
                          child: const Text("Signup",style: TextStyle(color: Colors.blue),))
                    ],
                  ),
                ),

                SizedBox(
                  height: height*0.045,
                ),

                // Spacer(),
                SizedBox(
                  height: height*0.06,
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  height: 60,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("By login in or sigining up, you agree to the"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Privacy policy ",
                            style: TextStyle(
                              color: AppConstasnts.theme_color,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          Text("& ",
                            style: TextStyle(
                              color: AppConstasnts.theme_color,
                              fontWeight: FontWeight.w500,
                            ),),
                          Text("Terms and Conditions",
                            style: TextStyle(
                              color: AppConstasnts.theme_color,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      );
    }
    );
  }
}
