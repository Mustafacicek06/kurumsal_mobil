import 'package:flutter/material.dart';
import 'package:kurumsal_mobil/features/home/subPages/bottomAppBarTools.dart';

class ytsScreen extends StatefulWidget {
  const ytsScreen({Key? key}) : super(key: key);

  @override
  _ytsScreenState createState() => _ytsScreenState();
}

class _ytsScreenState extends State<ytsScreen> {
  bool isCheckedVeriTabani = false;
  bool isCheckedSunucu = false;
  bool isCheckedTablo = false;
  bool isCheckedOkuma = false;
  bool isCheckedYazma = false;
  bool isCheckedDegistirme = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

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
      body: Column(
        children: [
          Text(
            "Yeni Erişim Talebi :",
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: Colors.black,
                ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Talep Tarihi",
                    labelStyle:
                        Theme.of(context).textTheme.subtitle2?.copyWith()),
                keyboardType: TextInputType.datetime,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Text("Erişim Tipi"),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: isCheckedVeriTabani,
                              onChanged: (bool? value) {
                                setState(() {
                                  isCheckedVeriTabani = value!;
                                });
                              },
                            ),
                            Text("Veri Tabanı"),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: isCheckedSunucu,
                              onChanged: (bool? value) {
                                setState(() {
                                  isCheckedSunucu = value!;
                                });
                              },
                            ),
                            Text("Sunucu"),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: isCheckedTablo,
                              onChanged: (bool? value) {
                                setState(() {
                                  isCheckedTablo = value!;
                                });
                              },
                            ),
                            Text("silme"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Text("Erişim Şekli"),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: isCheckedOkuma,
                              onChanged: (bool? value) {
                                setState(() {
                                  isCheckedOkuma = value!;
                                });
                              },
                            ),
                            Text("Okuma"),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: isCheckedYazma,
                              onChanged: (bool? value) {
                                setState(() {
                                  isCheckedYazma = value!;
                                });
                              },
                            ),
                            Text("Yazma"),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: isCheckedDegistirme,
                              onChanged: (bool? value) {
                                setState(() {
                                  isCheckedDegistirme = value!;
                                });
                              },
                            ),
                            Text("Değiştirme"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Erişilecek Sistem Adı",
                    labelStyle:
                        Theme.of(context).textTheme.subtitle2?.copyWith()),
                keyboardType: TextInputType.datetime,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Açıklama(Talep Sebeini Detaylandırınız)",
                    labelStyle:
                        Theme.of(context).textTheme.subtitle2?.copyWith()),
                keyboardType: TextInputType.datetime,
              ),
            ),
          ),
          Expanded(
              child: ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //    context, MaterialPageRoute(builder: ((context) => deneme())));
            },
            child: SizedBox(
                width: en * 0.65,
                child: Text(
                  "Gönder",
                  textAlign: TextAlign.center,
                )),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
          ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomAppBar(context),
    );
  }
}
