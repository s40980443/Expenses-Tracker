

import 'package:flutter/material.dart';

import 'pie/chart_container.dart';
import 'pie/pie_chart.dart';
import 'pie/pie_chart_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Analysis extends StatelessWidget{
  @override

  Future<void> gettingData() async {
    await FirebaseFirestore.instance.collection("test2").get().then((event) {
    for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });
  }


  Widget build(BuildContext context){
    return Center(
      child: ListDetail(),
    );
      // body: Container(
      //   child: ListDetail(),

        // child: ListView(
        //   padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
        //   children: <Widget>[
        //     ChartContainer(
        //       title: 'title', 
        //       color: Color(0xff24b273),
        //       chart: PieChartContent()
              
        //       )
              
        //   ],
          
        //   ),
          
      
      
    
  }
}



class ListDetail extends StatelessWidget{

  @override
    Future<void> gettingData() async {
    await FirebaseFirestore.instance.collection("test2").get().then((event) {
    for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore
                .instance
                .collection('Data') 
                .get(), 
        builder: (_, snapshot) {
          if (snapshot.hasError) return Text('Error = ${snapshot.error}');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          return ListView(

              children: snapshot.data!.docs.map((DocumentSnapshot document) {Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            

          return Container(
            height: 100,
            margin: const EdgeInsets.all(15),
            child: ListTile (
                title: Text(data['Money']),
                subtitle: Text(data['Desc']),
                isThreeLine: true,
                
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5,
                    offset: Offset(0, 5)
                  )
                ]
              ),
          );

            
            }
            
            ).toList()
            
          );


          // return ListView(
          //     children: snapshot.data!.docs.map((DocumentSnapshot document) {
          //   Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            

          
          //   return ListTile(
          //     title: Text(data['Money']), 
          //     subtitle: Text(data['Desc']), 
          //     contentPadding: EdgeInsets.symmetric(horizontal: 20.0),

          //   );
            
          // }
          // ).toList());




        },
      )),
    );
  }

  

}













// class ListDetail extends StatelessWidget{
//   @override
//   // final fireStore = FirebaseFirestore.instance;
//   Widget build(BuildContext context) {
//     return Container(
      
//       margin: const EdgeInsets.all(10.0),
//       child: StreamBuilder<QuerySnapshot>(
//         // stream: FirebaseFirestore.instance.collection('test2').snapshots(),
//         builder: (context, snapshot){
//           return ListView(
//             children: snapshot.data!.docs.map((DocumentSnapshot document) {
//               Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//               return Container(
//                 height: 100,
//                 margin: const EdgeInsets.only(bottom: 15.0),
//                 child: ListTile (
//                   title: Text(data['Money']),
//                   subtitle: Text(data['Desc']),
//                   isThreeLine: true,
//                 ),
//               );
//             }).toList(),
//           );
//         },
//       ),
//     );
//   }
// }