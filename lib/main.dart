import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swiftdynamicstest/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController todoname = TextEditingController();
  final _formKeytodo = GlobalKey<FormState>();
  TextEditingController todoname2 = TextEditingController();
  final _formKeytodo2 = GlobalKey<FormState>();

  List<String> arrtodo = [];
  static int _len = 10;
  List<bool>? isChecked = List.generate(_len, (index) => false);
  String _getTitle() =>
      "Checkbox Demo : Checked = ${isChecked!.where((check) => check == true).length}, Unchecked = ${isChecked!.where((check) => check == false).length}";
  String _title = "Checkbox Demo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarmenu(context, 'To Do List'),
      body: arrtodo.length > 0
          ? ListView.builder(
              itemCount: arrtodo.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          arrtodo[index],
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Checkbox(
                          onChanged: (checked) {
                            setState(
                              () {
                                isChecked![index] = checked!;
                                _title = _getTitle();
                              },
                            );
                          },
                          value: isChecked![index]),
                      IconButton(
                          onPressed: () {
                            _alertboxforedit(arrtodo[index], index);
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            arrtodo.remove(arrtodo[index]);
                            setState(() {
                              arrtodo;
                            });
                          },
                          icon: Icon(Icons.delete)),
                    ],
                  ),
                );

                // ListTile(
                //   title: Text(arrtodo[index]),
                //   trailing: Checkbox(
                //       onChanged: (checked) {
                //         setState(
                //           () {
                //             isChecked![index] = checked!;
                //             _title = _getTitle();
                //           },
                //         );
                //       },
                //       value: isChecked![index]),
                // );
              },
            )
          : Center(
              child: Text('ไม่มีข้อมูล'),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _alertboxforadd();
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget form1() {
    return Form(
      key: _formKeytodo,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width * 0.4,
              child: TextFormField(
                controller: todoname,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == '')
                    return 'กรุณากรอกข้อมูล';
                  else
                    return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget form2(String? old) {
    return Form(
      key: _formKeytodo2,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width * 0.4,
              child: TextFormField(
                controller: todoname2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // hintText: "Hint here",
                ),
                validator: (value) {
                  if (value == '')
                    return 'กรุณากรอกข้อมูล';
                  else
                    return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _alertboxforadd() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('เพิ่มข้อมูล'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[form1()],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ปิด'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('เพิ่ม'),
              onPressed: () {
                if (_formKeytodo.currentState!.validate()) {
                  arrtodo.add(todoname.text);
                  setState(() {
                    // arrtodo.sort((a, b) => a.compareTo(b));
                    arrtodo;
                    todoname.clear();
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _alertboxforedit(String old, int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('แก้ไขข้อมูล'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[form2(old)],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ยกเลิก'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('แก้ไข'),
              onPressed: () {
                if (_formKeytodo2.currentState!.validate()) {
                  arrtodo[arrtodo.indexWhere(
                      (element) => element == arrtodo[index])] = todoname2.text;

                  print(arrtodo);
                  setState(() {
                    arrtodo;
                    todoname2.clear();
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
