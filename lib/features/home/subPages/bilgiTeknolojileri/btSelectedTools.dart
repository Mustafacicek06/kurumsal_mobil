import 'package:flutter/material.dart';
import 'package:kurumsal_mobil/features/home/subPages/bilgiTeknolojileri/bilgiGuvenligiSurecleriScreen.dart';

Widget btScreenSelected(IconData icon, String name, double en, double yukseklik,
    BuildContext context) {
  return InkWell(
    onTap: () {
      if (name == "Bilgi Güvenliği Süreçleri") {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => bGSScreen())));
      }
    },
    child: Container(
      height: yukseklik / 7,
      width: en * 0.54,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.red),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
