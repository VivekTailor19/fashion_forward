import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(alignment: Alignment.center,
      height: 100.h,
      child: Text("NotificationScreen"),
    );
  }
}
