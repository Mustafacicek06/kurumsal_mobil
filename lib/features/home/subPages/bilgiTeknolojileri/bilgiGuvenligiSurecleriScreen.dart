import 'package:flutter/material.dart';
import 'package:kurumsal_mobil/features/home/subPages/bgsSurecleriTool/bgsSurecleriSelectedTool.dart';
import 'package:kurumsal_mobil/features/home/subPages/bilgiTeknolojileri/btSelectedTools.dart';
import 'package:kurumsal_mobil/features/home/subPages/bottomAppBarTools.dart';

class bGSScreen extends StatefulWidget {
  const bGSScreen({Key? key}) : super(key: key);

  @override
  _bGSScreenState createState() => _bGSScreenState();
}

class _bGSScreenState extends State<bGSScreen> {
  @override
  Widget build(BuildContext context) {
    var yukseklik = MediaQuery.of(context).size.height;
    var en = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Bilgi Teknolojileri :",
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Colors.black),
        ),
      ),
      body: Center(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    btScreenSelected(Icons.arrow_downward_outlined,
                        "Bilgi Güvenliği Süreçleri :", en, yukseklik, context),
                    bGSScreenSelected(Icons.arrow_forward, "Yeni Erişim Talebi",
                        en, yukseklik, context),
                    bGSScreenSelected(Icons.arrow_forward, "BT Yönetici Onay",
                        en, yukseklik, context),
                    bGSScreenSelected(Icons.arrow_forward, "IT Yönetici Onay",
                        en, yukseklik, context),
                    bGSScreenSelected(Icons.arrow_forward, "Talepler", en,
                        yukseklik, context),
                  ]))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomAppBar(context),
    );
  }
}
