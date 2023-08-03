import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../model/productModel.dart';
import '../../../../utils/firebase_helper.dart';
import '../../productController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ProductController p_control = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 1.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  CircleAvatar(
                    radius: 2.5.h,
                    backgroundImage:
                        NetworkImage("https://miro.medium.com/v2/resize:fit:512/1*DubdXbUR4KcrzmAg8wyGXA.png"),
                  )
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 5.h,
                    width: 72.w,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.5.h),
                        color: Color(0xfff3f4f6)),
                    child: TextField(
                      cursorColor: Colors.black12,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search_rounded, size: 25.sp),
                        prefixIconColor: Colors.black45,
                        hintText: "Search...",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 12.sp),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 2.5.h,
                    child: Icon(
                      Icons.filter_list_alt,
                      color: Colors.white,
                    ),
                  )
                ],
              ),

              Padding(padding: EdgeInsets.symmetric(vertical: 1.h),
                child: SizedBox(height: 5.h,
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (OverscrollIndicatorNotification overscroll) {
                      overscroll.disallowIndicator();
                      return true;
                    },
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: p_control.categoryList.length,
                        itemBuilder: (context, index) {

                            return GestureDetector(
                              onTap: () {
                                p_control.filterCategory.value = p_control.categoryList[index];
                                p_control.selFilterIndexCategory.value = index;
                                print("${p_control.selFilterIndexCategory.value} ================== index");
                                print("${p_control.filterCategory.value} ================== category");
                              },
                              child: Obx(
                                () =>  Container(
                                  height: 5.h,width: 25.w,
                                  margin: EdgeInsets.symmetric(horizontal: 2.5.w),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(2.5.h),
                                      color: p_control.selFilterIndexCategory.value == index? Colors.black : Colors.white,
                                    border: Border.all(color: Colors.black12,width: 0.3)
                                  ),


                                  child: Text("${p_control.categoryList[index]}",style: TextStyle(
                                    fontWeight: p_control.selFilterIndexCategory.value == index? FontWeight.w500 : FontWeight.w300,
                                      color: p_control.selFilterIndexCategory.value == index? Colors.white : Colors.black,),),
                                ),
                              ),
                            );
                        },
                      ),
                  ),

                ),
              ),


            ],
          ),
        ),
        Obx(
          () =>  StreamBuilder(
            stream: FirebaseHelper.firebaseHelper.readProductsFromFireStore(p_control.filterCategory.value),
            builder: (context, snapshot) {
              if(snapshot.hasError)
              {
                Center(child: Text("${snapshot.error}"));
              }

              else if(snapshot.hasData)
              {
                QuerySnapshot querySnapshot = snapshot.data!;
                List<QueryDocumentSnapshot> qdocsList = querySnapshot.docs;

                Map mapDATA = {};
                List<ProductModel> productItems = [];

                for(var temp in qdocsList)
                {
                  mapDATA = temp.data() as Map ;
                  String id = temp.id;
                  String name = mapDATA['pname'];
                  String category = mapDATA['pcategory'];
                  int price = mapDATA['pprice'];
                  bool fav = mapDATA['pfav'];
                  String description = mapDATA['pdesc'];
                  String img = mapDATA['pimg'];
                  ProductModel model = ProductModel(uId: id,category: category,name: name,desc: description,price: price,img: img,fav: fav);
                  productItems.add(model);
                }

                return Expanded(
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (OverscrollIndicatorNotification overscroll) {
                      overscroll.disallowIndicator();
                      return true;
                    },
                    child: GridView.builder(
                      padding: EdgeInsets.only(right: 5.w),
                      itemCount: productItems.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                         mainAxisExtent: 33.h,
                      ),
                      itemBuilder: (context, index) {

                        return GestureDetector(

                          onTap: () {
                            Get.toNamed("/viewProduct",arguments: productItems[index] );
                          },

                          child: Container(
                            height: 33.h,
                            width: 40.w,
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(top: 1.5.h, left: 5.w),
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 22.h,
                                      width: 45.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.w),
                                        color: Color(0xfff3f4f6),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "${productItems[index].img}"),
                                        //    fit: BoxFit.contain
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      "${productItems[index].name}",
                                      style: TextStyle(
                                          fontSize: 12.5.sp, fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 0.5.h),
                                      child: Text("${productItems[index].category}",
                                          style: TextStyle(
                                              fontSize: 10.sp, fontWeight: FontWeight.w300),
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    Text("\$ ${productItems[index].price}",
                                        style: TextStyle(
                                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment(0.9,-0.95),
                                  child: CircleAvatar(
                                    radius: 1.5.h,
                                    backgroundColor: Colors.black,
                                    child: Icon(Icons.favorite_border_rounded,size:16,color: Colors.white,),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );

              }

              return Center(child: CircularProgressIndicator());


             },
          ),
        ),

      ],
    );
  }
}



//      https://cdn-icons-png.flaticon.com/512/5511/5511396.png