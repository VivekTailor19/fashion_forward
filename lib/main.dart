import 'package:fashion_forward/screens/01%20splash/splashScreen.dart';
import 'package:fashion_forward/screens/02%20intro/introScreen.dart';
import 'package:fashion_forward/screens/04%20first/bottomOptionScreens/1%20home/viewProductScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';
import 'screens/03 login/signInScreen.dart';
import 'screens/03 login/signUpScreen.dart';
import 'screens/03 login/successScreen.dart';
import 'screens/04 first/bottomOptionScreens/2 cart/myCartScreen.dart';
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
          // "/":(p0) => IntroScreen(),
          //
           "/":(p0) => SplashScreen(),
          "/intro":(p0) => IntroScreen(),
          "/signIn":(p0) => SignInScreen(),
          "/signUp":(p0) => SignUpScreen(),
          "/successLogin":(p0) => Success_LoginScreen(),
          "/first":(p0) => FirstScreen(),
          "/viewProduct":(p0) => ViewProductScreen(),
          "/myCart":(p0) => MyCartScreen()

        },
      ),
    ),
  );
}


/*


product add in  list with category,
view product ui complete -----------------------  live data remaining
add to card with number how much
notification add
profile screen ui with logout facility


database all product cart take as one -----  as change the model classs new variable of cart.
 */
