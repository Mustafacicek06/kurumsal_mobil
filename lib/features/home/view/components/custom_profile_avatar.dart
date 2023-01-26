import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kurumsal_mobil/core/init/theme/app_color_service.dart';

class CustomProfileAvatar extends StatelessWidget {
  CustomProfileAvatar({Key? key, required this.url}) : super(key: key);
  String url;

  @override
  Widget build(BuildContext context) {
    return CircularProfileAvatar(
      url,
      radius: 25.r,
      cacheImage: true,
      imageFit: BoxFit.cover,
      placeHolder: (context, url) => const Center(
        child: CircularProgressIndicator(
          color: AppColorService.red,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: AppColorService.red,
      ),
    );
  }
}
