import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(alignment: Alignment.center,
      height: 100.h,
      child: Text("ProfileScreen"),
    );
  }
}
