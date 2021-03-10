import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../views/home.dart';
import '../api/api.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final formKey = GlobalKey<FormState>();
  bool vnama = false;
  bool vnoHp = false;
  bool vemail = false;

  addEvent(BuildContext context) {
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => Home()));
    setState(() {
      if (tnama.text.isEmpty) {
        vnama = true;
      } else {
        vnama = false;
        if (tnoHp.text.isEmpty) {
          vnoHp = true;
        } else {
          vnoHp = false;
          if (temail.text.isEmpty) {
            vemail = true;
          } else {
            vemail = false;
            if (tnama.text.isNotEmpty ||
                tnoHp.text.isNotEmpty ||
                temail.text.isNotEmpty) {
              KontakApi().buatData(tnama.text, tnoHp.text, temail.text);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            }
          }
        }
      }

      //tnama.text.isEmpty ? vnama = true : vnama = false;
    });
  }

  // TextEditingController tnama = TextEditingController()..text = "AKU";
  var tnama = TextEditingController();
  var tnoHp = TextEditingController();
  var temail = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    tnama.dispose();
    tnoHp.dispose();
    temail.dispose();
    super.dispose();
  }

  @override
  void initState() {
    tnama.addListener(() {
      //tnama.text = "Aku";
      setState(() {});
    });
    tnoHp.addListener(() {
      setState(() {});
    });
    temail.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Dialog(
          backgroundColor: Colors.white.withOpacity(0.2),
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(30, 15, 30, 15),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Text('Tambah Data',
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 22)),
                                SizedBox(
                                  height: 30,
                                ),
                                TextField(
                                  cursorColor: Colors.white70,
                                  controller: tnama,
                                  textInputAction: TextInputAction.send,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 18),
                                  decoration: InputDecoration(
                                    errorText:
                                        vnama ? 'Value Can\'t Be Empty' : null,
                                    fillColor: Colors.white.withOpacity(0.2),
                                    filled: true,
                                    labelText: "Nama",
                                    labelStyle: TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.reddd),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  cursorColor: Colors.white70,
                                  controller: temail,
                                  textInputAction: TextInputAction.send,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 18),
                                  decoration: InputDecoration(
                                    errorText:
                                        vemail ? 'Value Can\'t Be Empty' : null,
                                    fillColor: Colors.white.withOpacity(0.2),
                                    filled: true,
                                    labelText: "Email",
                                    labelStyle: TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.reddd),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  cursorColor: Colors.white70,
                                  controller: tnoHp,
                                  textInputAction: TextInputAction.send,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 18),
                                  decoration: InputDecoration(
                                    errorText:
                                        vnoHp ? 'Value Can\'t Be Empty' : null,
                                    fillColor: Colors.white.withOpacity(0.2),
                                    filled: true,
                                    labelText: "No HP",
                                    labelStyle: TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.reddd),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.7 * 0.15,
                  child: SizedBox.expand(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RaisedButton(
                            color: Colors.white70,
                            child: Text('Cencel'),
                            onPressed: () => {Navigator.of(context).pop()},
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          RaisedButton(
                            color: Colors.white70,
                            child: Text('Okay'),
                            onPressed: () => {addEvent(context)},
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
