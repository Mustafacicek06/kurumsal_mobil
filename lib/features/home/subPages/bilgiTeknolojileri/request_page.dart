import 'package:flutter/material.dart';
import 'package:kurumsal_mobil/core/init/model/it_request.dart';
import 'package:kurumsal_mobil/core/init/network/firestore_db_service.dart';

class RequestPage extends StatefulWidget {
  RequestPage({Key? key}) : super(key: key);

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  FireStoreDBService _fireStoreDBService = FireStoreDBService();

  ItRequest? itRequest;

  @override
  void initState() {
    getITRequest();
    super.initState();
  }

  getITRequest() async {
    itRequest =
        await _fireStoreDBService.getITRequest("HBbqfC9uQaYIIiAHXFHea56LzOH3");

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Talepler",
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: ListTile(
                title: Text("Talep No : ${itRequest?.systemName}"),
                subtitle: Text("Description : ${itRequest?.description}"),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
