import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurumsal_mobil/core/components/dialog/platform_responsive_alert_dialog.dart';
import 'package:kurumsal_mobil/core/init/model/it_request.dart';
import 'package:kurumsal_mobil/core/init/model/user_model.dart';
import 'package:kurumsal_mobil/core/init/network/firebase_auth_service.dart';
import 'package:kurumsal_mobil/core/init/network/firestore_db_service.dart';
import 'package:kurumsal_mobil/features/home/subPages/bottomAppBarTools.dart';

class ITManagerConfirmPage extends StatefulWidget {
  const ITManagerConfirmPage({Key? key}) : super(key: key);

  @override
  _ITManagerConfirmPageState createState() => _ITManagerConfirmPageState();
}

class _ITManagerConfirmPageState extends State<ITManagerConfirmPage> {
  bool isCheckedVeriTabani = false;
  bool isCheckedSunucu = false;
  bool isCheckedTablo = false;
  bool isCheckedOkuma = false;
  bool isCheckedYazma = false;
  bool isCheckedDegistirme = false;

  TextEditingController _talepNo = TextEditingController();
  TextEditingController _talepOwner = TextEditingController();
  TextEditingController _talepTarihi = TextEditingController();
  TextEditingController _systemName = TextEditingController();
  TextEditingController _description = TextEditingController();

  FireStoreDBService _fireStoreDBService = FireStoreDBService();
  FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

  UserModel? userModel;
  ItRequest? itRequest;

  @override
  void initState() {
    getUserID();
    getITRequest();
    super.initState();
  }

  getITRequest() async {
    itRequest =
        await _fireStoreDBService.getITRequest("HBbqfC9uQaYIIiAHXFHea56LzOH3");
    if (itRequest != null) {
      _talepNo.text = "TALEP001";
      _talepOwner.text = "Mustafa Yasin Çiçek";
      _talepTarihi.text = itRequest?.requestDate ?? "";
      _systemName.text = itRequest!.systemName!;
      _description.text = itRequest!.description!;
      isCheckedVeriTabani = itRequest!.accessType!.dataBase!;
      isCheckedSunucu = itRequest!.accessType!.server!;
      isCheckedTablo = itRequest!.accessType!.table!;
      isCheckedOkuma = itRequest!.accessShape!.read!;
      isCheckedYazma = itRequest!.accessShape!.write!;
      isCheckedDegistirme = itRequest!.accessShape!.change!;
    } else {
      debugPrint("itRequest null");
    }

    setState(() {});
  }

  getUserID() async {
    userModel = await _firebaseAuthService.currentUser();
    setState(() {});
  }

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
        title: Text(
          "BT Yönetici Onay",
          style: Theme.of(context).textTheme.headline5?.copyWith(
                color: Colors.black,
              ),
        ),
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
      body: SingleChildScrollView(
        child: Container(
          height: Get.height * 0.75,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Talep No",
                      labelStyle:
                          Theme.of(context).textTheme.subtitle2?.copyWith()),
                  controller: _talepNo,
                  keyboardType: TextInputType.datetime,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Talep Sahibi",
                        labelStyle:
                            Theme.of(context).textTheme.subtitle2?.copyWith()),
                    controller: _talepOwner,
                    keyboardType: TextInputType.datetime,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Talep Tarihi",
                        labelStyle:
                            Theme.of(context).textTheme.subtitle2?.copyWith()),
                    controller: _talepTarihi,
                    keyboardType: TextInputType.datetime,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Expanded(child: Text("Erişim Tipi")),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    checkColor: Colors.white,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            getColor),
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
                                        MaterialStateProperty.resolveWith(
                                            getColor),
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
                                        MaterialStateProperty.resolveWith(
                                            getColor),
                                    value: isCheckedTablo,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isCheckedTablo = value!;
                                      });
                                    },
                                  ),
                                  Text("Tablo"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Expanded(child: Text("Erişim Şekli")),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      fillColor:
                                          MaterialStateProperty.resolveWith(
                                              getColor),
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
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      fillColor:
                                          MaterialStateProperty.resolveWith(
                                              getColor),
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
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      fillColor:
                                          MaterialStateProperty.resolveWith(
                                              getColor),
                                      value: isCheckedDegistirme,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isCheckedDegistirme = value!;
                                        });
                                      },
                                    ),
                                    Text("Değişme"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Erişilecek Sistem Adı",
                        labelStyle:
                            Theme.of(context).textTheme.subtitle2?.copyWith()),
                    controller: _systemName,
                    keyboardType: TextInputType.datetime,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Açıklama(Talep Sebeini Detaylandırınız)",
                        labelStyle:
                            Theme.of(context).textTheme.subtitle2?.copyWith()),
                    controller: _description,
                    keyboardType: TextInputType.datetime,
                  ),
                ),
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: saveButtonOnPressed,
                    child: SizedBox(
                        width: en * 0.35,
                        child: Text(
                          "Onayla",
                          textAlign: TextAlign.center,
                        )),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  ElevatedButton(
                    onPressed: saveButtonOnPressed,
                    child: SizedBox(
                        width: en * 0.35,
                        child: Text(
                          "Reddet",
                          textAlign: TextAlign.center,
                        )),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomAppBar(context),
    );
  }

  void saveButtonOnPressed() async {
    final result = await _fireStoreDBService.saveITRequest(ItRequest(
      userID: userModel?.userID ?? "",
      accessShape: AccessShape(
          change: isCheckedDegistirme,
          read: isCheckedOkuma,
          write: isCheckedYazma),
      accessType: AccessType(
          dataBase: isCheckedVeriTabani,
          server: isCheckedSunucu,
          table: isCheckedTablo),
      systemName: _systemName.text,
      description: _description.text,
    ));

    if (result) {
      PlatformResponsiveAlertDialog(
        anaButonYazisi: "Tamam",
        baslik: "İsteğiniz Başarıyla kaydedildi",
        icerik: "Yöneticinizin onay verilmesi bekleniyor..",
      ).myShowMethod(context);
    } else {
      PlatformResponsiveAlertDialog(
        anaButonYazisi: "Tamam",
        baslik: "Kaydetme Başarısız",
        icerik: "İsteğiniz kaydedilemedi. Lütfen daha sonra tekrar deneyiniz.",
      ).myShowMethod(context);
    }
  }
}
