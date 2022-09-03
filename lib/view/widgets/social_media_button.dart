import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialMediaButton extends StatelessWidget {
  SocialMediaButton({Key? key, required this.icon, required this.label})
      : super(key: key);
  IconData? icon;
  String? label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: const <BoxShadow>[
          BoxShadow(
              color: Colors.grey, blurRadius: 1.0, offset: Offset(0.0, 0.0))
        ],
      ),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(2),
      child: TextButton.icon(
          onPressed: () {},
          icon: Icon(
            icon,
            size: 35,
          ),
          label: Text(
            '$label',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
            ),
          )),
    );
  }
}
