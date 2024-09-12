import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var ls = [];
  var txt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: txt,
          onSubmitted: _onSubmittedtxt,
        ),
        ElevatedButton(
          onPressed: _onPressedAdd,
          child: const Text('Add'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: ls.length,
            itemBuilder: _itemBuilderListView,
          ),
        ),
      ],
    );
  }

  void _onPressedAdd() {
    setState(() {
      String text = txt.text;
      if (text.isNotEmpty) {
        ls.insert(0, text);
        txt.clear();
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Please enter a value.")));
      }
    });
  }

  Widget? _itemBuilderListView(BuildContext context, int index) {
    return ListTile(
      title: Text(ls[index]),
    );
  }

  void _onSubmittedtxt(String value) {
    _onPressedAdd();
  }
}
