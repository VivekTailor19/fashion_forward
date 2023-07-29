import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../utils/firebase_helper.dart';
import 'controller/loginController.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController temail = TextEditingController();
  TextEditingController tpassword = TextEditingController();
  TextEditingController tcpassword = TextEditingController();

  LoginController l_control = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/logo/logo.png",
                        height: 13.h,
                        width: 70.w,
                      ),
                    ],
                  ),
                ),
                Text(
                  "Sign Up",
                  style:
                      TextStyle(fontWeight: FontWeight.w800, fontSize: 18.sp),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text("Create an new account"),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Email",
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
                ),
                TextField(
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
                  controller: temail,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.black38,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54)),
                      hintText: "Enter valid Email-Id",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w200, fontSize: 12.sp)),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  "Password",
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
                ),
                Obx(
                  () => TextField(
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
                    controller: tpassword,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black38,
                    obscureText: l_control.isHiddenIn.value,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54)),
                        suffixIcon: IconButton(
                          onPressed: () => l_control.togglePasswordViewIn(),

                          /// This is Magical Function
                          icon: l_control.isHiddenIn.value
                              ?

                              /// CHeck Show & Hide.
                              Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          color: Colors.black38,
                        ),
                        hintText: "Enter Strong password",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 12.sp)),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  "Confirm Password",
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
                ),
                Obx(
                  () => TextField(
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
                    controller: tcpassword,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black38,
                    obscureText: l_control.isHiddenC.value,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54)),
                        suffixIcon: IconButton(
                          onPressed: () => l_control.togglePasswordViewC(),

                          /// This is Magical Function
                          icon: l_control.isHiddenC.value
                              ?

                              /// CHeck Show & Hide.
                              Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          color: Colors.black38,
                        ),
                        hintText: "Enter Strong password",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 12.sp)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Obx(
                            () =>  Checkbox(
                              checkColor: Colors.black,
                              activeColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),side: BorderSide(color: Colors.green)),
                              value: l_control.checkConditions.value,
                              onChanged: (value) {
                          l_control.checkConditions.value = value! ;
                        },),
                      ),
                      SizedBox(width: 75.w,
                        child: Text("By creating an account you have to agree with our terms & conditions.",
                          softWrap: true,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.visible,
                          style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w300,color: Colors.black45),
                          maxLines: 2,),
                      )

                    ],),
                ),
                GestureDetector(
                  onTap: () async {

                    if(tpassword.text != tcpassword.text)
                      {
                        Get.snackbar("Alert", "The Enter Both Password are not matched with eachother. Please kindly check and re-enter the password.",snackStyle: SnackStyle.FLOATING,borderColor: Colors.red.shade300);
                      }
                    else
                      {
                        String msg = await FirebaseHelper.firebaseHelper.emailSignUp(email: temail.text,password: tpassword.text);

                        if(msg == "Success")
                        {
                          temail.clear();
                          tpassword.clear();
                          tcpassword.clear();

                          Get.back();
                        }
                      }







                  },
                  child: Container(
                    height: 8.h,
                    width: 100.w,
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    margin: EdgeInsets.symmetric(vertical: 1.h),
                    alignment: Alignment.center,
                    child: Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.h),
                        color: Color(0xff000000)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already has Account ? ",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    TextButton(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue),
                      ),
                      onPressed: () => Get.back(),
                    ),
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
