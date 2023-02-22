import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<String> cars = [
    'ottava',
    'malibu',
  ];

  List<Widget> func() {
    List<Widget> sana = [];
    for (int a = 0; a < cars.length; a++) {
      sana.add(ListTile(
        title: Text(cars[a]),
        leading: Text('${a+1}'),

        subtitle: Text(
          'subtitle',
          style: TextStyle(fontSize: 10.5),
        ),
        trailing: TextButton(
            onPressed: () {
              setState(() {
                cars.removeAt(a);
              });
            },
            child: Icon(Icons.delete)),
      ));
    }
    return sana;
  }

  TextEditingController controller1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller1,
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if(controller1.text!=''){
                  cars.add(controller1.text);
                  controller1.text = '';

                  }
                });
              },
              child: Text('Add'),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView(
                children: func(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
void main() {
  runApp(MyWidget());
}