// ignore_for_file: must_be_immutable, unused_import, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'database.dart';

class Add extends StatefulWidget {
  Add({Key? key, required this.db}) : super(key: key);
  Database db;
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController nameC = TextEditingController();
  TextEditingController apellidoC = TextEditingController();
  TextEditingController observC = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(100, 105, 200, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(100, 105, 200, 1.0),
        title: const Text("Reservaciones"),
        actions: [
          IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                // widget.db.delete(widget.estadio["id"]);
                // Navigator.pop(context, true);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: inputDecoration("Nombre del cliente"),
                controller: nameC,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: inputDecoration("Apellido"),
                controller: apellidoC,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: inputDecoration("Observaciones"),
                controller: observC,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Colors.transparent,
        child: BottomAppBar(
          color: Colors.transparent,
          child: RaisedButton(
              color: Colors.black,
              onPressed: () {
                widget.db.create("1", nameC.text, apellidoC.text, observC.text);
                Navigator.pop(context, true);
              },
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String labelText) {
    return InputDecoration(
      focusColor: Colors.white,
      labelStyle: const TextStyle(color: Colors.white),
      labelText: labelText,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
      ),
    );
  }
}
