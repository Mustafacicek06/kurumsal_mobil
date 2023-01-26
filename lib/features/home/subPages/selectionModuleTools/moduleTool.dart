import 'package:flutter/material.dart';
import 'package:kurumsal_mobil/core/init/network/firebase_auth_service.dart';
import 'package:kurumsal_mobil/features/home/subPages/bilgiTeknolojileri/bilgiTeknolojileriIslemSecimScreen.dart';

moduleTool(IconData moduleIcon, String moduleName, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {
        if (moduleName == "Bilgi Teknolojileri") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => btIslemSecim()));
        } else if (moduleName == "Çıkış") {
          final result = FirebaseAuthService().signOut();
          if (result != null) {
            Navigator.pushNamedAndRemoveUntil(
                context, "/login", (route) => false);
          }
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.33,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.red,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Icon(
                  moduleIcon,
                  color: Colors.white,
                ),
              ),
              Expanded(
                flex: 2,
                child: Title(
                    color: Colors.white,
                    child: Text(
                      moduleName,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Colors.white,
                          ),
                    )),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
