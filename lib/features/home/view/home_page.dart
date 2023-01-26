// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:kurumsal_mobil/features/home/controller/home_page_controller.dart';
// import 'package:kurumsal_mobil/features/home/view/components/staff.dart';

// class HomeScreen extends GetView<HomePageController> {
//   const HomeScreen({Key? key}) : super(key: key);
//   static String routeName = 'HomeScreen';


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:   GetBuilder<HomePageController>(
//         id: HomePageController.homePageObserveID,
//         builder: (context) {
//           return Column(
//             children: [
//               Container(
//                 color: Colors.white,
//                 //color: gray500,
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height / 4.5,
//                 // sp = screen pixel
//                 padding: EdgeInsets.all(10.sp),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         StaffPicture(
//                             picAddress: 'assets/images/profile_picture.png',
//                             onPress: () {}),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             StaffName(staffName: 'Gökalp Özduman'),
//                             StaffDeparment(
//                               staffDepartment: 'Yazılım Mühendisi',
//                             ),
//                             kHalfSizedBox,
//                           ],
//                         ),
//                         SizedBox(
//                           height: kDefaultPadding / 6,
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   //color: Colors.transparent,
//                   color: chatBackground,
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                       color: white,

//                       /*borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(kDefaultPadding*3),
//                         topRight: Radius.circular(kDefaultPadding*3),
//                       )*/
//                     ),
//                     child: ListView(
//                       physics: BouncingScrollPhysics(),
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             HomeCard(
//                               onPress: () {
//                                 //go to person resource
//                               },
//                               icon: 'assets/icons/human_resource.svg',
//                               title: 'İnsan Kaynakları',
//                             ),
//                             HomeCard(
//                               onPress: () {
//                                 Navigator.pushNamed(context, ITScreen.routeName);
//                               },
//                               icon: 'assets/icons/it.svg',
//                               title: 'Bilgi Teknolojileri',
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             HomeCard(
//                               onPress: () {
//                                 //go to person resource
//                               },
//                               icon: 'assets/icons/insurance.svg',
//                               title: 'Sigorta',
//                             ),
//                             HomeCard(
//                               onPress: () {
//                                 //go to person resource
//                               },
//                               icon: 'assets/icons/law.svg',
//                               title: 'Hukuk',
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             HomeCard(
//                               onPress: () {
//                                 //go to person resource
//                               },
//                               icon: 'assets/icons/purchasing.svg',
//                               title: 'Satın Alma',
//                             ),
//                             HomeCard(
//                               onPress: () {
//                                 //go to person resource
//                               },
//                               icon: 'assets/icons/administrative_affairs.svg',
//                               title: 'İdari İşler',
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             HomeCard(
//                               onPress: () {
//                                 //go to person resource
//                               },
//                               icon: 'assets/icons/acounting.svg',
//                               title: 'Muhasebe',
//                             ),
//                             HomeCard(
//                               onPress: () {
//                                 SystemNavigator.pop();
//                                 //go to person resource
//                               },
//                               icon: 'assets/icons/exit.svg',
//                               title: 'Çıkış',
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         }
//       ),
//     );
//   }
// }

// class HomeCard extends StatelessWidget {
//   const HomeCard(
//       {Key? key,
//       required this.onPress,
//       required this.icon,
//       required this.title})
//       : super(key: key);
//   final VoidCallback onPress;
//   final String icon;
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onPress,
//       child: Container(
//         margin: EdgeInsets.only(top: kDefaultPadding / 2),
//         width: MediaQuery.of(context).size.width / 2.5,
//         height: MediaQuery.of(context).size.height / 6,
//         decoration: BoxDecoration(
//           color: primary,
//           borderRadius: BorderRadius.circular(kDefaultPadding / 2),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SvgPicture.asset(
//               icon,
//               height: 40.0,
//               width: 40.0,
//               color: white,
//             ),
//             Text(
//               title,
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.subtitle1!.copyWith(
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.w500,
//                     color: white,
//                   ),
//             ),
//             SizedBox(
//               height: kDefaultPadding / 3,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
