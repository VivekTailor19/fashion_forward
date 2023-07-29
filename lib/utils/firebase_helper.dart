import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseHelper
{
  static FirebaseHelper firebaseHelper = FirebaseHelper._();
  FirebaseHelper._();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

//==========================================================================
// =====================   Login  =========================================
//==========================================================================

  bool check_user()
  {
    User? user=auth.currentUser;
    return user!=null;
  }


//  --------------------------    Email     --------------------------------------------
  Future<String> emailSignUp({email,password})
  async {

    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      return "Success";
    }catch(e)
    {
      return "$e";
    }

  }

  Future<String> emailSignIn({email,password})
  async {
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "Success";
    }catch(e)
    {
      return "$e";
    }
  }

//  --------------------------    Google    --------------------------------------------

  Future<UserCredential> googleSignIn() async {

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


//  --------------------------    SignOut   --------------------------------------------

  void accountLogOut()
  async {
    await auth.signOut();
    GoogleSignIn().signOut();
  }

//========================================================================================
// ========================= FireStore ===================================================


  Stream<QuerySnapshot<Map<String, dynamic>>> readProductsFromFireStore(String category)
  {
    String tempCategory = category;
    print("tempCategory ===>>>>>>>>>>>>>>>>>>>>   $tempCategory");
    return firestore.collection("ProductList").doc("Categories").collection(tempCategory).snapshots();
  }



}

