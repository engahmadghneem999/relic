import 'package:flutter/material.dart';
import 'package:relic/screens/main_page/Airline/widget/col_with_pic_and_row.dart';
import 'package:relic/screens/main_page/Airline/widget/mybold_text.dart';

class Airline extends StatelessWidget {
  List<String> employee = [
    "assets/images/p1.jpg",
    "assets/images/p2.jpg",
    "assets/images/p3.jpg",
    "assets/images/p4.jpg",
    "assets/images/p5.png",
    "assets/images/p6.jpg",
  ];
  List<String> city = ['Paris', 'Tokyo', 'Cairo', 'Dubai', 'Madrid', 'Newyork'];
  List<String> country = ['France', 'Japan', 'Egypt', 'UAE', 'Spain', 'USA'];
  List<double> rate = [4.7, 4.4, 4.5, 4.8, 4.6, 4.7];
//String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 153, 222, 228),
        // appBar: AppBar(
        //   title: const Text('Airline'),
        //   backgroundColor:const Color(0xFF009B8D),
        //   centerTitle: true,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.vertical(
        //       bottom: Radius.circular(20),
        //     ),
        //   ),
        // ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/BB.jpg'))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child:  GridView.builder(
               // physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.1 / 4,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemCount: employee.length,
                itemBuilder: (context, i) {
                  return Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(7),
                            child: Container(
                              height: 250,
                              width: 400,
                              child: Image.asset(
                                employee[i],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Row(children: [
                            const Padding(
                              padding: EdgeInsets.all(3),
                              child: Icon(Icons.location_on_outlined),
                            ),
                            Column(children: [
                              My_Text(text: city[i]),
                              Text(country[i])
                            ]),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(rate[i].toString()),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(Icons.star),
                            ),
                          ])
                        ],
                      ));
                }),
          ),
        ));
  }
}
