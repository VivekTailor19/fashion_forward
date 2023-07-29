import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(alignment: Alignment.center,
      height: 100.h,
      child: Text("OrderScreen"),
    );
  }
}
