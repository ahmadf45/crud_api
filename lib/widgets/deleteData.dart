import 'dart:ui';

import 'package:flutter/material.dart';
import '../api/api.dart';
import '../views/home.dart';

class DeleteData extends StatefulWidget {
  final String nama;
  final String noHp;
  final String email;
  final int id;

  DeleteData({Key key, this.nama, this.noHp, this.email, this.id})
      : super(key: key);

  @override
  _DeleteDataState createState() => _DeleteDataState(nama, noHp, email, id);
}

class _DeleteDataState extends State<DeleteData> {
  final String nama;
  final String noHp;
  final String email;
  final int id;
  _DeleteDataState(this.nama, this.noHp, this.email, this.id);

  deleteEvent(BuildContext context) {
    KontakApi().hapusData(id);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Container(
                margin: EdgeInsets.fromLTRB(30, 15, 30, 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Hapus?',
                        style: TextStyle(color: Colors.white70, fontSize: 22)),
                    Column(
                      children: [
                        Text(nama,
                            style:
                                TextStyle(color: Colors.white70, fontSize: 22)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(noHp,
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 16)),
                            Text(email,
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 16)),
                          ],
                        ),
                      ],
                    ),
                    Container(
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
                          color: Colors.reddd,
                          child: Text('Okay'),
                          onPressed: () => {deleteEvent(context)},
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
