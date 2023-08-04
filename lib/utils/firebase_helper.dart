import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_forward/model/productModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseHelper
{
  static FirebaseHelper firebaseHelper = FirebaseHelper._();
  FirebaseHelper._();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? uniqueId ;

//==========================================================================
// =====================   Login  =========================================
//==========================================================================

  bool check_user()
  {
    User? user=auth.currentUser;
    return user!=null;
  }

  Map<String, String?> readUser()
  {
    User? user = auth.currentUser;

    return {
      'email':user!.email,
      'name':user.displayName,
      'photo':user.photoURL,
      'uniqueId':user.uid

    };

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


//========================================================================================
// ===============================  Cart ===================================================

  void addToCart(ProductModel model)
  {
    print("unique ID $uniqueId ===========");
    firestore.collection("ConsumerDatabase").doc(uniqueId).collection("Cart").add(
        {
          "pname": model.name,
          "pprice": model.price,
          "pdesc":model.desc,
          "pimg":model.img,
          "pcategory":model.category,
          "pfav":model.fav,
          "pqty":model.qty
        }
    );

  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readCartItems()
  {
    return firestore.collection("ConsumerDatabase").doc(uniqueId).collection("Cart").snapshots();
  }

  void updateMyCart(ProductModel model)
  {

    firestore.collection("ConsumerDatabase").doc(uniqueId).collection("Cart").doc(model.uId).set(
       {
          "pname": model.name,
          "pprice": model.price,
          "pdesc":model.desc,
          "pimg":model.img,
          "pcategory":model.category,
          "pfav":model.fav,
          "pqty":model.qty,
       });

  }

}

