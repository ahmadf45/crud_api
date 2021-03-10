import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../api/api.dart';
import 'package:http/http.dart';
import '../widgets/listView.dart';
import '../widgets/addData.dart';
import '../models/kontakModel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.blueGrey.withOpacity(0.1),
              expandedHeight: 200,
              floating: false,
              pinned: true,
              snap: false,
              elevation: 5,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(top: 20),
                background: Image.asset(
                  'lib/images/bluegrey.png',
                  fit: BoxFit.cover,
                ),
                centerTitle: true,
                // title: Container(
                //   margin: EdgeInsets.only(bottom: 15),
                //   child: Text(
                //     "GIC",
                //     textAlign: TextAlign.center,
                //     style: TextStyle(fontSize: 20, color: Colors.white70),
                //   ),
                // ),
              ),
            )
          ];
        },
        body: Container(
            margin: EdgeInsets.all(1),
            child: FutureBuilder(
                future: KontakApi().fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError)
                    return Center(
                      child: Text("errosdar"),
                    );
                  return snapshot.hasData
                      ? ListKontak(kontaks: snapshot.data)

                      // ? SingleChildScrollView(
                      //     child: DataTable(
                      //         dataRowColor: MaterialStateColor.resolveWith(
                      //             (states) => Colors.blueGrey),
                      //         columns: [
                      //           DataColumn(
                      //             label: Text('Nama'),
                      //           ),
                      //           DataColumn(
                      //             label: Text('No HP'),
                      //           ),
                      //           DataColumn(
                      //             label: Text('Email'),
                      //           ),
                      //         ],
                      //         rows: snapshot.data.map<DataRow>((data) {
                      //           return new DataRow(
                      //             cells: [
                      //               DataCell(Text(data.nama)),
                      //               DataCell(Text(data.noHp)),
                      //               DataCell(Text(data.email)),
                      //             ],
                      //           );
                      //         }).toList()),
                      //   )

                      : Center(child: CircularProgressIndicator());
                })),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddData();
              });
        },
        backgroundColor: Colors.white70,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
