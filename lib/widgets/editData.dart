import 'dart:ui';

import 'package:crud_api/models/kontakModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../api/api.dart';
import '../views/home.dart';

class EditData extends StatefulWidget {
  final String nama;
  final String noHp;
  final String email;
  final int id;

  EditData({Key key, this.nama, this.noHp, this.email, this.id})
      : super(key: key);

  @override
  _EditDataState createState() => _EditDataState(nama, noHp, email, id);
}

class _EditDataState extends State<EditData> {
  final String nama;
  final String noHp;
  final String email;
  final int id;
  _EditDataState(this.nama, this.noHp, this.email, this.id);

  final formKey = GlobalKey<FormState>();
  bool vnama = false;
  bool vnoHp = false;
  bool vemail = false;

  editEvent(BuildContext context) {
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
              KontakApi().ubahData(tnama.text, tnoHp.text, temail.text, id);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            }
          }
        }
      }
    });
  }

  var tnama = TextEditingController();
  var tnoHp = TextEditingController();
  var temail = TextEditingController();

  setData() {
    tnama.text = nama;
    tnoHp.text = noHp;
    temail.text = email;
  }

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
    setData();
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
                                Text('Ubah Data',
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
                                  maxLength: 12,
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
                            onPressed: () => {editEvent(context)},
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
