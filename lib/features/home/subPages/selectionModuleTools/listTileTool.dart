import 'package:flutter/material.dart';
import 'package:kurumsal_mobil/product/constants/assetsPath/assets_path.dart';

ListTileTool() {
  return ListTile(
    title: Text("Mustafa Yasin Çiçek"),
    subtitle: Text("iOS Geliştirici"),
    leading: Image.asset(AssetsPath.alisanLOGO),
    dense: true,
  );
}
