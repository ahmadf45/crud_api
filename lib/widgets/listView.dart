import 'package:crud_api/widgets/deleteData.dart';
import 'package:flutter/material.dart';
import '../models/kontakModel.dart';
import '../widgets/editData.dart';
import '../api/api.dart';

class ListKontak extends StatefulWidget {
  List<Kontak> kontaks;
  ListKontak({Key key, this.kontaks}) : super(key: key);
  @override
  _ListKontakState createState() => _ListKontakState(kontaks);
}

class _ListKontakState extends State<ListKontak> {
  List<Kontak> kontaks;
  _ListKontakState(this.kontaks);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: kontaks.length,
        itemBuilder: (context, index) {
          return Center(
            child: Card(
              color: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              elevation: 5,
              margin: EdgeInsets.only(bottom: 20, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.all(20),
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(kontaks[index].nama,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white70)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(kontaks[index].noHp,
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white70)),
                              Text(kontaks[index].email,
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white70)),
                            ],
                          ),
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.white70),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return EditData(
                                      nama: kontaks[index].nama,
                                      noHp: kontaks[index].noHp,
                                      email: kontaks[index].email,
                                      id: kontaks[index].id);
                                });
                          },
                          iconSize: 30,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.reddd,
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return DeleteData(
                                      nama: kontaks[index].nama,
                                      noHp: kontaks[index].noHp,
                                      email: kontaks[index].email,
                                      id: kontaks[index].id);
                                });
                          },
                          iconSize: 30,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
