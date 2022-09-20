import 'dart:convert';

import 'package:admin_bite/utils/responsive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

import '../../../constants/style.dart';
import '../../utils/global.dart';

class Status {
  String name;
  String customerid;
  String date;
  String bitepoint;
  String price;
  String customer;
  String ranking;
  Color color;
  Status(
      {required this.name,
      required this.color,
      required this.customer,
      required this.ranking,
      required this.customerid,
      required this.date,
      required this.price,
      required this.bitepoint});
}

class Order {
  String name;
  Order({
    required this.name,
  });
}

List<String> _buttonNames = ["New Order", "Excepted", "Completed"];
List<String> _pageNo = ["1", "2", "3", "4"];
int _currentSelectedButton = 0;
int _currentSelectedButton1 = 1;

class ZeroTable extends StatefulWidget {
  const ZeroTable({Key? key}) : super(key: key);

  @override
  State<ZeroTable> createState() => _ZeroTableState();
}

class _ZeroTableState extends State<ZeroTable> {
  final List<String> _banner = [
    "Sr.",
    "Customer ID",
    "Customer Name",
    "Bite Points",
  ];

  bool show = false;
  bool showItems = false;

  bool loader = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBitePoints();
  }

  List<Map<String, dynamic>> zeroHeroesDisplayList = [];
  getBitePoints() async {
    zeroHeroesDisplayList = [];
    QuerySnapshot queryZeroHeroes =
        await FirebaseFirestore.instance.collection('zero_heroes').get();
    for (var element1 in queryZeroHeroes.docs) {
      QuerySnapshot queryUsers = await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: element1.get('uid'))
          .get();

      int bitePoints = 0;
      QuerySnapshot queryBitePoints = await FirebaseFirestore.instance
          .collection('bite_points')
          .where('uid', isEqualTo: element1.get('uid'))
          .get();
      for (var element2 in queryBitePoints.docs) {
        if ((element2.get('date_time') as Timestamp)
                .toDate()
                .isAfter(fromDate!) &&
            (element2.get('date_time') as Timestamp)
                .toDate()
                .isBefore(toDate!.add(const Duration(days: 1)))) {
          bitePoints =
              bitePoints + int.parse(element2.get('points').toString());
        }
      }
      setState(() {
        zeroHeroesDisplayList.add({
          'uid': element1.get('uid'),
          'name': queryUsers.docs[0].get('name'),
          'points': bitePoints
        });
      });
    }
    zeroHeroesDisplayList.sort((a, b) => a['points'].compareTo(b['points']));
    zeroHeroesDisplayList = List.from(zeroHeroesDisplayList.reversed);
    setState(() {
      loader = false;
    });
  }

  DateTime? fromDate = DateTime.now().subtract(const Duration(days: 365));
  DateTime? toDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: fromDate!, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != fromDate) {
      setState(() {
        loader = true;
        getBitePoints();
        fromDate = picked;
      });
    }
  }

  _selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: toDate!, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != toDate) {
      setState(() {
        loader = true;
        getBitePoints();
        toDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        // border: Border.all(color: active.withOpacity(.4), width: .5),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: active.withOpacity(.1),
              blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'From',
                      style: TextStyle(color: customThemeColor, fontSize: 14),
                    ),
                    fromDate == null
                        ? const SizedBox()
                        : Text(fromDate.toString().substring(0, 10).toString())
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  _selectToDate(context);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'To',
                      style: TextStyle(color: customThemeColor, fontSize: 14),
                    ),
                    toDate == null
                        ? const SizedBox()
                        : Text(toDate.toString().substring(0, 10).toString())
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () async {
                  generateCSV();
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: customThemeColor,
                      borderRadius: BorderRadius.circular(50)),
                  child: const Center(
                    child: Text(
                      'Export',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            color: Global.deepOrange,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    _banner.length,
                    (index) => index == 0
                        ? SizedBox(
                            width: 50,
                            child: Text(
                              _banner[index],
                              style: const TextStyle(color: Colors.white),
                            ),
                          )
                        : Expanded(
                            child: Center(
                              child: Text(
                                _banner[index],
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                  )
                  //

                  ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          loader
              ? const Center(child: CircularProgressIndicator())
              : Wrap(
                  children:
                      List.generate(zeroHeroesDisplayList.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SizedBox(
                        height: 60,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 50,
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(color: Colors.black54),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  '${zeroHeroesDisplayList[index]['uid']}',
                                  style: const TextStyle(color: Colors.black54),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  '${zeroHeroesDisplayList[index]['name']}',
                                  style: const TextStyle(color: Colors.black54),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  '${zeroHeroesDisplayList[index]['points']}',
                                  style: const TextStyle(color: Colors.black54),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
          // StreamBuilder<QuerySnapshot>(
          //     stream: FirebaseFirestore.instance
          //         .collection('zero_heroes')
          //         .orderBy('bite_points', descending: true)
          //         .snapshots(),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         if (snapshot.data!.docs.isEmpty) {
          //           return Padding(
          //             padding: const EdgeInsets.only(top: 30),
          //             child: Text(
          //               'Record not found',
          //               textAlign: TextAlign.center,
          //               style: GoogleFonts.nunito(
          //                   fontSize: 20,
          //                   color: Colors.black,
          //                   fontWeight: FontWeight.w600),
          //             ),
          //           );
          //         } else {
          //           return Wrap(
          //             children:
          //                 List.generate(snapshot.data!.docs.length, (index) {
          //               return StreamBuilder<QuerySnapshot>(
          //                   stream: FirebaseFirestore.instance
          //                       .collection('users')
          //                       .where('uid',
          //                           isEqualTo:
          //                               snapshot.data!.docs[index].get('uid'))
          //                       .snapshots(),
          //                   builder: (context, snp) {
          //                     if (snp.hasData) {
          //                       return Padding(
          //                         padding: const EdgeInsets.symmetric(
          //                             horizontal: 15),
          //                         child: SizedBox(
          //                           height: 60,
          //                           child: Row(
          //                             children: [
          //                               SizedBox(
          //                                 width: 50,
          //                                 child: Text(
          //                                   '${index + 1}',
          //                                   style: const TextStyle(
          //                                       color: Colors.black54),
          //                                 ),
          //                               ),
          //                               Expanded(
          //                                 child: Center(
          //                                   child: Text(
          //                                     '${snp.data!.docs[0].get('uid')}',
          //                                     style: const TextStyle(
          //                                         color: Colors.black54),
          //                                   ),
          //                                 ),
          //                               ),
          //                               Expanded(
          //                                 child: Center(
          //                                   child: Text(
          //                                     snp.data!.docs[0].get('name'),
          //                                     style: const TextStyle(
          //                                         color: Colors.black54),
          //                                   ),
          //                                 ),
          //                               ),
          //                               Expanded(
          //                                 child: Center(
          //                                   child: Text(
          //                                     snapshot.data!.docs[index]
          //                                         .get('bite_points')
          //                                         .toString(),
          //                                     style: const TextStyle(
          //                                         color: Colors.black54),
          //                                   ),
          //                                 ),
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                       );
          //                     } else {
          //                       return const SizedBox();
          //                     }
          //                   });
          //             }),
          //           );
          //         }
          //       } else {
          //         return Text(
          //           'Record not found',
          //           textAlign: TextAlign.center,
          //           style: GoogleFonts.poppins(
          //               fontSize: 20,
          //               color: Colors.black,
          //               fontWeight: FontWeight.w600),
          //         );
          //       }
          //     }),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Future<void> generateCSV() async {
    // we will declare the list of headers that we want
    List<String> rowHeader = _banner;
    // here we will make a 2D array to handle a row
    List<List<dynamic>> rows = [];
    //First add entire row header into our first row
    rows.add(rowHeader);

    // QuerySnapshot querySnapshot =
    //     await FirebaseFirestore.instance.collection('zero_heroes').get();

    int? indexPrivate = 1;
    for (var element in zeroHeroesDisplayList) {
      List<dynamic> dataRow = [];
      dataRow.add('$indexPrivate');
      dataRow.add('${element['uid']}');
      dataRow.add('${element['name']}');
      dataRow.add('${element['points']}');
      //lastly add dataRow to our 2d list
      rows.add(dataRow);
      setState(() {
        indexPrivate = indexPrivate! + 1;
      });
    }
    //now convert our 2d array into the csvlist using the plugin of csv
    String csv = const ListToCsvConverter().convert(rows);
    //this csv variable holds entire csv data
    //Now Convert or encode this csv string into utf8
    final bytes = utf8.encode(csv);
    //NOTE THAT HERE WE USED HTML PACKAGE
    final blob = html.Blob([bytes]);
    //It will create downloadable object
    final url = html.Url.createObjectUrlFromBlob(blob);
    //It will create anchor to download the file
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'zeroHeroes.csv';
    //finally add the csv anchor to body
    html.document.body!.children.add(anchor);
    // Cause download by calling this function
    anchor.click();
    //revoke the object
    html.Url.revokeObjectUrl(url);
  }
}
