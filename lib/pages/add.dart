import 'package:flutter/material.dart';
import 'package:my_app4/pages/analysis.dart';
import 'package:my_app4/pages/calendar.dart';
import 'package:my_app4/pages/home.dart';
import 'package:my_app4/pages/setting.dart';



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_app4/firebase_options.dart';

const List<String> list = <String>["Food", 'Clothing', 'Housing','Accommodation', 'Transportation','Education','Recreation'];








class AddTaskAlertDialogState extends StatelessWidget {

  final TextEditingController taskMoneyController = TextEditingController();
  final TextEditingController taskDescController = TextEditingController();



 
  Future<void> uploadingData(_money,_desc) async {
    await FirebaseFirestore.instance.collection("Data").add({
      'Money':_money,
      'Desc': _desc,
    });
    print("金額 : $_money");
    print("描述 : $_desc");

  }




  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AlertDialog(
      scrollable: true,
      title: const Text(
        '新增記帳',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.brown),
      ),
      content: SizedBox(
        height: height * 0.35,
        width: width,
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: taskMoneyController,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintText: '金額',
                  hintStyle: const TextStyle(fontSize: 14),
                  icon: const Icon(Icons.monetization_on, color: Colors.brown),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: taskDescController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintText: '描述',
                  hintStyle: const TextStyle(fontSize: 14),
                  icon: const Icon(Icons.inventory_rounded, color: Colors.brown),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: const <Widget>[
                  Icon(Icons.label, color: Colors.brown),
                  SizedBox(width: 15.0),
                  DropdownButtonExample(),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,
          ),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final _money = taskMoneyController.text;
            final _desc = taskDescController.text;
          
            uploadingData(_money, _desc);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}


class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}











































// class Add extends StatelessWidget{
//   @override
//   //final
//   TextEditingController _moneyController = new TextEditingController();
//   String? qq;
//   int? money;

//   @override
//   void dispose() {
//     _moneyController.dispose();    // 釋放控制器
//   }
//   void submit(){
//     print("金錢： ${_moneyController.text} ");
//     money = int.parse(_moneyController.text.toString());
//   }

//   Widget build(BuildContext context){
//     return Center(
//       child: Column(
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.all(15),
//             child: TextField(
//               controller: _moneyController,
              
//               decoration: InputDecoration(
//                 labelText: '使用金額',
//                 hintText: '輸入金額',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.monetization_on)
//               ),
              
//             ),
//           ),
          

//           TextButton(onPressed: submit, 
//           child: Text( "送出" ,style: TextStyle(color: Colors.white),),style: TextButton.styleFrom(backgroundColor: Colors.blue,),
//           ),
//           MaterialButton(onPressed: submit,
//           child: Text( "送出" ,style: TextStyle(color: Colors.black),),
//           )

          
//         ],
        
//       ),
      
//     );
//   }
// }

