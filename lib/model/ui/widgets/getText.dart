import 'package:flutter/material.dart';

Future<String> getText(BuildContext context, String message,
    [String value = ""]) async {
  TextEditingController title = TextEditingController();
  title.text = value;
  await showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheet(
          onClosing: () {},
          builder: (context) => StatefulBuilder(builder: (context, setstate) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(message),
                      TextFormField(
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                        autofocus: true,
                        controller: title,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor),
                        child: const Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.pop(context, title.text);
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).viewInsets.bottom)
                    ],
                  ),
                );
              })));
  print("Aqui chegou");
  return title.text;
}
