import 'package:flutter/material.dart';
import 'package:kurumsal_mobil/features/home/subPages/bilgiTeknolojileri/it_manager_confirm.dart';
import 'package:kurumsal_mobil/features/home/subPages/bilgiTeknolojileri/request_page.dart';
import 'package:kurumsal_mobil/features/home/subPages/bilgiTeknolojileri/yeni_islem_talebi_screen.dart';

Widget bGSScreenSelected(IconData icon, String name, double en,
    double yukseklik, BuildContext context) {
  return InkWell(
    onTap: () {
      if (name == "Yeni Erişim Talebi") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ytsScreen()));
      } else if (name == "BT Yönetici Onay") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ITManagerConfirmPage()));
      } else if (name == "Talepler") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RequestPage()));
      }
    },
    child: Container(
      height: yukseklik / 9,
      width: en * 0.45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.red),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    ),
  );
}
