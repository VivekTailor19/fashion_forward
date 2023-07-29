import 'package:fashion_forward/screens/01%20splash/splashScreen.dart';
import 'package:fashion_forward/screens/04%20first/bottomOptionScreens/1%20home/viewProductScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';
import 'screens/03 login/signInScreen.dart';
import 'screens/03 login/signUpScreen.dart';
import 'screens/03 login/successScreen.dart';
import 'screens/04 first/first/firstScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) =>  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes:{
          "/":(p0) => SplashScreen(),
          "/signIn":(p0) => SignInScreen(),
          "/signUp":(p0) => SignUpScreen(),
          "/successLogin":(p0) => Success_LoginScreen(),
          "/first":(p0) => FirstScreen(),
          "/viewProduct":(p0) => ViewProductScreen(),

        },
      ),
    ),
  );
}


/*


product add in  list with category,
view product
add to card with number how much


 */
