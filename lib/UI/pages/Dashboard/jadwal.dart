import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Jadwal extends StatefulWidget {
  @override
  _JadwalState createState() => _JadwalState();
}

class _JadwalState extends State<Jadwal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jadwal Pelajaran"),
        backgroundColor: Color(0xffffbfbf),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Jadwal Pelajaran",
              textScaleFactor: 2,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              textDirection: TextDirection.rtl,
              defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
              border: TableBorder.all(width: 2.0, color: Colors.black),
              children: [
                TableRow(children: [
                  Text("Hari", textScaleFactor: 1.5),
                  Text("Jam", textScaleFactor: 1.5),
                  Text("Pelajaran", textScaleFactor: 1.5),
                ]),
                TableRow(children: [
                  Text("Senin", textScaleFactor: 1.5),
                  Text("08.00 - 10.00", textScaleFactor: 1.5),
                  Text("Matematika", textScaleFactor: 1.5),
                ]),
                TableRow(children: [
                  Text("Selasa", textScaleFactor: 1.5),
                  Text("08.00 - 10.00", textScaleFactor: 1.5),
                  Text("Bahasa (Membaca & Menulis)", textScaleFactor: 1.5),
                ]),
                TableRow(children: [
                  Text("Rabu", textScaleFactor: 1.5),
                  Text("08.00 - 10.00", textScaleFactor: 1.5),
                  Text("Olahraga", textScaleFactor: 1.5),
                ]),
                TableRow(children: [
                  Text("Kamis", textScaleFactor: 1.5),
                  Text("08.00 - 10.00", textScaleFactor: 1.5),
                  Text("Agama", textScaleFactor: 1.5),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
