import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../utils/firebase_helper.dart';
import 'controller/loginController.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  TextEditingController temail = TextEditingController();
  TextEditingController tpassword = TextEditingController();

  LoginController l_control = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5.w),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 8.h),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/logo/logo.png",height: 13.h,width: 70.w,),
                    ],
                  ),
                ),
                Text("Welcome !",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18.sp),),
                SizedBox(height: 1.h,),
                Text("please login or sign up to continue out app"),
                SizedBox(height: 5.h,),

                Text("Email",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.sp),),
                TextField(style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w400),
                  controller: temail,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.black38,
                  decoration: InputDecoration(

                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black12)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black54)),

                      hintText: "Enter valid Email-Id",
                      hintStyle: TextStyle(fontWeight: FontWeight.w200,fontSize: 12.sp)
                  ),

                ),
                SizedBox(height: 3.h,),
                Text("Password",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.sp),),
                Obx(
                  () =>  TextField(style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w400),
                    controller: tpassword,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black38,
                    obscureText: l_control.isHiddenUp.value,

                    decoration: InputDecoration(

                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black12)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black54)),

                        suffixIcon: IconButton(
                        onPressed: () =>  l_control.togglePasswordViewUp(),  /// This is Magical Function
                          icon:
                            l_control.isHiddenUp.value ?         /// CHeck Show & Hide.
                            Icon(Icons.visibility) :
                            Icon(Icons.visibility_off),
                            color: Colors.black38,

                        ),

                      hintText: "Enter Strong password",
                      hintStyle: TextStyle(fontWeight: FontWeight.w200,fontSize: 12.sp)
                    ),

                  ),
                ),

                GestureDetector(
                  onTap: () async {

                    String msg = await FirebaseHelper.firebaseHelper.emailSignIn(email: temail.text,password: tpassword.text);

                    if(msg == "Success")
                    {
                      temail.clear();
                      tpassword.clear();
                      Get.offAllNamed("/successLogin");
                    }
                    else
                      {
                        Get.snackbar("Something is Wrong", "The password is invalid or the user does not have a password.",
                            snackPosition: SnackPosition.BOTTOM,snackStyle: SnackStyle.FLOATING,
                            duration: Duration(seconds: 1),
                          borderColor: Colors.red,
                        );
                      }


                  },
                  child: Container(height: 7.h,width: 100.w,
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    alignment: Alignment.center,
                    child: Text("Login",style: TextStyle(fontSize: 16.sp,color: Colors.white,fontWeight: FontWeight.bold),),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.h),color: Color(0xff000000)),),
                ),


                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have an Account ? ",style: TextStyle(fontWeight: FontWeight.w300),),
                    SizedBox(width: 5.w,),
                    InkWell(
                        onTap: () async {
                          await FirebaseHelper.firebaseHelper.googleSignIn();
                          Get.offAllNamed("/successLogin");
                        },
                        child: CircleAvatar(radius:2.h,
                          backgroundImage: AssetImage("assets/images/logo/google.png"),
                          backgroundColor: Colors.transparent,
                        ))
                  ],
                ),
                SizedBox(height: 2.h,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have Account ? ",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 10.sp),),
                    TextButton(child: Text("Sign Up",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w400,color: Colors.blue),),onPressed: () => Get.toNamed("/signUp"),),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
