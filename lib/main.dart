import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});
  @override
  State<MyWidget> createState() => _MyWidgetState();
}
class _MyWidgetState extends State<MyWidget> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TextField(
                onSubmitted: ((value) {
                  setState(() {   
                  });
                }),
                controller: _controller,
              ),
            ),),
            SizedBox(height: 20,),
            Expanded(
              flex: 11,
              child: ListView.builder(
              itemCount:_controller.text.length ==0 ? 0:int.parse(_controller.text),
              itemBuilder: ((context, index) {
              return ListTile(
                trailing: IconButton(onPressed: (){
                  setState(() {
                    index.clamp(index, index);
                  });
                }, icon: Icon(Icons.remove_circle_outlined),color: Colors.red,),
                title: Text(index.toString()),); 
            }),),)
          ],
        ),
      ),
    ); 
  }
}
void main() {
  runApp(MyWidget());
}