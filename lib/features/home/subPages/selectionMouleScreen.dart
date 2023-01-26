import 'package:flutter/material.dart';
import 'package:kurumsal_mobil/features/home/subPages/model/selection_module_icon_and_name.dart';
import 'package:kurumsal_mobil/features/home/subPages/selectionModuleTools/listTileTool.dart';
import 'package:kurumsal_mobil/features/home/subPages/selectionModuleTools/moduleTool.dart';

class selectionModuleScreen extends StatefulWidget {
  const selectionModuleScreen({Key? key}) : super(key: key);

  @override
  _selectionModuleScreenState createState() => _selectionModuleScreenState();
}

class _selectionModuleScreenState extends State<selectionModuleScreen> {
  List<moduleData> moduller = [];
  moduleData InsanKaynaklari =
      moduleData(moduleIcon: Icons.person, moduleName: "İnsan Kaynakları");
  moduleData BilgiTeknolojileri = moduleData(
      moduleIcon: Icons.computer_outlined, moduleName: "Bilgi Teknolojileri");
  moduleData Sigorta =
      moduleData(moduleIcon: Icons.event_available, moduleName: "Sigorta");
  moduleData Hukuk =
      moduleData(moduleIcon: Icons.account_balance, moduleName: "Hukuk");
  moduleData SatinAlma =
      moduleData(moduleIcon: Icons.payments, moduleName: "Satın Alma");
  moduleData IdariIsler =
      moduleData(moduleIcon: Icons.stream, moduleName: "İdari İşler");
  moduleData Muhasebe =
      moduleData(moduleIcon: Icons.edit, moduleName: "Muhasebe");
  moduleData Cikis =
      moduleData(moduleIcon: Icons.power_settings_new, moduleName: "Çıkış");

  @override
  Widget build(BuildContext context) {
    var yukseklik = MediaQuery.of(context).size.height;
    var en = MediaQuery.of(context).size.width;

    moduller.add(InsanKaynaklari);
    moduller.add(BilgiTeknolojileri);
    moduller.add(Sigorta);
    moduller.add(Hukuk);
    moduller.add(SatinAlma);
    moduller.add(IdariIsler);
    moduller.add(Muhasebe);
    moduller.add(Cikis);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: yukseklik * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTileTool(),
          ),
          SizedBox(
            height: yukseklik * 0.8,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  mainAxisExtent: yukseklik / 5.5,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return moduleTool(moduller[index].moduleIcon,
                      moduller[index].moduleName, context);
                }),
          ),
        ],
      ),
    );
  }
}
