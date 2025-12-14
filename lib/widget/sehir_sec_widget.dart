import 'package:flutter/material.dart';

class SehirSecWidget extends StatefulWidget {
  const SehirSecWidget({super.key});

  @override
  State<SehirSecWidget> createState() => _SehirSecWidgetState();
}

class _SehirSecWidgetState extends State<SehirSecWidget> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Şehir Seç")),
      body: Form(child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: "Şehir",
                  hintText: "Şehir Seçin",
                  border: OutlineInputBorder()
                ),
              ),
            ),
          ),
          IconButton(onPressed: (){
            Navigator.pop(context, _textController.text);
          }, icon: Icon(Icons.search))
        ],
      )),
    );
  }
}
