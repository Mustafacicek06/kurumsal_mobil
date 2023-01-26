import 'package:flutter/material.dart';
import 'package:kurumsal_mobil/features/home/subPages/bilgiTeknolojileri/bilgiTeknolojileriIslemSecimScreen.dart';
import 'package:kurumsal_mobil/features/home/subPages/selectionMouleScreen.dart';
import 'package:kurumsal_mobil/features/login/view/login_view.dart';

BottomAppBar bottomAppBar(BuildContext context) {
  return BottomAppBar(
    color: Colors.transparent,
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => LoginPage())));
              },
              icon: Icon(Icons.home_filled)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => selectionModuleScreen())));
              },
              icon: Icon(Icons.menu)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => btIslemSecim())));
              },
              icon: Icon(Icons.person))
        ],
      ),
    ),
  );
}
