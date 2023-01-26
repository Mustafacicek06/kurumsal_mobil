import 'package:flutter/material.dart';
import 'package:kurumsal_mobil/features/home/subPages/bilgiTeknolojileri/btSelectedTools.dart';
import 'package:kurumsal_mobil/features/home/subPages/bottomAppBarTools.dart';

class btIslemSecim extends StatefulWidget {
  const btIslemSecim({Key? key}) : super(key: key);

  @override
  _btIslemSecimState createState() => _btIslemSecimState();
}

class _btIslemSecimState extends State<btIslemSecim> {
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
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Bilgi Teknolojileri :",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: Colors.black),
              ),
              btScreenSelected(Icons.arrow_forward_ios_outlined,
                  "Bilgi Güvenliği Süreçleri", en, yukseklik, context),
              btScreenSelected(Icons.arrow_forward_ios_outlined,
                  "Hizmet Yönetimi", en, yukseklik, context),
              btScreenSelected(Icons.arrow_forward_ios_outlined,
                  "KVKK Süreçleri", en, yukseklik, context),
              btScreenSelected(Icons.arrow_forward_ios_outlined,
                  " Proje Yönetimi", en, yukseklik, context),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomAppBar(context),
    );
  }
}
