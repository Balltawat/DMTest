import 'package:flutter/material.dart';
import 'package:swiftdynamicstest/widgets.dart';

class DataStorage extends StatefulWidget {
  const DataStorage({Key? key}) : super(key: key);

  @override
  _DataStorageState createState() => _DataStorageState();
}

class _DataStorageState extends State<DataStorage> {
  TextEditingController name = TextEditingController();
  final _formKeyM = GlobalKey<FormState>();
  List<String> arrname = [];
  Widget form1() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("ชื่อ - นามสกุล : "),
          Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width * 0.4,
            child: TextFormField(
              controller: name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                List<String> arr2 = arrname;
                arr2 = arr2.map((arr2) => arr2.toUpperCase()).toList();
                if (arrname.contains(value) ||
                    arr2.contains(value!.toUpperCase())) {
                  return 'ข้อมูลซ้ำ';
                } else if (value == '') {
                  return 'กรุณากรอกข้อมูล';
                } else {
                  return null;
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarmenu(context, 'Data Storage'),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Form(
          key: _formKeyM,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              form1(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKeyM.currentState!.validate()) {
                      // savedata(_dropDownValue.toString(), money.text, '0.0');
                      arrname.add(name.text);
                      setState(() {
                        arrname.sort((a, b) => a.compareTo(b));
                        name.clear();
                      });
                    }
                  },
                  child: Text('เพิ่ม'),
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: arrname.length > 0
                      ? ListView(
                          children:
                              new List.generate(arrname.length, (int index) {
                            return new ListTile(
                              title: new Text(arrname[index]),
                              onTap: () {
                                print(index);
                                _alertbox(arrname[index], index);
                              },
                            );
                          }),
                        )
                      : Center(
                          child: Text('ไม่มีข้อมูล'),
                        )
                  // ListView.builder(
                  //   itemCount: arrname.length,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.all(10.0),
                  //           child: Text(
                  //             arrname[index],
                  //           ),
                  //         ),
                  //         // listRow(index),
                  //       ],
                  //     );
                  //   },
                  // ),
                  ),
              // Center(
              //   child: FutureBuilder(
              //     future: _getDB(),
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData) {
              //         print(snapshot.data);
              //         return ItemDB(
              //           list: [snapshot.data],
              //         );
              //       } else if (snapshot.hasError) {
              //         return Text('${snapshot.error}');
              //       }
              //       return const CircularProgressIndicator();
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _alertbox(String name, int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('รายละเอียดข้อมูล'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("ชื่อ - นามสกุล : " + name),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'ลบ',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                arrname.remove(arrname[index]);
                setState(() {
                  arrname;
                });
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
            ),
            TextButton(
              child: const Text('ปิด'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
