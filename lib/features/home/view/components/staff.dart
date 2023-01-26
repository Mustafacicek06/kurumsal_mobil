import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StaffName extends StatelessWidget {
  const StaffName({super.key, required this.staffName});
  final String staffName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          staffName,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: 15.0.sp,
              ),
        ),
        Text(
          ' Hoşgeldin!',
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 15.0.sp,
              ),
        ),
      ],
    );
  }
}

class StaffDeparment extends StatelessWidget {
  const StaffDeparment({super.key, required this.staffDepartment});
  final String staffDepartment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          staffDepartment,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: 15.0,
              ),
        ),
      ],
    );
  }
}

class StaffPicture extends StatelessWidget {
  const StaffPicture(
      {super.key, required this.picAddress, required this.onPress});
  final String picAddress;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: CircleAvatar(
        minRadius: 50.0,
        maxRadius: 50.0,
        // backgroundColor: primary,
        backgroundImage: AssetImage(picAddress),
      ),
    );
  }
}
